import 'package:flutter/material.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/platform_detection.dart';
import '../shared/immersive_segmented_selector.dart';
import 'immersive_filmography_section.dart';
import 'immersive_seerr_filmography_section.dart';

enum _PersonTab {
  movies,
  series,
  guestAppearances,
  musicVideos,
  crew,
  appearances,
  all,
}

class ImmersivePersonContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;

  final List<SeerrDiscoverItem> seerrCrewCredits;
  final List<SeerrDiscoverItem> seerrAppearances;

  final ValueChanged<AggregatedItem>? onBackdropItemFocused;

  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;
  final VoidCallback? onRailNavigateUp;
  final VoidCallback? onRailNavigateDown;

  const ImmersivePersonContent({
    super.key,
    required this.viewModel,
    required this.prefs,
    required this.seerrCrewCredits,
    required this.seerrAppearances,
    this.onBackdropItemFocused,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onRailNavigateUp,
    this.onRailNavigateDown,
  });

  @override
  State<ImmersivePersonContent> createState() => ImmersivePersonContentState();
}

class ImmersivePersonContentState extends State<ImmersivePersonContent> {
  static const double _tabsToRailSpacing = 10;

  static const double _bottomSpacing = 32;
  static const double _compactBottomSpacing = 24;

  static const Duration _revealDuration = Duration(milliseconds: 180);

  final GlobalKey<ImmersiveSegmentedSelectorState<_PersonTab>> _tabsKey =
      GlobalKey<ImmersiveSegmentedSelectorState<_PersonTab>>();

  final GlobalKey<ImmersiveFilmographySectionState> _moviesSectionKey =
      GlobalKey<ImmersiveFilmographySectionState>();

  final GlobalKey<ImmersiveFilmographySectionState> _seriesSectionKey =
      GlobalKey<ImmersiveFilmographySectionState>();

  final GlobalKey<ImmersiveFilmographySectionState>
  _guestAppearancesSectionKey = GlobalKey<ImmersiveFilmographySectionState>();

  final GlobalKey<ImmersiveFilmographySectionState> _musicVideosSectionKey =
      GlobalKey<ImmersiveFilmographySectionState>();

  final GlobalKey<ImmersiveSeerrFilmographySectionState> _crewSectionKey =
      GlobalKey<ImmersiveSeerrFilmographySectionState>();

  final GlobalKey<ImmersiveSeerrFilmographySectionState>
  _appearancesSectionKey = GlobalKey<ImmersiveSeerrFilmographySectionState>();

  final GlobalKey<ImmersiveFilmographySectionState> _allSectionKey =
      GlobalKey<ImmersiveFilmographySectionState>();

  _PersonTab? _selectedTab;

  int _revealRequest = 0;

  ItemDetailViewModel get _vm => widget.viewModel;

