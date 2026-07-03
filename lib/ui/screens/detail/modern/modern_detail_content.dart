import 'dart:async';
import 'dart:math' show Random;
import 'dart:ui' show ImageFilter;
import 'package:collection/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';
import '../../../mixins/focus_state_mixin.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../preference/preference_constants.dart';
import '../../../../util/platform_detection.dart';
import '../../../../util/focus/dpad_keys.dart';
import '../../../navigation/destinations.dart';
import '../../../widgets/logo_view.dart';
import '../../../widgets/media_card.dart';
import '../../../widgets/rating_display.dart';
import '../../../widgets/focus/focusable_wrapper.dart';
import '../../../widgets/focus/focusable_toolbar_button.dart';
import '../../../widgets/navigation_layout.dart';
import '../../../widgets/top_toolbar.dart';
import '../../../../data/repositories/seerr_repository.dart';
import '../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../data/services/plugin_sync_service.dart';
import '../item_detail_screen.dart'
    show
        DetailActionButtons,
        DetailCastRow,
        DetailChaptersRow,
        DetailFeaturesRow,
        DetailEpisodeCard,
        DetailTrackList,
        ExpandableBiography,
        selectedMediaSourceForItem,
        PersonDates,
        FilmographyRow,
        SeerrAppearancesRow,
        SeerrCrewCreditsRow;
import 'modern_landscape_layout.dart';
import 'modern_portrait_layout.dart';
import 'widgets/details_tab_bar.dart';
import 'widgets/season_card.dart';
import 'widgets/up_next_card.dart';

double _desktopUiScale({UserPreferences? prefs}) {
  final effectivePrefs = prefs ?? GetIt.instance<UserPreferences>();
  return effectivePrefs.get(UserPreferences.desktopUiScale).scaleFactor;
}

/// "Modern" detail-screen style: one responsive screen that chooses a landscape
/// (TV / desktop / any landscape device) or portrait (phone / tablet portrait)
/// layout. Selected globally via [UserPreferences.detailScreenStyle].
///
/// Mirrors the default content widget's constructor so the swap in
/// `_ItemDetailScreenState._buildBody` is a drop-in, and reuses the public
/// action/content widgets so playback and data logic are shared, not duplicated.
class ModernDetailContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final String? backdropUrl;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final FocusNode? initialFocusNode;
  final bool autoPlay;
  final void Function(Duration position)? onPlayFromChapter;
  final ValueChanged<bool>? onToggleNavbar;
  final bool actionsExpanded;
  final ValueChanged<bool> onActionsExpandedChanged;
  final ValueChanged<AggregatedItem>? onBackdropItemFocused;
  final VoidCallback? onCollapseBiography;

  const ModernDetailContent({
    super.key,
    required this.viewModel,
    required this.prefs,
    this.backdropUrl,
    this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    this.onBackdropItemFocused,
    this.initialFocusNode,
    this.autoPlay = false,
    this.onPlayFromChapter,
    this.onToggleNavbar,
    required this.actionsExpanded,
    required this.onActionsExpandedChanged,
    this.onCollapseBiography,
  });

  @override
  State<ModernDetailContent> createState() => _ModernDetailContentState();
}

class _ModernDetailContentState extends State<ModernDetailContent> {
  int _selectedTab = PlatformDetection.isTV ? -1 : 0;
  bool _landscape = true;
  final Map<String, FocusNode> _trackFocusNodes = {};
  final List<FocusNode> _tabFocusNodes = [];
  final FocusNode _upNextFocusNode = FocusNode(debugLabel: 'modernUpNext');
  final FocusNode _actionRowRightFocusNode = FocusNode(debugLabel: 'actionRowRight');
  final FocusNode _extraFirstFocusNode = FocusNode(debugLabel: 'extraFirstBtn');
  final FocusNode _artistFocusNode = FocusNode(debugLabel: 'albumArtist');
  final FocusNode _audioShowAllFocusNode = FocusNode(debugLabel: 'audioShowAll');
  final FocusNode _subtitleShowAllFocusNode = FocusNode(debugLabel: 'subtitleShowAll');
  final FocusNode _detailsTabFocusNode = FocusNode(debugLabel: 'detailsTabContent');
  final FocusNode _castFirstFocusNode = FocusNode(debugLabel: 'castFirst');
  final FocusNode _crewFirstFocusNode = FocusNode(debugLabel: 'crewFirst');
  final FocusNode _studiosFirstFocusNode = FocusNode(debugLabel: 'studiosFirst');
  final FocusNode _chaptersFirstFocusNode = FocusNode(debugLabel: 'chaptersFirst');
  final FocusNode _similarFirstFocusNode = FocusNode(debugLabel: 'similarFirst');
  final FocusNode _gridFirstFocusNode = FocusNode(debugLabel: 'gridFirst');
  final FocusNode _collectionSortFocusNode = FocusNode(debugLabel: 'collectionSort');
  final FocusNode _moviesFirstFocusNode = FocusNode(debugLabel: 'moviesFirst');
  final FocusNode _seriesFirstFocusNode = FocusNode(debugLabel: 'seriesFirst');
  final FocusNode _seasonsFirstFocusNode = FocusNode(debugLabel: 'seasonsFirst');
  final FocusNode _episodesFirstFocusNode = FocusNode(debugLabel: 'episodesFirst');
  final FocusNode _overviewFocusNode = FocusNode(debugLabel: 'overview');
  final FocusNode _personMoviesFirstFocusNode = FocusNode(debugLabel: 'personMoviesFirst');
  final FocusNode _personSeriesFirstFocusNode = FocusNode(debugLabel: 'personSeriesFirst');
  final FocusNode _personSeerrAppearancesFirstFocusNode = FocusNode(debugLabel: 'personSeerrAppearancesFirst');
  final FocusNode _personSeerrCrewCreditsFirstFocusNode = FocusNode(debugLabel: 'personSeerrCrewCreditsFirst');
  final Map<String, FocusNode> _boxSetHeadingFocusNodes = {};
  final Map<String, FocusNode> _boxSetRowFirstFocusNodes = {};
  late final ScrollController _scrollController = ScrollController();
  String? _seriesLogoTag;
  String? _seriesLogoId;
  bool _showNavbarState = true;
  bool _audioExpanded = false;
  bool _subtitlesExpanded = false;
  int? _loadedAudioIndex;
  int? _loadedSubtitleIndex;
  List<SeerrDiscoverItem>? _seerrAppearances;
  List<SeerrDiscoverItem>? _seerrCrewCredits;
  String? _randomBackdropUrl;

  PlaybackInfoResult? _playbackInfo;
  bool _loadingPlaybackInfo = false;
  String? _loadedPlaybackInfoItemId;

  bool _upNextResolvedThisBuild = false;
  Widget? _upNextCard;

  Future<void> _loadPlaybackInfo(AggregatedItem item) async {
    if (_loadingPlaybackInfo) return;
    if (_playbackInfo != null &&
        _loadedPlaybackInfoItemId == item.id &&
        _loadedAudioIndex == _vm.selectedAudioIndex &&
        _loadedSubtitleIndex == _vm.selectedSubtitleIndex) {
      return;
    }
    
    _loadingPlaybackInfo = true;
    _loadedPlaybackInfoItemId = item.id;
    _loadedAudioIndex = _vm.selectedAudioIndex;
    _loadedSubtitleIndex = _vm.selectedSubtitleIndex;
    // Delay state change slightly to prevent setstate during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });

    try {
      final client = GetIt.instance<MediaServerClient>();
      final manager = GetIt.instance<PlaybackManager>();
      
      final backend = manager.backend;
      final profile = backend?.getDeviceProfile() ?? {};
      final bitrate = profile['MaxStreamingBitrate'] as int?;

      final mediaSource = selectedMediaSourceForItem(item, widget.selectedMediaSourceId);
      final mediaSourceId = mediaSource?['Id']?.toString();

      final request = PlaybackInfoRequest(
        itemId: item.id,
        mediaSourceId: mediaSourceId,
        audioStreamIndex: _vm.selectedAudioIndex,
        subtitleStreamIndex: _vm.selectedSubtitleIndex,
        deviceProfile: profile,
        maxStreamingBitrate: bitrate,
        enableDirectPlay: true,
        enableDirectStream: true,
        enableTranscoding: true,
      );

      final rawInfo = await client.playbackApi.getPlaybackInfo(
        item.id,
        requestBody: request.toJson(),
        userId: client.userId,
      );

      final parsed = PlaybackInfoResult.fromJson(rawInfo);
      if (mounted) {
        // Drop the result if the track selection changed mid-request.
        final stillCurrent = _loadedAudioIndex == _vm.selectedAudioIndex &&
            _loadedSubtitleIndex == _vm.selectedSubtitleIndex;
        setState(() {
          _loadingPlaybackInfo = false;
          if (stillCurrent) _playbackInfo = parsed;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _loadingPlaybackInfo = false;
          _playbackInfo = null;
        });
      }
    }
  }

  void _selectRandomBackdrop() {
    final item = _vm.item;
    if (item == null || item.type != 'Person') return;
    final candidates = <String>[];

    // 1. Local Jellyfin items
    for (final f in _vm.filmographyMovies) {
      if (f.backdropImageTags.isNotEmpty) {
        candidates.add(_vm.imageApi.getBackdropImageUrl(f.id, tag: f.backdropImageTags.first));
      }
    }
    for (final f in _vm.filmographySeries) {
      if (f.backdropImageTags.isNotEmpty) {
        candidates.add(_vm.imageApi.getBackdropImageUrl(f.id, tag: f.backdropImageTags.first));
      }
    }

    if (candidates.isNotEmpty) {
      final randIndex = Random().nextInt(candidates.length);
      setState(() {
        _randomBackdropUrl = candidates[randIndex];
      });
    }
  }