  bool _isCompact(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  @override
  void initState() {
    super.initState();

    _syncSelectedTab();
  }

  @override
  void didUpdateWidget(covariant ImmersivePersonContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    _syncSelectedTab();
  }

  List<AggregatedItem> get _movies => _sortJellyfinItems(_vm.filmographyMovies);

  List<AggregatedItem> get _series => _sortJellyfinItems(_vm.filmographySeries);

  List<AggregatedItem> get _musicVideos =>
      _sortJellyfinItems(_vm.filmographyMusicVideos);

  List<AggregatedItem> get _allFilmography =>
      _sortJellyfinItems(_vm.filmography);

  List<AggregatedItem> get _guestAppearances {
    final series = _series;

    return _sortJellyfinItems(
      _vm.filmographyEpisodes.where((episode) {
        final seriesId = episode.seriesId;

        if (seriesId == null || seriesId.isEmpty) {
          return true;
        }

        final isMainCastOfSeries = series.any(
          (seriesItem) => seriesItem.id == seriesId,
        );

        return !isMainCastOfSeries;
      }).toList(),
    );
  }

  List<_PersonTab> get _availableTabs {
    final tabs = <_PersonTab>[
      if (_movies.isNotEmpty) _PersonTab.movies,
      if (_series.isNotEmpty) _PersonTab.series,
      if (_guestAppearances.isNotEmpty) _PersonTab.guestAppearances,
      if (_musicVideos.isNotEmpty) _PersonTab.musicVideos,
      if (widget.seerrCrewCredits.isNotEmpty) _PersonTab.crew,
      if (widget.seerrAppearances.isNotEmpty) _PersonTab.appearances,
    ];

    if (tabs.isEmpty && _allFilmography.isNotEmpty) {
      tabs.add(_PersonTab.all);
    }

    return tabs;
  }

  void _syncSelectedTab() {
    final available = _availableTabs;

    if (available.isEmpty) {
      _selectedTab = null;

      return;
    }

    if (_selectedTab == null || !available.contains(_selectedTab)) {
      _selectedTab = available.first;
    }
  }

  String _labelFor(BuildContext context, _PersonTab tab) {
    final l10n = AppLocalizations.of(context);

    return switch (tab) {
      _PersonTab.movies => l10n.movies,
      _PersonTab.series => l10n.series,
      _PersonTab.guestAppearances => l10n.guestAppearances,
      _PersonTab.musicVideos => l10n.musicVideos,
      _PersonTab.crew => l10n.crewContributionsSeerr,
      _PersonTab.appearances => l10n.appearancesSeerr,
      _PersonTab.all => l10n.appearances,
    };
  }

  bool get canFocusTop => mounted && _availableTabs.isNotEmpty;

  bool focusTop() {
    final selected = _selectedTab;

    if (!canFocusTop || selected == null) {
      return false;
    }

    _tabsKey.currentState?.requestFocusAt(selected);

    _scheduleReveal(_tabsKey, alignment: 0.5);

    return true;
  }

  void requestFocus() {
    focusTop();
  }

  bool focusBottom() {
    if (!mounted || _selectedTab == null) {
      return false;
    }

    final moved = _focusSelectedRail();

    if (moved) {
      _scheduleActiveRailReveal();
    }

    return moved;
  }

  GlobalKey? get activeRailRevealKey {
    switch (_selectedTab) {
      case _PersonTab.movies:
        return _moviesSectionKey.currentState?.revealKey;

      case _PersonTab.series:
        return _seriesSectionKey.currentState?.revealKey;

      case _PersonTab.guestAppearances:
        return _guestAppearancesSectionKey.currentState?.revealKey;

      case _PersonTab.musicVideos:
        return _musicVideosSectionKey.currentState?.revealKey;

      case _PersonTab.crew:
        return _crewSectionKey.currentState?.revealKey;

      case _PersonTab.appearances:
        return _appearancesSectionKey.currentState?.revealKey;

      case _PersonTab.all:
        return _allSectionKey.currentState?.revealKey;

      case null:
        return null;
    }
  }

  GlobalKey get tabsRevealKey => _tabsKey;

  void _scheduleReveal(GlobalKey key, {double alignment = 0.5}) {
    final request = ++_revealRequest;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || request != _revealRequest) {
        return;
      }

      final targetContext = key.currentContext;

      if (targetContext == null) {
        return;
      }

      Scrollable.ensureVisible(
        targetContext,
        alignment: alignment,
        duration: _revealDuration,
        curve: Curves.easeOutCubic,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      );
    });
  }

  void _scheduleActiveRailReveal() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      final key = activeRailRevealKey;

      if (key == null) {
        return;
      }

      _scheduleReveal(key, alignment: 0.5);
    });
  }

  void _selectTab(_PersonTab tab) {
    if (_selectedTab == tab) {
      return;
    }

    setState(() {
      _selectedTab = tab;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _selectedTab != tab) {
        return;
      }

      _scheduleReveal(_tabsKey, alignment: 0.5);
    });
  }

  bool _focusSelectedRail() {
    switch (_selectedTab) {
      case _PersonTab.movies:
        return _moviesSectionKey.currentState?.requestFocus() ?? false;

      case _PersonTab.series:
        return _seriesSectionKey.currentState?.requestFocus() ?? false;

      case _PersonTab.guestAppearances:
        return _guestAppearancesSectionKey.currentState?.requestFocus() ??
            false;

      case _PersonTab.musicVideos:
        return _musicVideosSectionKey.currentState?.requestFocus() ?? false;

      case _PersonTab.crew:
        return _crewSectionKey.currentState?.requestFocus() ?? false;

      case _PersonTab.appearances:
        return _appearancesSectionKey.currentState?.requestFocus() ?? false;

      case _PersonTab.all:
        return _allSectionKey.currentState?.requestFocus() ?? false;

      case null:
        return false;
    }
  }

  void _navigateRailUp() {
    _scheduleReveal(_tabsKey, alignment: 0.5);

    widget.onRailNavigateUp?.call();
  }

  void _navigateRailDown() {
    widget.onRailNavigateDown?.call();
  }

  Widget _buildTabs(BuildContext context) {
    final available = _availableTabs;

    if (available.isEmpty) {
      return const SizedBox.shrink();
    }

    return ImmersiveSegmentedSelector<_PersonTab>(
      key: _tabsKey,
      values: available,
      selectedValue: _selectedTab,
      labelBuilder: (tab) => _labelFor(context, tab),
      onValueActivated: _selectTab,
      onNavigateUp: widget.onNavigateUp,
      onNavigateDown: widget.onNavigateDown,
      allowLeftEdgeExit: true,
      selectOnFocus: true,
      height: 44,
      minimumSegmentWidth: 0,
    );
  }

  Widget _buildSelectedContent(BuildContext context) {
    switch (_selectedTab) {
      case _PersonTab.movies:
        return ImmersiveFilmographySection(
          key: _moviesSectionKey,
          title: '',
          items: _movies,
          imageApi: _vm.imageApi,
          prefs: widget.prefs,
          onBackdropItemFocused: widget.onBackdropItemFocused,
          onNavigateUp: _navigateRailUp,
          onNavigateDown: _navigateRailDown,
        );

      case _PersonTab.series:
        return ImmersiveFilmographySection(
          key: _seriesSectionKey,
          title: '',
          items: _series,
          imageApi: _vm.imageApi,
          prefs: widget.prefs,
          onBackdropItemFocused: widget.onBackdropItemFocused,
          onNavigateUp: _navigateRailUp,
          onNavigateDown: _navigateRailDown,
        );

      case _PersonTab.guestAppearances:
        return ImmersiveFilmographySection(
          key: _guestAppearancesSectionKey,
          title: '',
          items: _guestAppearances,
          imageApi: _vm.imageApi,
          prefs: widget.prefs,
          onBackdropItemFocused: widget.onBackdropItemFocused,
          onNavigateUp: _navigateRailUp,
          onNavigateDown: _navigateRailDown,
        );

      case _PersonTab.musicVideos:
        return ImmersiveFilmographySection(
          key: _musicVideosSectionKey,
          title: '',
          items: _musicVideos,
          imageApi: _vm.imageApi,
          prefs: widget.prefs,
          onBackdropItemFocused: widget.onBackdropItemFocused,
          onNavigateUp: _navigateRailUp,
          onNavigateDown: _navigateRailDown,
        );

      case _PersonTab.crew:
        return ImmersiveSeerrFilmographySection(
          key: _crewSectionKey,
          title: '',
          items: widget.seerrCrewCredits,
          isCrew: true,
          onNavigateUp: _navigateRailUp,
          onNavigateDown: _navigateRailDown,
        );

      case _PersonTab.appearances:
        return ImmersiveSeerrFilmographySection(
          key: _appearancesSectionKey,
          title: '',
          items: widget.seerrAppearances,
          isCrew: false,
          onNavigateUp: _navigateRailUp,
          onNavigateDown: _navigateRailDown,
        );

      case _PersonTab.all:
        return ImmersiveFilmographySection(
          key: _allSectionKey,
          title: '',
          items: _allFilmography,
          imageApi: _vm.imageApi,
          prefs: widget.prefs,
          onBackdropItemFocused: widget.onBackdropItemFocused,
          onNavigateUp: _navigateRailUp,
          onNavigateDown: _navigateRailDown,
        );

      case null:
        return const SizedBox.shrink();
    }
  }

  List<AggregatedItem> _sortJellyfinItems(List<AggregatedItem> items) {
    final sortOption = widget.prefs.get(UserPreferences.personPageSortOption);

    final sorted = List<AggregatedItem>.from(items);

    if (sortOption == 'alphabetical') {
      sorted.sort(
        (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
      );

      return sorted;
    }

    final ascending = sortOption == 'releaseDateAsc';

    sorted.sort((a, b) {
      final dateA =
          a.premiereDate ??
          (a.productionYear != null ? DateTime(a.productionYear!) : null);

      final dateB =
          b.premiereDate ??
          (b.productionYear != null ? DateTime(b.productionYear!) : null);

      if (dateA == null && dateB == null) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      }

      if (dateA == null) {
        return 1;
      }

      if (dateB == null) {
        return -1;
      }

      final comparison = dateA.compareTo(dateB);

      return ascending ? comparison : -comparison;
    });

    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    final available = _availableTabs;

    if (available.isEmpty) {
      return const SizedBox.shrink();
    }

    final compact = _isCompact(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTabs(context),

        SizedBox(height: compact ? 12 : _tabsToRailSpacing),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.topLeft,
              children: [...previousChildren, ?currentChild],
            );
          },
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: KeyedSubtree(
            key: ValueKey(_selectedTab),
            child: _buildSelectedContent(context),
          ),
        ),

        SizedBox(height: compact ? _compactBottomSpacing : _bottomSpacing),
      ],
    );
  }
}