  Future<void> _loadSeerrAppearances() async {
    final item = _vm.item;
    if (item == null || item.type != 'Person') return;
    final tmdbId = item.tmdbId;
    if (tmdbId == null || tmdbId.isEmpty) return;
    if (!GetIt.instance<PluginSyncService>().seerrAvailable) {
      return;
    }

    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      await repo.ensureInitialized();
      final personId = int.tryParse(tmdbId);
      if (personId != null) {
        final credits = await repo.getPersonCombinedCredits(personId);
        const excludedJobs = {'thanks', 'special thanks'};
        final castWithPosters =
            credits.cast.where((i) => i.posterPath != null).toList()
              ..sort((a, b) => a.displayTitle.compareTo(b.displayTitle));
        final crewWithPosters = credits.crew
            .where(
              (i) =>
                  i.posterPath != null &&
                  !excludedJobs.contains(i.job?.toLowerCase()),
            )
            .toList()
          ..sort((a, b) => a.displayTitle.compareTo(b.displayTitle));
        if (mounted) {
          setState(() {
            _seerrAppearances = castWithPosters;
            _seerrCrewCredits = crewWithPosters;
          });
        }
      }
    } catch (e) {
      debugPrint('Error loading Seerr appearances: $e');
    }
  }

  List<AggregatedItem> _sortJellyfinItems(List<AggregatedItem> list) {
    final sortOpt = widget.prefs.get(UserPreferences.personPageSortOption);
    final sorted = List<AggregatedItem>.from(list);
    if (sortOpt == 'alphabetical') {
      sorted.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else {
      final asc = sortOpt == 'releaseDateAsc';
      sorted.sort((a, b) {
        final dateA = a.premiereDate ?? (a.productionYear != null ? DateTime(a.productionYear!) : null);
        final dateB = b.premiereDate ?? (b.productionYear != null ? DateTime(b.productionYear!) : null);
        if (dateA == null && dateB == null) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        }
        if (dateA == null) return 1;
        if (dateB == null) return -1;
        final comp = dateA.compareTo(dateB);
        return asc ? comp : -comp;
      });
    }
    return sorted;
  }

  List<SeerrDiscoverItem> _groupSeerrItems(List<SeerrDiscoverItem> list, bool isCrew) {
    final groupOpt = widget.prefs.get(UserPreferences.personPageGroupItems);
    if (!groupOpt) return list;
    final grouped = <int, List<SeerrDiscoverItem>>{};
    for (final item in list) {
      grouped.putIfAbsent(item.id, () => []).add(item);
    }

    final result = <SeerrDiscoverItem>[];
    for (final entries in grouped.values) {
      final first = entries.first;
      if (entries.length == 1) {
        result.add(first);
        continue;
      }

      if (isCrew) {
        final jobs = entries
            .map((e) => e.job ?? e.department)
            .where((j) => j != null && j.isNotEmpty)
            .map((j) => j!)
            .toSet();
        final combinedJobs = jobs.join(', ');
        result.add(SeerrDiscoverItem(
          id: first.id,
          mediaType: first.mediaType,
          title: first.title,
          name: first.name,
          originalTitle: first.originalTitle,
          originalName: first.originalName,
          posterPath: first.posterPath,
          backdropPath: first.backdropPath,
          overview: first.overview,
          releaseDate: first.releaseDate,
          firstAirDate: first.firstAirDate,
          originalLanguage: first.originalLanguage,
          genreIds: first.genreIds,
          voteAverage: first.voteAverage,
          voteCount: first.voteCount,
          popularity: first.popularity,
          adult: first.adult,
          mediaInfo: first.mediaInfo,
          character: first.character,
          job: combinedJobs.isNotEmpty ? combinedJobs : null,
          department: first.department,
        ));
      } else {
        final characters = entries
            .map((e) => e.character)
            .where((c) => c != null && c.isNotEmpty)
            .map((c) => c!)
            .toSet();
        final combinedCharacters = characters.join(', ');
        result.add(SeerrDiscoverItem(
          id: first.id,
          mediaType: first.mediaType,
          title: first.title,
          name: first.name,
          originalTitle: first.originalTitle,
          originalName: first.originalName,
          posterPath: first.posterPath,
          backdropPath: first.backdropPath,
          overview: first.overview,
          releaseDate: first.releaseDate,
          firstAirDate: first.firstAirDate,
          originalLanguage: first.originalLanguage,
          genreIds: first.genreIds,
          voteAverage: first.voteAverage,
          voteCount: first.voteCount,
          popularity: first.popularity,
          adult: first.adult,
          mediaInfo: first.mediaInfo,
          character: combinedCharacters.isNotEmpty ? combinedCharacters : null,
          job: first.job,
          department: first.department,
        ));
      }
    }
    return result;
  }

  List<SeerrDiscoverItem> _sortSeerrItems(List<SeerrDiscoverItem> list) {
    final sortOpt = widget.prefs.get(UserPreferences.personPageSortOption);
    final sorted = List<SeerrDiscoverItem>.from(list);
    if (sortOpt == 'alphabetical') {
      sorted.sort((a, b) => a.displayTitle.toLowerCase().compareTo(b.displayTitle.toLowerCase()));
    } else {
      final asc = sortOpt == 'releaseDateAsc';
      sorted.sort((a, b) {
        final dateStrA = a.releaseDate ?? a.firstAirDate;
        final dateStrB = b.releaseDate ?? b.firstAirDate;
        if (dateStrA == null && dateStrB == null) {
          return a.displayTitle.toLowerCase().compareTo(b.displayTitle.toLowerCase());
        }
        if (dateStrA == null) return 1;
        if (dateStrB == null) return -1;
        final dateA = DateTime.tryParse(dateStrA);
        final dateB = DateTime.tryParse(dateStrB);
        if (dateA == null && dateB == null) {
          return dateStrA.compareTo(dateStrB);
        }
        if (dateA == null) return 1;
        if (dateB == null) return -1;
        final comp = dateA.compareTo(dateB);
        return asc ? comp : -comp;
      });
    }
    return sorted;
  }

  ItemDetailViewModel get _vm => widget.viewModel;

  @override
  void initState() {
    super.initState();
    
    final FocusOnKeyEventCallback leftToSidebarHandler = (node, event) {
      if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
        if (navbarPosition == NavbarPosition.left) {
          final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
          if (focusNavbar != null) {
            focusNavbar();
            return KeyEventResult.handled;
          }
        }
      }
      return KeyEventResult.ignored;
    };

    _castFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _crewFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _studiosFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _chaptersFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _similarFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _seasonsFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _episodesFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _personMoviesFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _personSeriesFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _personSeerrAppearancesFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _personSeerrCrewCreditsFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _gridFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _moviesFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _seriesFirstFocusNode.onKeyEvent = leftToSidebarHandler;
    _collectionSortFocusNode.onKeyEvent = (node, event) {
      if (event is KeyDownEvent) {
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          if (_vm.playlistItems.isNotEmpty) {
            final firstTrackId = _vm.playlistItems.first.id;
            final firstNode = _trackFocusNodes.putIfAbsent(firstTrackId, () => FocusNode());
            if (firstNode.canRequestFocus) {
              firstNode.requestFocus();
              return KeyEventResult.handled;
            }
          }
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          _focusSelectedTab();
          return KeyEventResult.handled;
        }
      }
      return leftToSidebarHandler(node, event);
    };

    _vm.addListener(_onViewModelChanged);
    _scrollController.addListener(_onScroll);
    if (PlatformDetection.isTV) {
      if (_vm.item?.type == 'Season') {
        _selectedTab = 0;
      } else {
        _selectedTab = -1;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.initialFocusNode?.requestFocus();
      });
      NavigationLayout.focusDetailsPlayButtonNotifier.value = widget.initialFocusNode;
    }
    _loadSeriesLogo();
    _loadSeerrAppearances().then((_) {
      if (mounted) _selectRandomBackdrop();
    });
  }

  @override
  void didUpdateWidget(ModernDetailContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialFocusNode != oldWidget.initialFocusNode && PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.initialFocusNode?.requestFocus();
      });
      NavigationLayout.focusDetailsPlayButtonNotifier.value = widget.initialFocusNode;
    }
    _loadSeerrAppearances().then((_) {
      if (mounted) _selectRandomBackdrop();
    });
  }

  void _onScroll() {
    if (!mounted) return;
    if (PlatformDetection.isTV) return;
    final scrolledDown = _scrollController.offset > 50.0;
    if (scrolledDown && _showNavbarState) {
      _showNavbarState = false;
      widget.onToggleNavbar?.call(false);
    } else if (!scrolledDown && !_showNavbarState) {
      _showNavbarState = true;
      widget.onToggleNavbar?.call(true);
    }
  }

  void _onViewModelChanged() {
    if (mounted) {
      setState(() {});
      _loadSeriesLogo();
      _loadSeerrAppearances().then((_) {
        if (mounted) _selectRandomBackdrop();
      });
    }
  }

  @override
  void dispose() {
    if (NavigationLayout.focusDetailsPlayButtonNotifier.value == widget.initialFocusNode) {
      NavigationLayout.focusDetailsPlayButtonNotifier.value = null;
    }
    _vm.removeListener(_onViewModelChanged);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    for (final node in _trackFocusNodes.values) {
      node.dispose();
    }
    for (final node in _tabFocusNodes) {
      node.dispose();
    }
    _upNextFocusNode.dispose();
    _actionRowRightFocusNode.dispose();
    _extraFirstFocusNode.dispose();
    _artistFocusNode.dispose();
    _audioShowAllFocusNode.dispose();
    _subtitleShowAllFocusNode.dispose();
    _detailsTabFocusNode.dispose();
    _castFirstFocusNode.dispose();
    _crewFirstFocusNode.dispose();
    _studiosFirstFocusNode.dispose();
    _chaptersFirstFocusNode.dispose();
    _similarFirstFocusNode.dispose();
    _gridFirstFocusNode.dispose();
    _collectionSortFocusNode.dispose();
    _moviesFirstFocusNode.dispose();
    _seriesFirstFocusNode.dispose();
    _seasonsFirstFocusNode.dispose();
    _episodesFirstFocusNode.dispose();
    _overviewFocusNode.dispose();
    _personMoviesFirstFocusNode.dispose();
    _personSeriesFirstFocusNode.dispose();
    _personSeerrAppearancesFirstFocusNode.dispose();
    _personSeerrCrewCreditsFirstFocusNode.dispose();
    for (final node in _boxSetHeadingFocusNodes.values) {
      node.dispose();
    }
    for (final node in _boxSetRowFirstFocusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> _loadSeriesLogo() async {
    final item = _vm.item;
    if (item == null) return;
    final seriesId = item.seriesId;
    if (seriesId == null || _seriesLogoId == seriesId) return;

    try {
      final client = GetIt.instance<MediaServerClient>();
      final seriesData = await client.itemsApi.getItem(seriesId);
      final logoTag = (seriesData['ImageTags'] as Map?)?['Logo'] as String?;
      if (mounted) {
        setState(() {
          _seriesLogoTag = logoTag;
          _seriesLogoId = seriesId;
        });
      }
    } catch (_) {}
  }

  /// Right of the action buttons goes to the Up Next card when it's present,
  /// otherwise into the tab rail.
  void _focusRightOfActions() {
    if (_upNextFocusNode.context != null) {
      _upNextFocusNode.requestFocus();
    } else {
      _focusSelectedTab();
    }
  }

  FocusNode _tabNode(int index) {
    while (_tabFocusNodes.length <= index) {
      final node = FocusNode(debugLabel: 'tab_$index');
      _tabFocusNodes.add(node);
    }
    return _tabFocusNodes[index];
  }

  void _focusSelectedTab() {
    // On TV _selectedTab starts at -1 (no tab chosen); guard the list index.
    if (_selectedTab < 0) return;
    _tabNode(_selectedTab).requestFocus();
  }

  // Moves D-pad focus into the first track of the track list, using the same
  // focus node the DetailTrackList attaches to that row.
  void _focusFirstTrack() {
    if (_vm.tracks.isEmpty) return;
    final id = _vm.tracks.first.id;
    _trackFocusNodes.putIfAbsent(id, () => FocusNode()).requestFocus();
  }

  void _onTabBarNavigateDown(int tabIndex) {
    if (_vm.item == null) return;
    if (_selectedTab != tabIndex) {
      _selectTab(tabIndex);
    }
    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      final tabs = _tabsFor(_vm.item!, l10n);
      if (tabIndex >= 0 && tabIndex < tabs.length) {
        final label = tabs[tabIndex].label;
        if (label == l10n.cast) {
          _castFirstFocusNode.requestFocus();
        } else if (label == l10n.crewSection) {
          _crewFirstFocusNode.requestFocus();
        } else if (label == l10n.studios) {
          _studiosFirstFocusNode.requestFocus();
        } else if (label == l10n.chapters) {
          _chaptersFirstFocusNode.requestFocus();
        } else if (label == l10n.details) {
          _detailsTabFocusNode.requestFocus();
        } else if (label == l10n.similar) {
          _similarFirstFocusNode.requestFocus();
        } else if (label == l10n.seasons) {
          _seasonsFirstFocusNode.requestFocus();
        } else if (label == l10n.episodes) {
          _episodesFirstFocusNode.requestFocus();
        } else if (label == l10n.movies) {
          if (_vm.item?.type == 'BoxSet') {
            _moviesFirstFocusNode.requestFocus();
          } else {
            _personMoviesFirstFocusNode.requestFocus();
          }
        } else if (label == l10n.series) {
          if (_vm.item?.type == 'BoxSet') {
            _seriesFirstFocusNode.requestFocus();
          } else {
            _personSeriesFirstFocusNode.requestFocus();
          }
        } else if (label == l10n.appearancesSeerr) {
          _personSeerrAppearancesFirstFocusNode.requestFocus();
        } else if (label == l10n.crewContributionsSeerr) {
          _personSeerrCrewCreditsFirstFocusNode.requestFocus();
        } else if (label == l10n.albums || label == l10n.items || label == l10n.appearances) {
          _gridFirstFocusNode.requestFocus();
        } else if (label == l10n.trackList) {
          _focusFirstTrack();
        } else if (label == l10n.playlist) {
          if (_vm.item?.type == 'BoxSet' && _vm.playlistItems.isNotEmpty) {
            _collectionSortFocusNode.requestFocus();
          } else {
            _focusFirstTrack();
          }
        }
      }
    });
  }

  bool _isAudioItem(AggregatedItem item) {
    final mediaType = item.rawData['MediaType'] as String?;
    return item.type == 'Audio' ||
        item.type == 'AudioBook' ||
        mediaType == 'Audio';
  }

  bool _isAudiobook(AggregatedItem item) =>
      item.type == 'AudioBook' ||
      (item.type == 'Book' && item.rawData['MediaType'] == 'Audio');

  List<_ModernTab> _tabsFor(AggregatedItem item, AppLocalizations l10n) {
    final hasCast = _vm.actors.isNotEmpty;
    final hasCrew = _vm.directors.isNotEmpty || _vm.writers.isNotEmpty;
    final hasStudios = item.studios.isNotEmpty;
    final hasSimilar = _vm.similar.isNotEmpty;
    final hasFeatures = _vm.features.isNotEmpty;

    final cast = _ModernTab(l10n.cast, _castTab);
    final crew = _ModernTab(l10n.crewSection, _crewTab);
    final studios = _ModernTab(l10n.studios, _studiosTab);
    final chapters = _ModernTab(l10n.chapters, _chaptersTab);
    final details = _ModernTab(l10n.details, _detailsTab);
    final similar = _ModernTab(l10n.similar, (_, _) => _similarTab(context, _vm.similar));

    switch (item.type) {
      case 'Series':
        return [
          if (_vm.seasons.isNotEmpty) _ModernTab(l10n.seasons, _seasonsTab),
          _ModernTab(l10n.episodes, _seriesEpisodesTab),
          if (hasCast) cast,
          if (hasCrew) crew,
          if (hasStudios) studios,
          if (item.chapters.isNotEmpty) chapters,
          details,
          if (hasFeatures) _ModernTab(l10n.extras, _extrasTab),
          if (hasSimilar) similar,
        ];
      case 'Season':
        return [
          if (_vm.episodes.isNotEmpty)
            _ModernTab(l10n.episodes, _episodeListTab),
          if (hasCast) cast,
          if (hasCrew) crew,
          if (hasStudios) studios,
          if (item.chapters.isNotEmpty) chapters,
          if (hasFeatures) _ModernTab(l10n.extras, _extrasTab),
        ];
      case 'Episode':
        return [
          if (_vm.episodes.isNotEmpty)
            _ModernTab(l10n.episodes, _episodeListTab),
          if (hasCast) cast,
          if (hasCrew) crew,
          if (hasStudios) studios,
          if (item.chapters.isNotEmpty) chapters,
          details,
          if (hasSimilar) similar,
        ];
      case 'MusicAlbum':
      case 'Playlist':
      case 'AudioBook':
        return [
          if (_vm.tracks.isNotEmpty) _ModernTab(l10n.trackList, _tracksTab),
          details,
          if (hasSimilar) similar,
        ];
      case 'MusicArtist':
        return [
          if (_vm.albums.isNotEmpty)
            _ModernTab(l10n.albums, (_, _) => _itemGrid(_vm.albums, aspectRatio: 1.0)),
          if (hasSimilar) similar,
        ];
      case 'Person':
        final movies = _sortJellyfinItems(_vm.filmographyMovies);
        final series = _sortJellyfinItems(_vm.filmographySeries);
        final hasSeerrAppearances = _seerrAppearances != null && _seerrAppearances!.isNotEmpty;
        final hasSeerrCrewCredits = _seerrCrewCredits != null && _seerrCrewCredits!.isNotEmpty;
        final sortedSeerrAppearances = hasSeerrAppearances ? _sortSeerrItems(_groupSeerrItems(_seerrAppearances!, false)) : const <SeerrDiscoverItem>[];
        final sortedSeerrCrewCredits = hasSeerrCrewCredits ? _sortSeerrItems(_groupSeerrItems(_seerrCrewCredits!, true)) : const <SeerrDiscoverItem>[];

        return [
          if (movies.isNotEmpty)
            _ModernTab(l10n.movies, (context, item) => _moviesTab(context, movies)),
          if (series.isNotEmpty)
            _ModernTab(l10n.series, (context, item) => _seriesTab(context, series)),
          if (sortedSeerrAppearances.isNotEmpty)
            _ModernTab(l10n.appearancesSeerr, (context, item) => _seerrAppearancesTab(context, sortedSeerrAppearances)),
          if (sortedSeerrCrewCredits.isNotEmpty)
            _ModernTab(l10n.crewContributionsSeerr, (context, item) => _seerrCrewCreditsTab(context, sortedSeerrCrewCredits)),
          if (movies.isEmpty && series.isEmpty && sortedSeerrAppearances.isEmpty && sortedSeerrCrewCredits.isEmpty && _vm.filmography.isNotEmpty)
            _ModernTab(l10n.appearances, (_, _) => _itemGrid(_sortJellyfinItems(_vm.filmography))),
        ];
      case 'BoxSet':
        final moviesList = _vm.collectionItems.where((i) => i.type == 'Movie').toList();
        moviesList.sort((a, b) {
          final aIndex = _vm.playlistItems.indexWhere((p) => p.id == a.id);
          final bIndex = _vm.playlistItems.indexWhere((p) => p.id == b.id);
          if (aIndex == -1 && bIndex == -1) return 0;
          if (aIndex == -1) return 1;
          if (bIndex == -1) return -1;
          return aIndex.compareTo(bIndex);
        });

        final seriesList = _vm.collectionItems.where((i) => i.type == 'Series').toList();
        seriesList.sort((a, b) {
          final aIndex = _vm.playlistItems.indexWhere((p) => p.seriesId == a.id || p.id == a.id);
          final bIndex = _vm.playlistItems.indexWhere((p) => p.seriesId == b.id || p.id == b.id);
          if (aIndex == -1 && bIndex == -1) return 0;
          if (aIndex == -1) return 1;
          if (bIndex == -1) return -1;
          return aIndex.compareTo(bIndex);
        });

        return [
          if (_vm.playlistItems.isNotEmpty)
            _ModernTab(
              l10n.playlist,
              (context, item) {
                final listWidget = DetailTrackList(
                  tracks: _vm.playlistItems,
                  imageApi: _vm.imageApi,
                  isPlaylist: true,
                  getFocusNode: (id) =>
                      _trackFocusNodes.putIfAbsent(id, () => FocusNode()),
                  onPlayTrack: (index) => _playPlaylistTrack(context, index),
                  reorderable: _vm.collectionSort == CollectionSortOption.custom,
                  onReorder: (oldIndex, newIndex) {
                    var target = newIndex;
                    if (target > oldIndex) {
                      target -= 1;
                    }
                    _vm.reorderCollectionPlaylistItem(oldIndex, target);
                  },
                  onMoveUp: (index) => _vm.reorderCollectionPlaylistItem(index, index - 1),
                  onMoveDown: (index) => _vm.reorderCollectionPlaylistItem(index, index + 1),
                  onFirstTrackUp: () => _collectionSortFocusNode.requestFocus(),
                  onTrackFocused: widget.onBackdropItemFocused,
                );

                return Focus(
                  canRequestFocus: false,
                  onFocusChange: (focused) {
                    if (focused && mounted) {
                      widget.onToggleNavbar?.call(false);
                    } else if (!focused && mounted) {
                      widget.onToggleNavbar?.call(true);
                    }
                  },
                  onKeyEvent: (node, event) {
                    return KeyEventResult.ignored;
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              children: [
                                FocusableToolbarButton(
                                  icon: Icons.sort_rounded,
                                  focusNode: _collectionSortFocusNode,
                                  tooltip: l10n.resetSort,
                                  onTap: () => _showCollectionSortDialog(context),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Sort: ${_getCollectionSortLabel(_vm.collectionSort, l10n)}',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          listWidget,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          if (moviesList.isNotEmpty)
            _ModernTab(l10n.movies, (context, item) => _mediaGrid(context, moviesList, firstFocusNode: _moviesFirstFocusNode)),
          if (seriesList.isNotEmpty)
            _ModernTab(l10n.series, (context, item) => _mediaGrid(context, seriesList, firstFocusNode: _seriesFirstFocusNode)),
          if (hasCast) _ModernTab(l10n.cast, _boxSetCastTab),
          if (hasCrew) _ModernTab(l10n.crewSection, _boxSetCrewTab),
          if (hasStudios) studios,
        ];
      default:
        return [
          if (hasCast) cast,
          if (hasCrew) crew,
          if (hasStudios) studios,
          if (item.chapters.isNotEmpty) chapters,
          details,
          if (hasFeatures) _ModernTab(l10n.extras, _extrasTab),
          if (hasSimilar) similar,
        ];
    }
  }

  Widget _seasonsTab(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final counts = _episodeCountsBySeason();
    final showPosterUrl = _imageUrl(item);
    // Determine which season contains the "next up" episode, mirroring the
    // episode-card logic: prefer _vm.nextUp.seasonId, fall back to the first
    // unplayed episode's seasonId so the cyan border always renders correctly.
    final nextUpSeasonId = _vm.nextUp?.seasonId ??
        _vm.seriesEpisodes.firstWhereOrNull((e) => !e.isPlayed)?.seasonId;
    SeasonCard buildSeasonCard(
      int i, {
      double? width,
      double? height,
      bool topRow = true,
    }) =>
        SeasonCard(
          title: _vm.seasons[i].name,
          subtitle: l10n.episodeCount(
            counts[_vm.seasons[i].id] ?? _vm.seasons[i].childCount ?? 0,
          ),
          imageUrl: _imageUrl(_vm.seasons[i]) ?? showPosterUrl,
          isFallbackImage: _imageUrl(_vm.seasons[i]) == null,
          landscape: _landscape,
          isNextUp: _vm.seasons[i].id == nextUpSeasonId,
          onNavigateUp: topRow ? _focusSelectedTab : null,
          focusNode: i == 0 ? _seasonsFirstFocusNode : null,
          width: width,
          height: height,
          autoScroll: true,
          onTap: () => context.push(
            Destinations.item(_vm.seasons[i].id, serverId: _vm.seasons[i].serverId),
          ),
        );
    final seasonLabelStyle = textTheme.labelMedium?.copyWith(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      fontSize: 10,
    );
    // Centered when it fits, horizontally scrollable when the name is longer
    // than the card, so a long season name never wraps to a second line.
    Widget seasonLabel(int i, double viewportWidth) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: viewportWidth),
            child: Text(
              _vm.seasons[i].name.toUpperCase(),
              maxLines: 1,
              softWrap: false,
              style: seasonLabelStyle,
              textAlign: TextAlign.center,
            ),
          ),
        );
    final child = LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        final columns = (constraints.maxWidth / (_landscape ? 160.0 : 130.0))
            .floor()
            .clamp(3, _landscape ? 8 : 6);
        final cardWidth =
            ((constraints.maxWidth - spacing * (columns - 1)) / columns)
                .floorToDouble();
        final cardHeight = cardWidth * 1.5;
        return Wrap(
          spacing: spacing,
          runSpacing: 16,
          children: [
            for (var i = 0; i < _vm.seasons.length; i++)
              SizedBox(
                width: cardWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    seasonLabel(i, cardWidth),
                    const SizedBox(height: 6),
                    buildSeasonCard(
                      i,
                      width: cardWidth,
                      height: cardHeight,
                      topRow: i < columns,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );

    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: child,
      ),
    );
  }

  Widget _episodeListTab(BuildContext context, AggregatedItem item) {
    // For Season pages _vm.nextUp is null (the API call uses seriesId which
    // on a Season item resolves to nothing). Fall back to the first unplayed
    // episode so the cyan "next up" border still renders correctly.
    final nextUpId = _vm.nextUp?.id ??
        _vm.episodes.firstWhereOrNull((e) => !e.isPlayed)?.id;

    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < _vm.episodes.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: DetailEpisodeCard(
                episode: _vm.episodes[i],
                imageApi: _vm.imageApi,
                onChanged: () => _vm.load(),
                isActive: _vm.episodes[i].id == nextUpId,
                focusNode: i == 0 ? _episodesFirstFocusNode : null,
                onKeyEvent: i == 0
                    ? (node, event) {
                        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
                          _focusSelectedTab();
                          return KeyEventResult.handled;
                        }
                        return KeyEventResult.ignored;
                      }
                    : null,
              ),
            ),
        ],
      ),
    );
  }

  Map<String, int> _episodeCountsBySeason() {
    final counts = <String, int>{};
    for (final e in _vm.seriesEpisodes) {
      final id = e.seasonId;
      if (id == null) continue;
      counts[id] = (counts[id] ?? 0) + 1;
    }
    return counts;
  }

  final Set<int> _expandedSeasons = {};
  bool _initializedExpandedSeasons = false;

  /// All episodes of a Series grouped into collapsible season containers.
  Widget _seriesEpisodesTab(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final episodes = _vm.seriesEpisodes;
    if (episodes.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    final sorted = [...episodes]..sort((a, b) {
        final sa = a.parentIndexNumber ?? 0;
        final sb = b.parentIndexNumber ?? 0;
        if (sa != sb) return sa.compareTo(sb);
        return (a.indexNumber ?? 0).compareTo(b.indexNumber ?? 0);
      });

    // Group by season
    final Map<int, List<AggregatedItem>> seasonGroups = {};
    for (final episode in sorted) {
      final s = episode.parentIndexNumber ?? 0;
      seasonGroups.putIfAbsent(s, () => []).add(episode);
    }

    if (!_initializedExpandedSeasons && seasonGroups.isNotEmpty) {
      _initializedExpandedSeasons = true;
      final nextUpSeason = _vm.nextUp?.parentIndexNumber;
      if (nextUpSeason != null && seasonGroups.containsKey(nextUpSeason)) {
        _expandedSeasons.add(nextUpSeason);
      } else {
        _expandedSeasons.add(seasonGroups.keys.first);
      }
    }

    final children = <Widget>[];
    for (final entry in seasonGroups.entries) {
      final season = entry.key;
      final eps = entry.value;
      final isExpanded = _expandedSeasons.contains(season);
      final isFirst = children.isEmpty;

      children.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: FocusableWrapper(
            onNavigateUp: isFirst ? _focusSelectedTab : null,
            focusNode: isFirst ? _episodesFirstFocusNode : null,
            onSelect: () {
              setState(() {
                if (_expandedSeasons.contains(season)) {
                  _expandedSeasons.remove(season);
                } else {
                  _expandedSeasons.add(season);
                }
              });
            },
            borderRadius: 8,
            suppressFocusGlow: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    isExpanded ? Icons.expand_more : Icons.chevron_right,
                    color: Colors.white70,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.seasonNumber(season),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '(${eps.length})',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white38,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      if (isExpanded) {
        children.add(
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: eps.map((episode) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: DetailEpisodeCard(
                    episode: episode,
                    imageApi: _vm.imageApi,
                    onChanged: () => _vm.load(),
                    isActive: episode.id == _vm.nextUp?.id,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }
    }

    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _castTab(BuildContext context, AggregatedItem item) => SizedBox(
        height: 200,
        child: Focus(
          canRequestFocus: false,
          onFocusChange: (focused) {
            if (focused && mounted) {
              widget.onToggleNavbar?.call(false);
            } else if (!focused && mounted) {
              widget.onToggleNavbar?.call(true);
            }
          },
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
              _focusSelectedTab();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: DetailCastRow(
            people: _vm.actors,
            imageApi: _vm.imageApi,
            serverId: item.serverId,
            firstItemFocusNode: _castFirstFocusNode,
            onNavigateUp: _focusSelectedTab,
            onItemKeyEvent: (index, event) {
              if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowRight && index == _vm.actors.length - 1) {
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
          ),
        ),
      );

  Widget _crewTab(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final Map<String, Map<String, dynamic>> merged = {};
    for (final d in _vm.directors) {
      final id = d['Id']?.toString() ?? d['Name']?.toString() ?? '';
      if (id.isEmpty) continue;
      final roleStr = d['Role']?.toString().trim();
      final role = (roleStr != null && roleStr.isNotEmpty) ? roleStr : l10n.director;
      merged[id] = {
        ...d,
        'Roles': <String>{role},
      };
    }
    for (final w in _vm.writers) {
      final id = w['Id']?.toString() ?? w['Name']?.toString() ?? '';
      if (id.isEmpty) continue;
      final roleStr = w['Role']?.toString().trim();
      final role = (roleStr != null && roleStr.isNotEmpty) ? roleStr : l10n.writer;
      if (merged.containsKey(id)) {
        final roles = merged[id]!['Roles'] as Set<String>;
        roles.add(role);
      } else {
        merged[id] = {
          ...w,
          'Roles': <String>{role},
        };
      }
    }
    final crew = merged.values.map((person) {
      final roles = person['Roles'] as Set<String>;
      final normalizedRoles = roles.map((r) {
        final trimmed = r.trim();
        if (trimmed.isEmpty) return '';
        return trimmed.split(RegExp(r'[;,]'))
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty)
            .map((s) {
              if (s == s.toUpperCase() && s.length > 1) {
                return s[0] + s.substring(1).toLowerCase();
              }
              return s;
            })
            .join('\n');
      }).expand((r) => r.split('\n')).where((r) => r.isNotEmpty).toSet();

      return {
        ...person,
        'Role': normalizedRoles.join('\n'),
      };
    }).toList();

    return SizedBox(
      height: 200,
      child: Focus(
        canRequestFocus: false,
        onFocusChange: (focused) {
          if (focused && mounted) {
            widget.onToggleNavbar?.call(false);
          } else if (!focused && mounted) {
            widget.onToggleNavbar?.call(true);
          }
        },
        onKeyEvent: (node, event) {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _focusSelectedTab();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        child: DetailCastRow(
          people: crew,
          imageApi: _vm.imageApi,
          serverId: item.serverId,
          firstItemFocusNode: _crewFirstFocusNode,
          onNavigateUp: _focusSelectedTab,
          onItemKeyEvent: (index, event) {
            if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowRight && index == crew.length - 1) {
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
        ),
      ),
    );
  }

  bool _initializedBoxSetCastExpanded = false;
  bool _initializedBoxSetCrewExpanded = false;
  final Set<String> _expandedCollectionCastItems = {};
  final Set<String> _expandedCollectionCrewItems = {};

  Widget _boxSetCastTab(BuildContext context, AggregatedItem item) {
    final sortedItems = [..._vm.collectionItems];
    // Sort items by their order in playlistItems (playlist order)
    sortedItems.sort((a, b) {
      final aIndex = _vm.playlistItems.indexWhere((p) => p.seriesId == a.id || p.id == a.id);
      final bIndex = _vm.playlistItems.indexWhere((p) => p.seriesId == b.id || p.id == b.id);
      if (aIndex == -1 && bIndex == -1) return 0;
      if (aIndex == -1) return 1;
      if (bIndex == -1) return -1;
      return aIndex.compareTo(bIndex);
    });

    if (!_initializedBoxSetCastExpanded && sortedItems.isNotEmpty) {
      _initializedBoxSetCastExpanded = true;
      _expandedCollectionCastItems.add(sortedItems.first.id);
    }

    final children = <Widget>[];
    for (var i = 0; i < sortedItems.length; i++) {
      final childItem = sortedItems[i];
      final people = childItem.rawData['People'] as List?;
      if (people == null || people.isEmpty) continue;
      final childActors = people.cast<Map<String, dynamic>>().where((p) {
        final type = p['Type'] as String?;
        return type == 'Actor' || type == 'GuestStar';
      }).toList();
      if (childActors.isEmpty) continue;

      final isExpanded = _expandedCollectionCastItems.contains(childItem.id);
      
      final headingNode = i == 0
          ? _castFirstFocusNode
          : _boxSetHeadingFocusNodes.putIfAbsent(childItem.id, () => FocusNode(debugLabel: 'heading_cast_${childItem.name}'));
      final rowFirstNode = _boxSetRowFirstFocusNodes.putIfAbsent(childItem.id, () => FocusNode(debugLabel: 'row_first_cast_${childItem.name}'));

      children.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: FocusableWrapper(
            focusNode: headingNode,
            onFocusChange: (focused) {
              if (focused && mounted) {
                Scrollable.ensureVisible(
                  context,
                  duration: const Duration(milliseconds: 150),
                  alignment: 0.3,
                );
              }
            },
            onNavigateLeft: () {
              final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
              if (navbarPosition == NavbarPosition.left) {
                final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
                if (focusNavbar != null) {
                  focusNavbar();
                }
              }
            },
            onNavigateRight: () {}, // Cap on right
            onNavigateUp: () {
              if (i == 0) {
                _focusSelectedTab();
              } else {
                final prevItem = sortedItems[i - 1];
                final prevExpanded = _expandedCollectionCastItems.contains(prevItem.id);
                if (prevExpanded) {
                  _boxSetRowFirstFocusNodes[prevItem.id]?.requestFocus();
                } else {
                  if (i - 1 == 0) {
                    _castFirstFocusNode.requestFocus();
                  } else {
                    _boxSetHeadingFocusNodes[prevItem.id]?.requestFocus();
                  }
                }
              }
            },
            onNavigateDown: () {
              if (isExpanded) {
                rowFirstNode.requestFocus();
              } else if (i < sortedItems.length - 1) {
                final nextItem = sortedItems[i + 1];
                final nextNode = _boxSetHeadingFocusNodes.putIfAbsent(nextItem.id, () => FocusNode(debugLabel: 'heading_cast_${nextItem.name}'));
                nextNode.requestFocus();
              }
            },
            onSelect: () {
              setState(() {
                if (_expandedCollectionCastItems.contains(childItem.id)) {
                  _expandedCollectionCastItems.remove(childItem.id);
                } else {
                  _expandedCollectionCastItems.add(childItem.id);
                }
              });
            },
            borderRadius: 8,
            suppressFocusGlow: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    isExpanded ? Icons.expand_more : Icons.chevron_right,
                    color: Colors.white70,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    childItem.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '(${childActors.length})',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white38,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      if (isExpanded) {
        children.add(
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            child: Focus(
              canRequestFocus: false,
              onFocusChange: (focused) {
                if (focused && mounted) {
                  Scrollable.ensureVisible(
                    context,
                    duration: const Duration(milliseconds: 150),
                    alignment: 0.5,
                  );
                }
              },
              child: SizedBox(
                height: 200,
                child: DetailCastRow(
                  people: childActors,
                  imageApi: _vm.imageApi,
                  serverId: childItem.serverId,
                  firstItemFocusNode: rowFirstNode,
                  onNavigateUp: () {
                    headingNode.requestFocus();
                  },
                  onItemKeyEvent: (index, event) {
                    if (event is KeyDownEvent || event is KeyRepeatEvent) {
                      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                        if (i < sortedItems.length - 1) {
                          final nextItem = sortedItems[i + 1];
                          final nextNode = _boxSetHeadingFocusNodes.putIfAbsent(nextItem.id, () => FocusNode(debugLabel: 'heading_cast_${nextItem.name}'));
                          nextNode.requestFocus();
                        }
                        return KeyEventResult.handled;
                      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                        headingNode.requestFocus();
                        return KeyEventResult.handled;
                      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft && index == 0) {
                        final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
                        if (navbarPosition == NavbarPosition.left) {
                          final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
                          if (focusNavbar != null) {
                            focusNavbar();
                            return KeyEventResult.handled;
                          }
                        }
                        return KeyEventResult.handled; // Cap on left
                      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight && index == childActors.length - 1) {
                        return KeyEventResult.handled; // Cap on right
                      }
                    }
                    return KeyEventResult.ignored;
                  },
                ),
              ),
            ),
          ),
        );
      }
    }

    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _boxSetCrewTab(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final sortedItems = [..._vm.collectionItems];
    // Sort items by their order in playlistItems (playlist order)
    sortedItems.sort((a, b) {
      final aIndex = _vm.playlistItems.indexWhere((p) => p.seriesId == a.id || p.id == a.id);
      final bIndex = _vm.playlistItems.indexWhere((p) => p.seriesId == b.id || p.id == b.id);
      if (aIndex == -1 && bIndex == -1) return 0;
      if (aIndex == -1) return 1;
      if (bIndex == -1) return -1;
      return aIndex.compareTo(bIndex);
    });

    if (!_initializedBoxSetCrewExpanded && sortedItems.isNotEmpty) {
      _initializedBoxSetCrewExpanded = true;
      _expandedCollectionCrewItems.add(sortedItems.first.id);
    }

    final children = <Widget>[];
    for (var i = 0; i < sortedItems.length; i++) {
      final childItem = sortedItems[i];
      final people = childItem.rawData['People'] as List?;
      if (people == null || people.isEmpty) continue;
      final childCrewRaw = people.cast<Map<String, dynamic>>().where((p) {
        final type = p['Type'] as String?;
        return type == 'Director' || type == 'Writer';
      }).toList();
      if (childCrewRaw.isEmpty) continue;

      final Map<String, Map<String, dynamic>> merged = {};
      for (final person in childCrewRaw) {
        final id = person['Id']?.toString() ?? person['Name']?.toString() ?? '';
        if (id.isEmpty) continue;
        final type = person['Type'] as String?;
        final roleStr = person['Role']?.toString().trim();
        final role = (roleStr != null && roleStr.isNotEmpty)
            ? roleStr
            : (type == 'Director' ? l10n.director : l10n.writer);
        if (merged.containsKey(id)) {
          final roles = merged[id]!['Roles'] as Set<String>;
          roles.add(role);
        } else {
          merged[id] = {
            ...person,
            'Roles': <String>{role},
          };
        }
      }
      final childCrew = merged.values.map((person) {
        final roles = person['Roles'] as Set<String>;
        final normalizedRoles = roles.map((r) {
          final trimmed = r.trim();
          if (trimmed.isEmpty) return '';
          return trimmed.split(RegExp(r'[;,]'))
              .map((s) => s.trim())
              .where((s) => s.isNotEmpty)
              .map((s) {
                if (s == s.toUpperCase() && s.length > 1) {
                  return s[0] + s.substring(1).toLowerCase();
                }
                return s;
              })
              .join('\n');
        }).expand((r) => r.split('\n')).where((r) => r.isNotEmpty).toSet();

        return {
          ...person,
          'Role': normalizedRoles.join('\n'),
        };
      }).toList();

      if (childCrew.isEmpty) continue;

      final isExpanded = _expandedCollectionCrewItems.contains(childItem.id);
      
      final headingNode = i == 0
          ? _crewFirstFocusNode
          : _boxSetHeadingFocusNodes.putIfAbsent(childItem.id, () => FocusNode(debugLabel: 'heading_crew_${childItem.name}'));
      final rowFirstNode = _boxSetRowFirstFocusNodes.putIfAbsent(childItem.id, () => FocusNode(debugLabel: 'row_first_crew_${childItem.name}'));

      children.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: FocusableWrapper(
            focusNode: headingNode,
            onFocusChange: (focused) {
              if (focused && mounted) {
                Scrollable.ensureVisible(
                  context,
                  duration: const Duration(milliseconds: 150),
                  alignment: 0.3,
                );
              }
            },
            onNavigateLeft: () {
              final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
              if (navbarPosition == NavbarPosition.left) {
                final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
                if (focusNavbar != null) {
                  focusNavbar();
                }
              }
            },
            onNavigateRight: () {}, // Cap on right
            onNavigateUp: () {
              if (i == 0) {
                _focusSelectedTab();
              } else {
                final prevItem = sortedItems[i - 1];
                final prevExpanded = _expandedCollectionCrewItems.contains(prevItem.id);
                if (prevExpanded) {
                  _boxSetRowFirstFocusNodes[prevItem.id]?.requestFocus();
                } else {
                  if (i - 1 == 0) {
                    _crewFirstFocusNode.requestFocus();
                  } else {
                    _boxSetHeadingFocusNodes[prevItem.id]?.requestFocus();
                  }
                }
              }
            },
            onNavigateDown: () {
              if (isExpanded) {
                rowFirstNode.requestFocus();
              } else if (i < sortedItems.length - 1) {
                final nextItem = sortedItems[i + 1];
                final nextNode = _boxSetHeadingFocusNodes.putIfAbsent(nextItem.id, () => FocusNode(debugLabel: 'heading_crew_${nextItem.name}'));
                nextNode.requestFocus();
              }
            },
            onSelect: () {
              setState(() {
                if (_expandedCollectionCrewItems.contains(childItem.id)) {
                  _expandedCollectionCrewItems.remove(childItem.id);
                } else {
                  _expandedCollectionCrewItems.add(childItem.id);
                }
              });
            },
            borderRadius: 8,
            suppressFocusGlow: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    isExpanded ? Icons.expand_more : Icons.chevron_right,
                    color: Colors.white70,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    childItem.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '(${childCrew.length})',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white38,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      if (isExpanded) {
        children.add(
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            child: Focus(
              canRequestFocus: false,
              onFocusChange: (focused) {
                if (focused && mounted) {
                  Scrollable.ensureVisible(
                    context,
                    duration: const Duration(milliseconds: 150),
                    alignment: 0.5,
                  );
                }
              },
              child: SizedBox(
                height: 200,
                child: DetailCastRow(
                  people: childCrew,
                  imageApi: _vm.imageApi,
                  serverId: childItem.serverId,
                  firstItemFocusNode: rowFirstNode,
                  onNavigateUp: () {
                    headingNode.requestFocus();
                  },
                  onItemKeyEvent: (index, event) {
                    if (event is KeyDownEvent || event is KeyRepeatEvent) {
                      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                        if (i < sortedItems.length - 1) {
                          final nextItem = sortedItems[i + 1];
                          final nextNode = _boxSetHeadingFocusNodes.putIfAbsent(nextItem.id, () => FocusNode(debugLabel: 'heading_crew_${nextItem.name}'));
                          nextNode.requestFocus();
                        }
                        return KeyEventResult.handled;
                      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                        headingNode.requestFocus();
                        return KeyEventResult.handled;
                      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft && index == 0) {
                        final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
                        if (navbarPosition == NavbarPosition.left) {
                          final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
                          if (focusNavbar != null) {
                            focusNavbar();
                            return KeyEventResult.handled;
                          }
                        }
                        return KeyEventResult.handled; // Cap on left
                      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight && index == childCrew.length - 1) {
                        return KeyEventResult.handled; // Cap on right
                      }
                    }
                    return KeyEventResult.ignored;
                  },
                ),
              ),
            ),
          ),
        );
      }
    }

    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _buildStudioFallback(BuildContext context, String name) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.25),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.05),
            Colors.transparent,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name.toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      ),
    );
  }

  Widget _studiosTab(BuildContext context, AggregatedItem item) {
    final studios = item.studios;
    if (studios.isEmpty) {
      return const SizedBox.shrink();
    }

    final isMobile = _landscape == false;
    final desktopScale = widget.prefs.get(UserPreferences.desktopUiScale).scaleFactor;
    final cardWidth = isMobile ? 120.0 : 160.0 * desktopScale;
    final cardHeight = isMobile ? 80.0 : 100.0 * desktopScale;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: cardHeight + 20,
        child: Focus(
          canRequestFocus: false,
          onFocusChange: (focused) {
            if (focused && mounted) {
              widget.onToggleNavbar?.call(false);
            } else if (!focused && mounted) {
              widget.onToggleNavbar?.call(true);
            }
          },
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
              _focusSelectedTab();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: studios.length,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final studio = studios[index];
              final name = studio['Name']?.toString() ?? '';
              final studioId = studio['Id']?.toString();

              final imageUrl = studioId != null
                  ? _vm.imageApi.getPrimaryImageUrl(
                      studioId,
                      maxHeight: isMobile ? 100 : (160 * desktopScale).round(),
                    )
                  : null;

              return FocusableWrapper(
                focusNode: index == 0 ? _studiosFirstFocusNode : null,
                onSelect: name.isNotEmpty
                    ? () => context.push(Destinations.searchWith('studio:$name'))
                    : null,
                borderRadius: 12,
                suppressFocusGlow: true,
                onNavigateUp: _focusSelectedTab,
                onNavigateRight: index == studios.length - 1 ? () {} : null,
                child: Container(
                  width: cardWidth,
                  height: cardHeight,
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: AppRadius.circular(12),
                    child: imageUrl != null
                        ? CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => _buildStudioFallback(context, name),
                            errorWidget: (context, url, error) => _buildStudioFallback(context, name),
                          )
                        : _buildStudioFallback(context, name),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _moviesTab(BuildContext context, List<AggregatedItem> movies, {FocusNode? focusNode}) {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: FilmographyRow(
        items: movies,
        imageApi: _vm.imageApi,
        prefs: widget.prefs,
        firstFocusNode: focusNode ?? _personMoviesFirstFocusNode,
        onItemKeyEvent: (index, event) {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _focusSelectedTab();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
      ),
    );
  }

  Widget _seriesTab(BuildContext context, List<AggregatedItem> series, {FocusNode? focusNode}) {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: FilmographyRow(
        items: series,
        imageApi: _vm.imageApi,
        prefs: widget.prefs,
        firstFocusNode: focusNode ?? _personSeriesFirstFocusNode,
        onItemKeyEvent: (index, event) {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _focusSelectedTab();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
      ),
    );
  }

  Widget _seerrAppearancesTab(BuildContext context, List<SeerrDiscoverItem> items) {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: SeerrAppearancesRow(
        items: items,
        prefs: widget.prefs,
        firstFocusNode: _personSeerrAppearancesFirstFocusNode,
        onItemKeyEvent: (index, event) {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _focusSelectedTab();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
      ),
    );
  }

  Widget _seerrCrewCreditsTab(BuildContext context, List<SeerrDiscoverItem> items) {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: SeerrCrewCreditsRow(
        items: items,
        prefs: widget.prefs,
        firstFocusNode: _personSeerrCrewCreditsFirstFocusNode,
        onItemKeyEvent: (index, event) {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _focusSelectedTab();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
      ),
    );
  }

  Widget _chaptersTab(BuildContext context, AggregatedItem item) {
    if (item.chapters.isEmpty) {
      return const SizedBox.shrink();
    }
    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
          _focusSelectedTab();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: DetailChaptersRow(
        item: item,
        imageApi: _vm.imageApi,
        onPlayFromChapter: widget.onPlayFromChapter ?? (_) {},
        firstItemFocusNode: _chaptersFirstFocusNode,
      ),
    );
  }

  Widget _extrasTab(BuildContext context, AggregatedItem item) => SizedBox(
        height: 200,
        child: Focus(
          canRequestFocus: false,
          onFocusChange: (focused) {
            if (focused && mounted) {
              widget.onToggleNavbar?.call(false);
            } else if (!focused && mounted) {
              widget.onToggleNavbar?.call(true);
            }
          },
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
              _focusSelectedTab();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: DetailFeaturesRow(
            items: _vm.features,
            imageApi: _vm.imageApi,
            prefs: widget.prefs,
          ),
        ),
      );

  AggregatedItem? _getRelevantEpisode(AggregatedItem item) {
    if (item.type == 'Episode') return item;
    if (item.type == 'Series') {
      if (_vm.nextUp != null) {
        return _vm.nextUp;
      }
      if (_vm.seriesEpisodes.isNotEmpty) {
        try {
          return _vm.seriesEpisodes.firstWhere((e) => !e.isPlayed);
        } catch (_) {
          return _vm.seriesEpisodes.first;
        }
      }
    } else if (item.type == 'Season') {
      if (_vm.episodes.isNotEmpty) {
        return _vm.episodes.first;
      }
    }
    return null;
  }

  Widget _detailsTab(BuildContext context, AggregatedItem item) {
    final targetItem = _getRelevantEpisode(item) ?? item;
    final mediaSource = selectedMediaSourceForItem(targetItem, widget.selectedMediaSourceId);
    final isPlayable = targetItem.type != 'Series' && targetItem.type != 'Season' && targetItem.type != 'Person';

    if (isPlayable && mediaSource != null) {
      final List<Map<String, dynamic>> rawStreams = (mediaSource['MediaStreams'] as List?)
              ?.whereType<Map>()
              .map((e) => e.cast<String, dynamic>())
              .toList() ??
          [];
      final audioStreams = rawStreams.where((s) => s['Type'] == 'Audio').toList();
      final subtitleStreams = rawStreams.where((s) => s['Type'] == 'Subtitle').toList();
      
      final hasButtons = audioStreams.length > 2 || subtitleStreams.length > 2;
      return Focus(
        canRequestFocus: false,
        onFocusChange: (focused) {
          if (focused && mounted) {
            widget.onToggleNavbar?.call(false);
          } else if (!focused && mounted) {
            widget.onToggleNavbar?.call(true);
          }
        },
        child: _DetailsContainer(
          isScrollable: hasButtons,
          canRequestFocus: true,
          focusNode: _detailsTabFocusNode,
          onNavigateUp: _focusSelectedTab,
          onSelect: hasButtons
              ? () {
                  if (audioStreams.length > 2) {
                    _audioShowAllFocusNode.requestFocus();
                  } else if (subtitleStreams.length > 2) {
                    _subtitleShowAllFocusNode.requestFocus();
                  }
                }
              : null,
          child: _buildFileInformation(context, targetItem, mediaSource),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildFileInformation(
    BuildContext context,
    AggregatedItem item,
    Map<String, dynamic> mediaSource,
  ) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final textTheme = theme.textTheme;

    // File name and Size
    final sizeBytes = mediaSource['Size'] as int? ?? 0;
    final String formattedSize;
    if (sizeBytes > 0) {
      final double mb = sizeBytes / (1024 * 1024);
      if (mb > 999) {
        formattedSize = '${(mb / 1024).toStringAsFixed(2)} GB';
      } else {
        formattedSize = '${mb.toStringAsFixed(0)} MB';
      }
    } else {
      formattedSize = 'Unknown Size';
    }

    final String path = mediaSource['Path'] as String? ?? '';
    final String fileName = path.split('/').last.split('\\').last;
    final String container = mediaSource['Container']?.toString().toUpperCase() ?? 'Unknown';

    // Parse streams
    final List<Map<String, dynamic>> rawStreams = (mediaSource['MediaStreams'] as List?)
            ?.whereType<Map>()
            .map((e) => e.cast<String, dynamic>())
            .toList() ??
        [];

    final videoStreams = rawStreams.where((s) => s['Type'] == 'Video').toList();
    final audioStreams = rawStreams.where((s) => s['Type'] == 'Audio').toList();
    final subtitleStreams = rawStreams.where((s) => s['Type'] == 'Subtitle').toList();

    // Video "Greatest Hits"
    final List<String> videoDetails = [];
    if (videoStreams.isNotEmpty) {
      final v = videoStreams.first;
      final codec = v['Codec']?.toString().toUpperCase() ?? 'Unknown Codec';
      final profile = v['Profile']?.toString();
      final width = v['Width']?.toString();
      final height = v['Height']?.toString();
      final frameRate = v['RealFrameRate'] ?? v['AverageFrameRate'];
      final bitDepth = v['BitDepth'] as int?;
      final videoRange = v['VideoRange']?.toString();
      final videoRangeType = v['VideoRangeType']?.toString();

      var videoStr = codec;
      if (profile != null && profile.isNotEmpty) videoStr += ' ($profile)';
      videoDetails.add(videoStr);

      if (width != null && height != null) {
        videoDetails.add('$width x $height');
      }

      if (frameRate != null) {
        final fr = double.tryParse(frameRate.toString());
        if (fr != null) {
          videoDetails.add('${fr.toStringAsFixed(3)} fps');
        }
      }

      if (bitDepth != null) {
        videoDetails.add('$bitDepth-bit');
      }

      if (videoRange != null && videoRange.isNotEmpty) {
        var rangeStr = videoRange;
        if (videoRangeType != null && videoRangeType.isNotEmpty) {
          rangeStr += ' ($videoRangeType)';
        }
        videoDetails.add(rangeStr);
      }
    }

    String formatLang(String? code) {
      if (code == null || code.isEmpty) return 'Unknown';
      return code.toUpperCase();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.fileInformation,
          style: textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        // File name details card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.04),
            borderRadius: AppRadius.circular(8),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileName,
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.fileSizeFormat(formattedSize, container),
                style: textTheme.bodySmall?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        if (videoDetails.isNotEmpty) ...[
          _buildInfoRow(
            'Video',
            Text(
              videoDetails.join('  •  '),
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
                height: 1.3,
              ),
            ),
            textTheme,
          ),
          const SizedBox(height: 10),
        ],

        if (audioStreams.isNotEmpty) ...[
          _buildInfoRow(
            l10n.audio,
            Text.rich(
              TextSpan(
                children: [
                  ...((_audioExpanded || audioStreams.length <= 2)
                          ? audioStreams
                          : audioStreams.take(2))
                      .toList()
                      .asMap()
                      .entries
                      .map((entry) {
                    final idx = entry.key;
                    final a = entry.value;
                    final activeAudioIndex = _vm.selectedAudioIndex ??
                        audioStreams.firstWhere((s) => s['IsDefault'] == true, orElse: () => audioStreams.first)['Index'] as int?;
                    final title = a['DisplayTitle'] ?? a['Codec']?.toString().toUpperCase();
                    final lang = formatLang(a['Language']);
                    final isDefault = a['IsDefault'] == true ? ' [${l10n.defaultLabel}]' : '';
                    final isSelected = a['Index'] == activeAudioIndex;

                    return [
                      if (idx > 0) const TextSpan(text: '\n'),
                      TextSpan(
                        text: '$title ($lang)$isDefault',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: isSelected ? 1.0 : 0.7),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                          decorationColor: AppColorScheme.accent,
                          decorationThickness: 1.5,
                          height: 1.3,
                        ),
                      ),
                    ];
                  }).expand((e) => e),
                ],
              ),
            ),
            textTheme,
          ),
          if (audioStreams.length > 2) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const SizedBox(width: 90),
                FocusableWrapper(
                  focusNode: _audioShowAllFocusNode,
                  onNavigateUp: _focusSelectedTab,
                  onSelect: () => setState(() => _audioExpanded = !_audioExpanded),
                  borderRadius: 6,
                  suppressFocusGlow: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text(
                      _audioExpanded ? l10n.showLess : l10n.showAllAudioTracks(audioStreams.length),
                      style: TextStyle(
                        color: AppColorScheme.accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 10),
        ],

        if (subtitleStreams.isNotEmpty) ...[
          _buildInfoRow(
            l10n.subtitles,
            Text.rich(
              TextSpan(
                children: [
                  ...((_subtitlesExpanded || subtitleStreams.length <= 2)
                          ? subtitleStreams
                          : subtitleStreams.take(2))
                      .toList()
                      .asMap()
                      .entries
                      .map((entry) {
                    final idx = entry.key;
                    final s = entry.value;
                    final activeSubtitleIndex = _vm.selectedSubtitleIndex ??
                        subtitleStreams.firstWhere((s) => s['IsDefault'] == true, orElse: () => subtitleStreams.first)['Index'] as int?;
                    final title = s['DisplayTitle'] ?? s['Codec']?.toString().toUpperCase();
                    final lang = formatLang(s['Language']);
                    final isDefault = s['IsDefault'] == true ? ' [${l10n.defaultLabel}]' : '';
                    final isForced = s['IsForced'] == true ? ' [${l10n.forced}]' : '';
                    final isSelected = s['Index'] == activeSubtitleIndex;

                    return [
                      if (idx > 0) const TextSpan(text: '\n'),
                      TextSpan(
                        text: '$title ($lang)$isDefault$isForced',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: isSelected ? 1.0 : 0.7),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                          decorationColor: AppColorScheme.accent,
                          decorationThickness: 1.5,
                          height: 1.3,
                        ),
                      ),
                    ];
                  }).expand((e) => e),
                ],
              ),
            ),
            textTheme,
          ),
          if (subtitleStreams.length > 2) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const SizedBox(width: 90),
                FocusableWrapper(
                  focusNode: _subtitleShowAllFocusNode,
                  onNavigateUp: _focusSelectedTab,
                  onSelect: () => setState(() => _subtitlesExpanded = !_subtitlesExpanded),
                  borderRadius: 6,
                  suppressFocusGlow: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text(
                      _subtitlesExpanded ? l10n.showLess : l10n.showAllSubtitleTracks(subtitleStreams.length),
                      style: TextStyle(
                        color: AppColorScheme.accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 10),
        ],

        const SizedBox(height: 12),
        _buildDirectPlaySection(context, item, textTheme),
      ],
    );
  }

  Widget _buildInfoRow(String label, Widget child, TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.white54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: child,
        ),
      ],
    );
  }

  Widget _buildDirectPlaySection(BuildContext context, AggregatedItem item, TextTheme textTheme) {
    final l10n = AppLocalizations.of(context);
    if (_loadingPlaybackInfo) {
      return Row(
        children: [
          const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white70),
          ),
          const SizedBox(width: 8),
          Text(
            l10n.checkingDirectPlay,
            style: textTheme.bodySmall?.copyWith(color: Colors.white54),
          ),
        ],
      );
    }

    if (_playbackInfo == null) {
      return const SizedBox.shrink();
    }

    if (_playbackInfo!.mediaSources.isEmpty) {
      return const SizedBox.shrink();
    }

    final source = _playbackInfo!.mediaSources.firstWhere(
      (s) => s.id == widget.selectedMediaSourceId || widget.selectedMediaSourceId == null,
      orElse: () => _playbackInfo!.mediaSources.first,
    );

    final canDirectPlay = source.supportsDirectPlay;
    final reasons = source.transcodingReasons;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              l10n.directPlayCapabilityLabel,
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.white54,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              canDirectPlay ? l10n.yes : l10n.no,
              style: textTheme.bodyMedium?.copyWith(
                color: canDirectPlay ? const Color(0xFF2E7D32) : const Color(0xFFD32F2F),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (!canDirectPlay && reasons.isNotEmpty) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: reasons.map((r) {
                final readable = _formatTranscodeReason(r, l10n);
                return Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    '• $readable',
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }

  String _formatTranscodeReason(String reason, AppLocalizations l10n) {
    return switch (reason) {
      'ContainerNotSupported' => l10n.transcodeContainerNotSupported,
      'VideoCodecNotSupported' => l10n.transcodeVideoCodecNotSupported,
      'AudioCodecNotSupported' => l10n.transcodeAudioCodecNotSupported,
      'SubtitleCodecNotSupported' => l10n.transcodeSubtitleCodecNotSupported,
      'AudioProfileNotSupported' => l10n.transcodeAudioProfileNotSupported,
      'VideoProfileNotSupported' => l10n.transcodeVideoProfileNotSupported,
      'VideoLevelNotSupported' => l10n.transcodeVideoLevelNotSupported,
      'VideoResolutionNotSupported' => l10n.transcodeVideoResolutionNotSupported,
      'VideoBitDepthNotSupported' => l10n.transcodeVideoBitDepthNotSupported,
      'VideoFramerateNotSupported' => l10n.transcodeVideoFramerateNotSupported,
      'ContainerBitrateExceedsLimit' => l10n.transcodeContainerBitrateExceedsLimit,
      'VideoBitrateExceedsLimit' => l10n.transcodeVideoBitrateExceedsLimit,
      'AudioBitrateExceedsLimit' => l10n.transcodeAudioBitrateExceedsLimit,
      'AudioChannelsNotSupported' => l10n.transcodeAudioChannelsNotSupported,
      _ => reason,
    };
  }

  Widget _itemGrid(List<AggregatedItem> items, {double aspectRatio = 2 / 3, FocusNode? focusNode}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        const desiredWidth = 150.0;
        final crossAxisCount =
            ((constraints.maxWidth + spacing) / (desiredWidth + spacing))
                .floor()
                .clamp(2, 8);
        final cellWidth =
            (constraints.maxWidth - (crossAxisCount - 1) * spacing) /
                crossAxisCount;
        final cardRatio = aspectRatio;
        const textHeight = 44.0;
        final childAspectRatio =
            cellWidth / (cellWidth / cardRatio + textHeight);
        return Focus(
          canRequestFocus: false,
          onFocusChange: (focused) {
            if (focused && mounted) {
              widget.onToggleNavbar?.call(false);
            } else if (!focused && mounted) {
              widget.onToggleNavbar?.call(true);
            }
          },
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
              _focusSelectedTab();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
              childAspectRatio: childAspectRatio,
            ),
            itemBuilder: (context, i) {
              final entry = items[i];
              return MediaCard(
                title: entry.name,
                focusNode: i == 0 ? (focusNode ?? _gridFirstFocusNode) : null,
                imageUrl: _imageUrl(entry),
                width: double.infinity,
                aspectRatio: cardRatio,
                isPlayed: entry.isPlayed,
                isFavorite: entry.isFavorite,
                itemType: entry.type,
                watchedBehavior:
                    widget.prefs.get(UserPreferences.watchedIndicatorBehavior),
                onTap: () => context.push(
                  Destinations.item(entry.id, serverId: entry.serverId),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _similarTab(BuildContext context, List<AggregatedItem> items) =>
      _mediaGrid(context, items, firstFocusNode: _similarFirstFocusNode);

  /// Responsive poster grid shared by the Similar tab and the collection
  /// Movies/Shows tabs. Columns scale to width; d-pad uses default geometric
  /// traversal, the top row escapes up to the tab bar, and cards scroll into
  /// view on focus so rows below the fold stay reachable.
  Widget _mediaGrid(
    BuildContext context,
    List<AggregatedItem> items, {
    FocusNode? firstFocusNode,
  }) {
    if (items.isEmpty) return const SizedBox.shrink();
    const cardRatio = 2 / 3;

    final grid = LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        final columns = (constraints.maxWidth / (_landscape ? 150.0 : 130.0))
            .floor()
            .clamp(3, _landscape ? 8 : 6);
        final cardWidth =
            ((constraints.maxWidth - spacing * (columns - 1)) / columns)
                .floorToDouble();
        return Wrap(
          spacing: spacing,
          runSpacing: 16,
          children: [
            for (var i = 0; i < items.length; i++)
              Builder(
                builder: (cellContext) {
                  final entry = items[i];
                  final topRow = i < columns;
                  return MediaCard(
                    title: entry.name,
                    imageUrl: _imageUrl(entry),
                    width: cardWidth,
                    aspectRatio: cardRatio,
                    isPlayed: entry.isPlayed,
                    isFavorite: entry.isFavorite,
                    itemType: entry.type,
                    focusNode: i == 0 ? firstFocusNode : null,
                    onFocus: () => Scrollable.ensureVisible(
                      cellContext,
                      alignment: 0.5,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                    ),
                    onKeyEvent: topRow
                        ? (node, event) {
                            if (event is KeyDownEvent &&
                                event.logicalKey == LogicalKeyboardKey.arrowUp) {
                              _focusSelectedTab();
                              return KeyEventResult.handled;
                            }
                            return KeyEventResult.ignored;
                          }
                        : null,
                    watchedBehavior: widget.prefs
                        .get(UserPreferences.watchedIndicatorBehavior),
                    onTap: () => context.push(
                      Destinations.item(entry.id, serverId: entry.serverId),
                    ),
                  );
                },
              ),
          ],
        );
      },
    );

    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: grid,
      ),
    );
  }

  Widget _tracksTab(BuildContext context, AggregatedItem item) {
    final canManagePlaylistTracks = item.type == 'Playlist' && _vm.canManagePlaylistTracks;

    final listWidget = DetailTrackList(
      tracks: _vm.tracks,
      imageApi: _vm.imageApi,
      isAudiobook: _isAudiobook(item),
      isPlaylist: item.type == 'Playlist',
      groupByDisc: item.type == 'MusicAlbum',
      getFocusNode: (id) =>
          _trackFocusNodes.putIfAbsent(id, () => FocusNode()),
      onPlayTrack: (index) => _playTrack(context, index),
      reorderable: canManagePlaylistTracks,
      onReorder: canManagePlaylistTracks
          ? (oldIndex, newIndex) {
              var target = newIndex;
              if (target > oldIndex) {
                target -= 1;
              }
              _vm.reorderPlaylistTrack(oldIndex, target);
            }
          : null,
      onRemoveFromPlaylist: canManagePlaylistTracks
          ? (track) => _vm.removeTrackFromPlaylist(track)
          : null,
      onMoveUp: canManagePlaylistTracks
          ? (index) => _vm.reorderPlaylistTrack(index, index - 1)
          : null,
      onMoveDown: canManagePlaylistTracks
          ? (index) => _vm.reorderPlaylistTrack(index, index + 1)
          : null,
      onFirstTrackUp: () => widget.initialFocusNode?.requestFocus(),
      onTrackFocused: widget.onBackdropItemFocused,
    );

    return Focus(
      canRequestFocus: false,
      onFocusChange: (focused) {
        if (focused && mounted) {
          widget.onToggleNavbar?.call(false);
        } else if (!focused && mounted) {
          widget.onToggleNavbar?.call(true);
        }
      },
      onKeyEvent: (node, event) {
        if (item.type == 'Playlist' || item.type == 'MusicAlbum') {
          return KeyEventResult.ignored;
        }
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
          _focusSelectedTab();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: (item.type == 'Playlist' || item.type == 'MusicAlbum')
          ? Align(
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: listWidget,
              ),
            )
          : listWidget,
    );
  }

  Future<void> _playTrack(BuildContext context, int index) async {
    final manager = GetIt.instance<PlaybackManager>();
    await manager.playItems(_vm.tracks, startIndex: index);
    if (!context.mounted) return;
    final isAudio = _vm.tracks.every(_isAudioItem);
    context.push(isAudio ? Destinations.audioPlayer : Destinations.videoPlayer);
  }

  Future<void> _playPlaylistTrack(BuildContext context, int index) async {
    final manager = GetIt.instance<PlaybackManager>();
    await manager.playItems(_vm.playlistItems, startIndex: index);
    if (!context.mounted) return;
    final isAudio = _vm.playlistItems.every(_isAudioItem);
    context.push(isAudio ? Destinations.audioPlayer : Destinations.videoPlayer);
  }

  String _getCollectionSortLabel(CollectionSortOption option, AppLocalizations l10n) {
    return switch (option) {
      CollectionSortOption.alphabetical => l10n.sortAlphabetical,
      CollectionSortOption.releaseAscending => l10n.sortReleaseAscending,
      CollectionSortOption.releaseDescending => l10n.sortReleaseDescending,
      CollectionSortOption.custom => l10n.sortCustomDragDrop,
    };
  }

  void _showCollectionSortDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E24),
          title: Text(
            l10n.playlistSortOptions,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: CollectionSortOption.values.map((option) {
              final active = _vm.collectionSort == option;
              return Focus(
                onKeyEvent: (_, event) {
                  if (isActivateKey(event)) {
                    _vm.setCollectionSort(option);
                    Navigator.of(context).pop();
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: Builder(
                  builder: (context) {
                    final focused = Focus.of(context).hasFocus;
                    return InkWell(
                      onTap: () {
                        _vm.setCollectionSort(option);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: focused
                              ? Colors.white12
                              : Colors.transparent,
                          borderRadius: AppRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              active
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: active
                                  ? AppColorScheme.accent
                                  : Colors.white54,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              _getCollectionSortLabel(option, l10n),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: active
                                        ? AppColorScheme.accent
                                        : Colors.white,
                                    fontWeight: active
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  List<Shadow>? _neonTextGlow(double blurRadius) =>
      ThemeRegistry.active.id == ThemeRegistry.neonPulseId
          ? [Shadow(color: AppColorScheme.accent, blurRadius: blurRadius)]
          : null;

  Widget _buildHero(BuildContext context, AggregatedItem item) {
    final textTheme = Theme.of(context).textTheme;
    final isEpisode = item.type == 'Episode';
    final isSeason = item.type == 'Season';
    final logoTag = item.logoImageTag ?? (isEpisode ? item.seriesLogoImageTag : null);
    final logoId = logoTag != null ? (item.logoImageTag != null ? item.id : item.seriesId) : null;
    final overview = item.overview?.trim();
    final hideTitleAndLogo = _landscape && _buildUpNext(context, item) != null;
    final hasUpNext = _landscape && _buildUpNext(context, item) != null;
    final showRatings = isEpisode
        ? false
        : (_vm.ratings.isNotEmpty || item.communityRating != null || item.criticRating != null);

    final desktopScale = _desktopUiScale(prefs: widget.prefs);
    final logoScaleFactor = desktopScale > 1.1 ? 0.70 : 1.0;

    if (item.type == 'Person') {
      final profileUrl = _imageUrl(item);
      final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;
      final focusColor = Color(widget.prefs.get(UserPreferences.focusColor).colorValue);
      final profileBorderColor = isNeon ? AppColorScheme.accent : focusColor;


      final avatar = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: profileBorderColor, width: 3.0),
        ),
        child: CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.white.withValues(alpha: 0.1),
          backgroundImage: profileUrl != null
              ? CachedNetworkImageProvider(profileUrl)
              : null,
          child: profileUrl == null
              ? const Icon(Icons.person, color: Colors.white54, size: 48)
              : null,
        ),
      );

      final personInfo = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.name,
            style: textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          PersonDates(item: item),
          if (item.productionLocations.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              item.productionLocations.first,
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ],
      );

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: hasUpNext ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              avatar,
              const SizedBox(width: 24),
              Expanded(child: personInfo),
            ],
          ),
          if (overview != null && overview.isNotEmpty) ...[
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: _landscape ? 850.0 : double.infinity,
              ),
              child: ExpandableBiography(
                text: overview,
                toggleFocusNode: _overviewFocusNode,
                onArrowDown: () {
                  widget.initialFocusNode?.requestFocus();
                },
                onArrowUp: () {
                  NavigationLayout.focusNavbarNotifier.value?.call();
                },
                onArrowLeft: () {
                  final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
                  if (navbarPosition == NavbarPosition.left) {
                    NavigationLayout.focusNavbarNotifier.value?.call();
                  }
                },
                onCollapse: widget.onCollapseBiography,
                style: textTheme.bodyMedium?.copyWith(
                  height: 1.45,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.85),
                ),
              ),
            ),
          ],
          const SizedBox(height: 24),
          Focus(
            canRequestFocus: false,
            skipTraversal: true,
            onFocusChange: (focused) {
              if (focused) {
                widget.onToggleNavbar?.call(true);
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                }
              }
            },
            child: DetailActionButtons(
              viewModel: _vm,
              itemId: item.id,
              selectedMediaSourceId: widget.selectedMediaSourceId,
              onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
              tvPlayFocusNode: widget.initialFocusNode,
              downTarget: _tabNode(_selectedTab >= 0 ? _selectedTab : 0),
              upTarget: _overviewFocusNode,
              autoPlay: widget.autoPlay,
              modernStyle: true,
              fullWidthPrimary: !_landscape,
              maxVisibleButtonsOverride: null,
              onArrowRightAtEnd: _landscape ? _focusRightOfActions : null,
              actionRowRightFocusNode: _actionRowRightFocusNode,
              onFocusExtra: (_) {},
            ),
          ),
        ],
      );
    }

    final isMusicAlbumOrPlaylist = item.type == 'Playlist' || item.type == 'MusicAlbum';
    if (isMusicAlbumOrPlaylist) {
      final l10n = AppLocalizations.of(context);
      final coverUrl = _imageUrl(item);
      final coverImage = Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular(12),
          border: Border.all(
            color: AppColorScheme.onSurface.withValues(alpha: 0.18),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: AppRadius.circular(10),
          child: coverUrl != null
              ? CachedNetworkImage(
                  imageUrl: coverUrl,
                  fit: BoxFit.cover,
                )
              : Container(
                  color: Colors.white.withValues(alpha: 0.05),
                  child: Icon(
                    item.type == 'MusicAlbum' ? Icons.album : Icons.playlist_play,
                    color: Colors.white24,
                    size: 64,
                  ),
                ),
        ),
      );

      final artistName = item.albumArtist;

      final playlistInfo = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.name,
            style: textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              shadows: _neonTextGlow(12),
            ),
          ),
          if (item.type == 'MusicAlbum' && artistName != null) ...[
            const SizedBox(height: 4),
            Focus(
              focusNode: _artistFocusNode,
              onKeyEvent: (node, event) {
                if (event is KeyDownEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    widget.initialFocusNode?.requestFocus();
                    return KeyEventResult.handled;
                  }
                  if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                    return KeyEventResult.handled;
                  }
                }
                if (isActivateKey(event)) {
                  final artistId = item.albumArtists.isNotEmpty
                      ? item.albumArtists.first['Id']?.toString()
                      : null;
                  if (artistId != null) {
                    context.push(
                      Destinations.item(artistId, serverId: item.serverId),
                    );
                  }
                  return KeyEventResult.handled;
                }
                return KeyEventResult.ignored;
              },
              child: Builder(
                builder: (context) {
                  final focused = Focus.of(context).hasFocus;
                  return GestureDetector(
                    onTap: () {
                      final artistId = item.albumArtists.isNotEmpty
                          ? item.albumArtists.first['Id']?.toString()
                          : null;
                      if (artistId != null) {
                        context.push(
                          Destinations.item(artistId, serverId: item.serverId),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.circular(4),
                        border: focused
                            ? Border.fromBorderSide(
                                ThemeRegistry.active.borders.focusBorder.copyWith(
                                  color: AppColorScheme.accent,
                                  width: 1.5,
                                ),
                              )
                            : null,
                      ),
                      child: Text(
                        artistName,
                        style: textTheme.titleMedium?.copyWith(
                          color: AppColorScheme.accent,
                          fontWeight: FontWeight.bold,
                          shadows: _neonTextGlow(8),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            () {
              final count = _vm.tracks.length;
              final trackText = l10n.trackCount(count);
              final parts = <String>[];
              if (item.type == 'MusicAlbum' && item.productionYear != null) {
                parts.add(item.productionYear.toString());
              }
              parts.add(trackText);
              if (item.genres.isNotEmpty) {
                final genresList = item.type == 'Playlist' ? item.genres : item.genres.take(2);
                parts.add(genresList.join(', '));
              }
              return parts.join(' • ');
            }(),
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 24),
          Focus(
            canRequestFocus: false,
            skipTraversal: true,
            onFocusChange: (focused) {
              if (focused) {
                widget.onToggleNavbar?.call(true);
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                }
              }
            },
            child: DetailActionButtons(
              viewModel: _vm,
              itemId: item.id,
              selectedMediaSourceId: widget.selectedMediaSourceId,
              onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
              tvPlayFocusNode: widget.initialFocusNode,
              downTarget: _vm.tracks.isNotEmpty
                  ? _trackFocusNodes.putIfAbsent(_vm.tracks.first.id, () => FocusNode())
                  : null,
              upTarget: item.type == 'MusicAlbum' && artistName != null
                  ? _artistFocusNode
                  : null,
              autoPlay: widget.autoPlay,
              modernStyle: true,
              fullWidthPrimary: !_landscape,
              maxVisibleButtonsOverride: _landscape ? 10 : null,
              onArrowRightAtEnd: null,
              actionRowRightFocusNode: _actionRowRightFocusNode,
              onFocusExtra: (_) {},
            ),
          ),
        ],
      );

      if (_landscape) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            coverImage,
            const SizedBox(width: 28),
            Expanded(child: playlistInfo),
          ],
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: coverImage),
          const SizedBox(height: 20),
          playlistInfo,
        ],
      );
    }

    final Column childrenCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: hasUpNext ? MainAxisSize.max : MainAxisSize.min,
      children: [
        if (!hideTitleAndLogo) ...[
          if (isSeason && _seriesLogoTag != null && _seriesLogoId != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoView(
                  imageUrl: _vm.imageApi
                      .getLogoImageUrl(_seriesLogoId!, maxWidth: 200, tag: _seriesLogoTag),
                  maxHeight: 50 * logoScaleFactor,
                  maxWidth: 150 * logoScaleFactor,
                ),
                const SizedBox(width: 16),
                Text(
                  item.name,
                  style: (_landscape
                          ? textTheme.displaySmall
                          : textTheme.headlineMedium)
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ] else if (isEpisode) ...[
            if (_seriesLogoTag != null && _seriesLogoId != null) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: LogoView(
                  imageUrl: _vm.imageApi
                      .getLogoImageUrl(_seriesLogoId!, maxWidth: 350, tag: _seriesLogoTag),
                  maxHeight: (_landscape ? 90 : 64) * logoScaleFactor,
                  maxWidth: (_landscape ? 360 : 260) * logoScaleFactor,
                ),
              ),
            ] else if (item.seriesName != null) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  item.seriesName!,
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
            Text(
              item.name,
              style: (_landscape
                      ? textTheme.displaySmall
                      : textTheme.headlineMedium)
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ] else if (logoTag != null && logoId != null) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogoView(
                    imageUrl: _vm.imageApi
                        .getLogoImageUrl(logoId, maxWidth: 350, tag: logoTag),
                    maxHeight: (_landscape ? 75 : 64) * logoScaleFactor,
                    maxWidth: (_landscape ? 300 : 260) * logoScaleFactor,
                  ),
                  if (item.mediaSources.length > 1) ...[
                    const SizedBox(width: 16),
                    () {
                      final selectedSource = selectedMediaSourceForItem(item, widget.selectedMediaSourceId);
                      final versionName = selectedSource?['Name'] as String? ?? 'Default';
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColorScheme.accent.withValues(alpha: 0.15),
                          borderRadius: AppRadius.circular(4),
                          border: Border.all(
                            color: AppColorScheme.accent.withValues(alpha: 0.4),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          versionName,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColorScheme.accent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }(),
                  ],
                ],
              ),
            ),
          ] else ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.name,
                  style: (_landscape
                          ? textTheme.displaySmall
                          : textTheme.headlineMedium)
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                if (item.mediaSources.length > 1) ...[
                  const SizedBox(width: 16),
                  () {
                    final selectedSource = selectedMediaSourceForItem(item, widget.selectedMediaSourceId);
                    final versionName = selectedSource?['Name'] as String? ?? 'Default';
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColorScheme.accent.withValues(alpha: 0.15),
                        borderRadius: AppRadius.circular(4),
                        border: Border.all(
                          color: AppColorScheme.accent.withValues(alpha: 0.4),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        versionName,
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColorScheme.accent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }(),
                ],
              ],
            ),
          ],
          const SizedBox(height: 6),
          _metadataRow(context, item),
          if (showRatings) ...[
            const SizedBox(height: 6),
            RatingsRow(
              ratings: _vm.ratings,
              communityRating: item.communityRating,
              criticRating: item.criticRating,
              enableAdditionalRatings:
                  widget.prefs.get(UserPreferences.enableAdditionalRatings),
              enabledRatings: widget.prefs.get(UserPreferences.enabledRatings),
              showLabels: widget.prefs.get(UserPreferences.showRatingLabels),
              showBadges: widget.prefs.get(UserPreferences.showRatingBadges),
            ),
          ],
          const SizedBox(height: 6),
        ],
        if (item.tagline != null && item.tagline!.trim().isNotEmpty) ...[
          if (!hideTitleAndLogo)
            const SizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: _landscape ? 800 : double.infinity),
            child: Text(
              item.tagline!.trim(),
              style: textTheme.titleSmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: AppColorScheme.onSurface.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
        if (overview != null && overview.isNotEmpty) ...[
          if (!hideTitleAndLogo || (item.tagline != null && item.tagline!.trim().isNotEmpty))
            const SizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: _landscape ? 800 : double.infinity,
            ),
            child: ExpandableBiography(
              text: overview,
              toggleFocusNode: _overviewFocusNode,
              onArrowDown: () {
                widget.initialFocusNode?.requestFocus();
              },
              onArrowUp: () {
                NavigationLayout.focusNavbarNotifier.value?.call();
              },
              onArrowLeft: () {
                final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
                if (navbarPosition == NavbarPosition.left) {
                  NavigationLayout.focusNavbarNotifier.value?.call();
                }
              },
              onArrowRight: hasUpNext
                  ? () => _upNextFocusNode.requestFocus()
                  : null,
              onCollapse: widget.onCollapseBiography,
              style: textTheme.bodyMedium?.copyWith(
                height: 1.45,
                color: AppColorScheme.onSurface.withValues(alpha: 0.85),
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),
        Focus(
          canRequestFocus: false,
          skipTraversal: true,
          onFocusChange: (focused) {
            if (focused) {
              widget.onToggleNavbar?.call(true);
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              }
            }
          },
          child: DetailActionButtons(
            viewModel: _vm,
            itemId: item.id,
            selectedMediaSourceId: widget.selectedMediaSourceId,
            onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
            tvPlayFocusNode: widget.initialFocusNode,
            downTarget: _tabNode(_selectedTab >= 0 ? _selectedTab : 0),
            upTarget: _overviewFocusNode,
            autoPlay: widget.autoPlay,
            modernStyle: true,
            fullWidthPrimary: !_landscape,
            maxVisibleButtonsOverride: null,
            onArrowRightAtEnd: _landscape ? _focusRightOfActions : null,
            actionRowRightFocusNode: _actionRowRightFocusNode,
            extraFirstFocusNode: _extraFirstFocusNode,
            onFocusExtra: (_) {},
            actionsExpanded: widget.actionsExpanded,
            onActionsExpandedChanged: widget.onActionsExpandedChanged,
          ),
        ),
      ],
    );

    return childrenCol;
  }

  Widget _metadataRow(BuildContext context, AggregatedItem item) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final muted = AppColorScheme.onSurface.withValues(alpha: 0.75);
    final style = textTheme.bodyMedium?.copyWith(color: muted);

    final pieces = <Widget>[];
    void addText(String? value) {
      if (value == null || value.isEmpty) return;
      pieces.add(Text(value, style: style));
    }

    addText(item.productionYear?.toString());
    addText(item.officialRating);
    if (item.type == 'Series' && item.childCount != null) {
      addText(l10n.seasonCount(item.childCount!));
    }
    if (item.type == 'Season') {
      final epCount = _vm.episodes.length > 0 ? _vm.episodes.length : (item.childCount ?? 0);
      if (epCount > 0) {
        addText(l10n.episodeCount(epCount));
      }
    }
    if (item.type == 'Episode') {
      final s = item.parentIndexNumber;
      final e = item.indexNumber;
      if (s != null && e != null) {
        addText('S${s}:E$e');
      }
      final enableEpisodeRatings = widget.prefs.get(UserPreferences.enableEpisodeRatings);
      if (enableEpisodeRatings) {
        final ratingVal = _vm.ratings['stars'] ?? item.communityRating;
        if (ratingVal != null && ratingVal > 0) {
          final displayVal = ratingVal <= 10.0 ? ratingVal * 10 : ratingVal;
          final ratingText = '${displayVal.toInt()}%';
          pieces.add(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/ratings/tmdb.png',
                  height: 14,
                  filterQuality: FilterQuality.medium,
                ),
                const SizedBox(width: 4),
                Text(ratingText, style: style),
              ],
            ),
          );
        }
      }
    }
    final status = item.status;
    if (item.type == 'Series' && status != null && status.isNotEmpty) {
      pieces.add(_statusBadge(context, status));
    }
    var runtime = item.runtime;
    if (runtime == null && item.type == 'Season' && _vm.episodes.isNotEmpty) {
      var totalMs = 0;
      for (final ep in _vm.episodes) {
        totalMs += ep.runtime?.inMilliseconds ?? 0;
      }
      if (totalMs > 0) {
        runtime = Duration(milliseconds: totalMs);
      }
    }
    if (runtime != null && item.type != 'Series') {
      pieces.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.schedule, size: 14, color: muted),
            const SizedBox(width: 4),
            Text(_formatDuration(runtime), style: style),
          ],
        ),
      );
      final position = item.playbackPosition ?? Duration.zero;
      var remaining = runtime - position;
      if (remaining.isNegative || remaining == Duration.zero) {
        remaining = runtime;
      }
      final end = DateTime.now().add(remaining);
      addText(l10n.endsAt(TimeOfDay.fromDateTime(end).format(context)));
    }
    if (item.genres.isNotEmpty) {
      addText(item.genres.take(3).join(' · '));
    }
    if (pieces.isEmpty) return const SizedBox.shrink();

    final separated = <Widget>[];
    for (var i = 0; i < pieces.length; i++) {
      if (i > 0) {
        separated.add(Text('·', style: style));
      }
      separated.add(pieces[i]);
    }
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 6,
      children: separated,
    );
  }

  Widget _statusBadge(BuildContext context, String status) {
    final isEnded = status.toLowerCase() == 'ended';
    final color =
        isEnded ? const Color(0xFFB71C1C) : const Color(0xFF2E7D32);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: JellyfinTokens.shapes.smallRadius,
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget? _buildUpNext(BuildContext context, AggregatedItem item) {
    // Queried several times per build but inserted once; build it once.
    if (!_upNextResolvedThisBuild) {
      _upNextCard = _computeUpNext(context, item);
      _upNextResolvedThisBuild = true;
    }
    return _upNextCard;
  }

  Widget? _computeUpNext(BuildContext context, AggregatedItem item) {
    const supported = {'Series', 'Season', 'BoxSet'};
    if (!supported.contains(item.type)) return null;
    final isBoxSet = item.type == 'BoxSet';

    final l10n = AppLocalizations.of(context);
    AggregatedItem? episode;
    String? customLabel;

    if (item.type == 'Season') {
      if (_vm.episodes.isEmpty) return null;
      final seasonAllWatched = _vm.episodes.every((e) => e.isPlayed);
      final seasonAllUnwatched = _vm.episodes.every((e) => !e.isPlayed && (e.playedPercentage == null || e.playedPercentage == 0));
      if (seasonAllWatched) {
        episode = _vm.episodes[0];
        customLabel = l10n.rewatchSeasonEpisode(item.indexNumber ?? 0, 1);
      } else if (!seasonAllUnwatched) {
        try {
          episode = _vm.episodes.firstWhere((e) => !e.isPlayed);
        } catch (_) {}
      }
    } else if (item.type == 'BoxSet') {
      episode = _vm.nextUp;
      if (episode != null) {
        final playedAll = _vm.playlistItems.every((item) => item.rawData['UserData']?['Played'] == true);
        if (playedAll) {
          customLabel = l10n.rewatchPlaylist;
        }
      }
    } else {
      episode = _vm.nextUp;
      if (episode == null && _vm.seriesEpisodes.isNotEmpty) {
        try {
          episode = _vm.seriesEpisodes.firstWhere((e) => !e.isPlayed);
        } catch (_) {
          episode = _vm.seriesEpisodes.first;
          final s = episode.parentIndexNumber ?? 1;
          final e = episode.indexNumber ?? 1;
          customLabel = l10n.rewatchSeasonEpisode(s, e);
        }
      }
    }

    if (episode == null) return null;

    final s = episode.parentIndexNumber;
    final e = episode.indexNumber;
    final code = (s != null && e != null) ? 'S$s:E$e' : null;
    final title = code != null ? '$code - ${episode.name}' : episode.name;
    final combinedLabel = customLabel != null
        ? '$customLabel - ${episode.name}'
        : '${l10n.nextUp} - $title';
    final progress = (episode.playedPercentage ?? 0) / 100.0;
    return UpNextCard(
      label: combinedLabel,
      title: '',
      description: episode.overview?.trim(),
      imageUrl: _imageUrl(episode),
      progress: progress,
      remainingLabel: _remainingLabel(episode, l10n),
      focusNode: _upNextFocusNode,
      minimal: isBoxSet,
      width: isBoxSet ? 200.0 : double.infinity,
      onNavigateLeft: () {
        if (_overviewFocusNode.context != null && _overviewFocusNode.canRequestFocus) {
          _overviewFocusNode.requestFocus();
        } else if (_actionRowRightFocusNode.context != null && _actionRowRightFocusNode.canRequestFocus) {
          _actionRowRightFocusNode.requestFocus();
        } else {
          widget.initialFocusNode?.requestFocus();
        }
      },
      onNavigateDown: _focusSelectedTab,
      onTap: () async {
        final manager = GetIt.instance<PlaybackManager>();
        final hasProgress = (episode!.playbackPosition?.inMilliseconds ?? 0) > 0 ||
                            (episode.playedPercentage ?? 0) > 0;
        await manager.playItems(
          [episode],
          startPosition: hasProgress
              ? (episode.playbackPosition ?? Duration.zero)
              : Duration.zero,
        );
        if (context.mounted) {
          final destination = manager.playbackDeferredToExternalPlayer
              ? Destinations.externalPlayer
              : Destinations.videoPlayer;
          unawaited(context.push(destination));
        }
      },
    );
  }

  String? _remainingLabel(AggregatedItem episode, AppLocalizations l10n) {
    final runtime = episode.runtime;
    if (runtime == null || runtime.inSeconds <= 0) return null;
    final position = episode.playbackPosition ?? Duration.zero;
    final remaining = runtime - position;
    if (remaining.inMinutes <= 0) return null;
    return l10n.timeRemaining(_formatDuration(remaining));
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    if (h > 0) return m > 0 ? '${h}h ${m}m' : '${h}h';
    return '${m}m';
  }

  /// Full-bleed cinematic backdrop owned by the Modern screen (deliberately
  /// ignores the global backdrop-hide / blur prefs; no blur). In landscape the
  /// image is right-aligned and embedded into the page with layered scrims: a
  /// strong left-to-right gradient keeping the left content readable, a
  /// bottom-to-top gradient blending the lower UI into the background, and a
  /// subtle edge vignette. In portrait it fades from the top into the content.
  Widget _buildBackdrop(bool landscape) {
    final base = AppColorScheme.background;
    final item = _vm.item;
    final url = widget.backdropUrl ?? (item?.type == 'Person' ? (_randomBackdropUrl ?? _imageUrl(item!)) : null);
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: base),
        if (url != null && url.isNotEmpty) ...[
          CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            alignment:
                landscape ? Alignment.centerRight : Alignment.topCenter,
            fadeInDuration: const Duration(milliseconds: 250),
            errorWidget: (context, url, error) => const SizedBox.shrink(),
          ),
          if (item?.type == 'Person' && _randomBackdropUrl == null)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  color: Colors.black.withValues(alpha: 0.2),
                ),
              ),
            ),
          ColoredBox(
            color: Colors.black.withValues(
              alpha: item?.type == 'Person' ? 0.20 : 0.40,
            ),
          ),
        ],
        if (landscape) ...[
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  base,
                  base.withValues(alpha: 0.90),
                  base.withValues(alpha: 0.45),
                  base.withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.35, 0.60, 0.85],
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  base,
                  base.withValues(alpha: 0.80),
                  base.withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.45, 0.80],
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.05,
                colors: [
                  base.withValues(alpha: 0.0),
                  base.withValues(alpha: 0.0),
                  base.withValues(alpha: 0.32),
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),
        ] else
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  base.withValues(alpha: 0.15),
                  base.withValues(alpha: 0.55),
                  base,
                ],
                stops: const [0.0, 0.55, 1.0],
              ),
            ),
          ),
      ],
    );
  }

  String? _imageUrl(AggregatedItem item) {
    final tag = item.primaryImageTag;
    if (tag == null) return null;
    return _vm.imageApi.getPrimaryImageUrl(item.id, maxHeight: 360, tag: tag);
  }

  void _selectTab(int index) {
    if (index == _selectedTab) {
      if (PlatformDetection.isTV) {
        setState(() => _selectedTab = -1);
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
      return;
    }

    setState(() => _selectedTab = index);
    if (index >= 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          final desktopScale = _desktopUiScale(prefs: widget.prefs);
          _scrollController.animateTo(
            260.0 * desktopScale,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;
    if (item == null) return const SizedBox.shrink();
    _upNextResolvedThisBuild = false;

    if (item.type == 'Series') {
      _vm.loadAllSeriesEpisodes();
    }

    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final desktopScale = _desktopUiScale(prefs: widget.prefs);
    final logoScaleFactor = desktopScale > 1.1 ? 0.70 : 1.0;

    _landscape = PlatformDetection.isTV ||
        PlatformDetection.useDesktopUi ||
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final tabs = _tabsFor(item, l10n);
    final isMusicAlbumOrPlaylist = item.type == 'Playlist' || item.type == 'MusicAlbum';
    if (isMusicAlbumOrPlaylist) {
      _selectedTab = 0;
    } else if (_selectedTab >= tabs.length) {
      _selectedTab = PlatformDetection.isTV ? -1 : 0;
    }

    if (tabs.isNotEmpty && _selectedTab >= 0 && _selectedTab < tabs.length && tabs[_selectedTab].label == l10n.details) {
      final targetItem = _getRelevantEpisode(item) ?? item;
      final isPlayable = targetItem.type != 'Series' && targetItem.type != 'Season' && targetItem.type != 'Person';
      if (isPlayable) {
        _loadPlaybackInfo(targetItem);
      }
    }

    final tabContent = (tabs.isEmpty || _selectedTab < 0)
        ? const SizedBox.shrink()
        : tabs[_selectedTab].builder(context, item);

    final tabBar = DetailsTabBar(
      labels: [for (final t in tabs) t.label],
      selectedIndex: _selectedTab,
      onSelect: _selectTab,
      focusNodeFor: _tabNode,
      onExitLeft: () {
        final isTvSection = item.type == 'Season' || item.type == 'Series';
        if (isTvSection && widget.actionsExpanded) {
          // If More row is open, go to first extra button (Watched/Unwatched)
          _extraFirstFocusNode.requestFocus();
          return;
        }
        final navbarPosition = widget.prefs.get(UserPreferences.navbarPosition);
        if (navbarPosition == NavbarPosition.left) {
          final focusNavbar = NavigationLayout.focusNavbarNotifier.value;
          if (focusNavbar != null) {
            focusNavbar();
            return;
          }
        }
        // Default: focus Play/Resume button
        widget.initialFocusNode?.requestFocus();
      },
      onExitUp: () => widget.initialFocusNode?.requestFocus(),
      onNavigateDown: _onTabBarNavigateDown,
    );

    final Widget tabBarWidget;
    if (isMusicAlbumOrPlaylist) {
      tabBarWidget = Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          item.type == 'Playlist' ? l10n.playlist : l10n.trackList,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: _neonTextGlow(10),
          ),
        ),
      );
    } else {
      tabBarWidget = tabBar;
    }

    final hero = _buildHero(context, item);
    final upNext = _buildUpNext(context, item);
    final backdrop = _buildBackdrop(_landscape);
    final topInset = TopToolbar.heightFor(context);

    final isEpisode = item.type == 'Episode';
    final logoTag = item.logoImageTag ?? (isEpisode ? item.seriesLogoImageTag : null);
    final logoId = logoTag != null ? (item.logoImageTag != null ? item.id : item.seriesId) : null;

    final showRatings = isEpisode
        ? false
        : (_vm.ratings.isNotEmpty || item.communityRating != null || item.criticRating != null);

    final Widget? aboveHeroWidget = (_landscape && upNext != null)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              if (logoTag != null && logoId != null) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LogoView(
                      imageUrl: _vm.imageApi
                          .getLogoImageUrl(logoId, maxWidth: 350, tag: logoTag),
                      maxHeight: 75 * logoScaleFactor,
                      maxWidth: 300 * logoScaleFactor,
                    ),
                    if (item.mediaSources.length > 1) ...[
                      const SizedBox(width: 16),
                      () {
                        final selectedSource = selectedMediaSourceForItem(item, widget.selectedMediaSourceId);
                        final versionName = selectedSource?['Name'] as String? ?? 'Default';
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColorScheme.accent.withValues(alpha: 0.15),
                            borderRadius: AppRadius.circular(4),
                            border: Border.all(
                              color: AppColorScheme.accent.withValues(alpha: 0.4),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            versionName,
                            style: textTheme.bodySmall?.copyWith(
                              color: AppColorScheme.accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }(),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
              ] else ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.name,
                      style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    if (item.mediaSources.length > 1) ...[
                      const SizedBox(width: 16),
                      () {
                        final selectedSource = selectedMediaSourceForItem(item, widget.selectedMediaSourceId);
                        final versionName = selectedSource?['Name'] as String? ?? 'Default';
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColorScheme.accent.withValues(alpha: 0.15),
                            borderRadius: AppRadius.circular(4),
                            border: Border.all(
                              color: AppColorScheme.accent.withValues(alpha: 0.4),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            versionName,
                            style: textTheme.bodySmall?.copyWith(
                              color: AppColorScheme.accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }(),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
              ],
              _metadataRow(context, item),
              if (showRatings) ...[
                const SizedBox(height: 6),
                RatingsRow(
                  ratings: _vm.ratings,
                  communityRating: item.communityRating,
                  criticRating: item.criticRating,
                  enableAdditionalRatings:
                      widget.prefs.get(UserPreferences.enableAdditionalRatings),
                  enabledRatings: widget.prefs.get(UserPreferences.enabledRatings),
                  showLabels: widget.prefs.get(UserPreferences.showRatingLabels),
                  showBadges: widget.prefs.get(UserPreferences.showRatingBadges),
                ),
              ],
            ],
          )
        : null;

    return _landscape
        ? ModernLandscapeLayout(
            backdrop: backdrop,
            hero: hero,
            upNext: upNext,
            tabBar: tabBarWidget,
            tabContent: tabContent,
            topInset: topInset,
            scrollController: _scrollController,
            aboveHero: aboveHeroWidget,
            isBoxSet: item.type == 'BoxSet',
          )
        : ModernPortraitLayout(
            backdrop: backdrop,
            hero: hero,
            upNext: upNext,
            tabBar: tabBarWidget,
            tabContent: tabContent,
            topInset: topInset,
          );
  }
}

class _ModernTab {
  final String label;
  final Widget Function(BuildContext, AggregatedItem) builder;
  const _ModernTab(this.label, this.builder);
}

class _DetailsContainer extends StatefulWidget {
  final Widget child;
  final bool isScrollable;
  final bool canRequestFocus;
  final FocusNode? focusNode;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onSelect;

  const _DetailsContainer({
    required this.child,
    required this.isScrollable,
    required this.canRequestFocus,
    this.focusNode,
    this.onNavigateUp,
    this.onSelect,
  });

  @override
  State<_DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<_DetailsContainer> with FocusStateMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final isNeon = ThemeRegistry.active.id == ThemeRegistry.neonPulseId;

    return Focus(
      focusNode: widget.focusNode,
      canRequestFocus: widget.canRequestFocus,
      onFocusChange: (focused) {
        setFocused(focused);
        if (focused) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              Scrollable.ensureVisible(
                context,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: 0.0,
              );
            }
          });
        }
      },
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.enter ||
              event.logicalKey == LogicalKeyboardKey.select) {
            if (widget.onSelect != null) {
              widget.onSelect!();
              return KeyEventResult.handled;
            }
          }
        }
        if (widget.isScrollable) {
          if (event is KeyDownEvent || event is KeyRepeatEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              final maxScroll = _scrollController.position.maxScrollExtent;
              final currentScroll = _scrollController.offset;
              if (currentScroll < maxScroll) {
                _scrollController.animateTo(
                  (currentScroll + 60.0).clamp(0.0, maxScroll),
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeOut,
                );
                return KeyEventResult.handled;
              }
            } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              final currentScroll = _scrollController.offset;
              if (currentScroll > 0.0) {
                _scrollController.animateTo(
                  (currentScroll - 60.0).clamp(0.0, double.infinity),
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeOut,
                );
                return KeyEventResult.handled;
              } else {
                widget.onNavigateUp?.call();
                return KeyEventResult.handled;
              }
            }
          }
        } else {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowUp) {
            widget.onNavigateUp?.call();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular(12),
          border: Border.all(
            color: showFocusBorder
                ? (isNeon ? AppColorScheme.accent : focusColor)
                : Colors.white.withValues(alpha: 0.08),
            width: showFocusBorder ? 1.5 : 1.0,
          ),
          color: Colors.white.withValues(alpha: 0.02),
        ),
        padding: const EdgeInsets.all(16),
        child: widget.isScrollable
            ? SingleChildScrollView(
                controller: _scrollController,
                child: widget.child,
              )
            : widget.child,
      ),
    );
  }
}
