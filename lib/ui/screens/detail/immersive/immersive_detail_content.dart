import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/repositories/seerr_repository.dart';
import '../../../../data/services/plugin_sync_service.dart';
import '../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../preference/preference_constants.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/platform_detection.dart';
import '../../../widgets/fullscreen_backdrop_switcher.dart';
import '../../../widgets/navigation_layout.dart';
import '../../../widgets/offline_aware_image.dart';
import '../item_detail_screen.dart';
import 'chapters/immersive_chapters_section.dart';
import 'collection/immersive_collection_section.dart';
import 'details/immersive_details_section.dart';
import 'discovery/immersive_discovery_section.dart';
import 'episodes/immersive_episodes_section.dart';
import 'extras/immersive_extras_section.dart';
import 'hero/immersive_hero.dart';
import 'immersive_landscape_layout.dart';
import 'immersive_portrait_layout.dart';
import 'people/immersive_people_section.dart';
import 'person/immersive_person_content.dart';
import 'person/immersive_person_hero.dart';
import 'shared/immersive_spacing.dart';

class ImmersiveDetailContent extends StatefulWidget {
  final ItemDetailViewModel viewModel;
  final UserPreferences prefs;
  final ValueListenable<String?> backdropUrl;
  final String? selectedMediaSourceId;
  final ValueChanged<String?> onSelectedMediaSourceChanged;
  final ValueChanged<AggregatedItem>? onBackdropItemFocused;
  final FocusNode? initialFocusNode;
  final bool autoPlay;
  final void Function(Duration position)? onPlayFromChapter;
  final bool actionsExpanded;
  final ValueChanged<bool> onActionsExpandedChanged;

  const ImmersiveDetailContent({
    super.key,
    required this.viewModel,
    required this.prefs,
    required this.backdropUrl,
    required this.selectedMediaSourceId,
    required this.onSelectedMediaSourceChanged,
    this.onBackdropItemFocused,
    this.initialFocusNode,
    this.autoPlay = false,
    this.onPlayFromChapter,
    required this.actionsExpanded,
    required this.onActionsExpandedChanged,
  });

  @override
  State<ImmersiveDetailContent> createState() => ImmersiveDetailContentState();
}

class ImmersiveDetailContentState extends State<ImmersiveDetailContent> {
  late final ScrollController _scrollController = ScrollController();

  final GlobalKey<DetailActionButtonsState> _actionButtonsKey =
      GlobalKey<DetailActionButtonsState>();

  final GlobalKey<ImmersiveHeroState> _heroKey =
      GlobalKey<ImmersiveHeroState>();

  final GlobalKey<ImmersiveEpisodesSectionState> _episodesSectionKey =
      GlobalKey<ImmersiveEpisodesSectionState>();

  final GlobalKey<ImmersiveChaptersSectionState> _chaptersSectionKey =
      GlobalKey<ImmersiveChaptersSectionState>();

  final GlobalKey<ImmersiveCollectionSectionState> _collectionSectionKey =
      GlobalKey<ImmersiveCollectionSectionState>();

  final GlobalKey<ImmersiveDiscoverySectionState> _discoverySectionKey =
      GlobalKey<ImmersiveDiscoverySectionState>();

  final GlobalKey<ImmersivePeopleSectionState> _peopleSectionKey =
      GlobalKey<ImmersivePeopleSectionState>();

  final GlobalKey<ImmersiveExtrasSectionState> _extrasSectionKey =
      GlobalKey<ImmersiveExtrasSectionState>();

  final GlobalKey<ImmersiveDetailsSectionState> _detailsSectionKey =
      GlobalKey<ImmersiveDetailsSectionState>();

  final GlobalKey<ImmersivePersonHeroState> _personHeroKey =
      GlobalKey<ImmersivePersonHeroState>();

  final GlobalKey<ImmersivePersonContentState> _personContentKey =
      GlobalKey<ImmersivePersonContentState>();

  final GlobalKey _detailsRevealKey = GlobalKey();

  List<SeerrDiscoverItem>? _seerrAppearances;
  List<SeerrDiscoverItem>? _seerrCrewCredits;

  String? _seerrLoadedForItemId;
  String? _seerrLoadingForItemId;

  int _outerRevealRequest = 0;

  bool _personHeroParentFocusInProgress = false;

  ItemDetailViewModel get _vm => widget.viewModel;

  bool _usePortraitLayout(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return size.height > size.width;
  }

  bool _isPhonePortrait(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return size.height > size.width && size.width < 600;
  }

  bool _shouldShowChapters(AggregatedItem item) {
    if (item.chapters.isEmpty) {
      return false;
    }

    return switch (item.type) {
      'Movie' || 'Episode' || 'Series' || 'Season' => false,
      _ => true,
    };
  }

  List<GlobalKey> _focusableVerticalSections() {
    final sections = <GlobalKey>[];

    final heroState = _heroKey.currentState;

    if (heroState != null &&
        (heroState.canFocusBottom || heroState.hasFocusWithin)) {
      sections.add(_heroKey);
    }

    final item = _vm.item;

    if (item == null) {
      return sections;
    }

    for (final key in _orderedMediaSectionKeys(item)) {
      if (_sectionCanFocus(key)) {
        sections.add(key);
      }
    }

    if (_detailsSectionKey.currentState?.canFocusTop ?? false) {
      sections.add(_detailsSectionKey);
    }

    return sections;
  }

  bool _sectionCanFocus(GlobalKey key) {
    return switch (key) {
      _ when key == _episodesSectionKey =>
        _episodesSectionKey.currentState?.canFocusTop ?? false,
      _ when key == _chaptersSectionKey =>
        _chaptersSectionKey.currentState?.canFocusTop ?? false,
      _ when key == _collectionSectionKey =>
        _collectionSectionKey.currentState?.canFocusTop ?? false,
      _ when key == _extrasSectionKey =>
        _extrasSectionKey.currentState?.canFocusTop ?? false,
      _ when key == _discoverySectionKey =>
        _discoverySectionKey.currentState?.canFocusTop ?? false,
      _ when key == _peopleSectionKey =>
        _peopleSectionKey.currentState?.canFocusTop ?? false,
      _ => false,
    };
  }

  bool _focusHeroBottom() {
    final hero = _heroKey.currentState;

    if (hero == null || !hero.canFocusBottom) {
      return false;
    }

    final previousFocus = FocusManager.instance.primaryFocus;

    final moved = hero.focusBottom();

    if (!moved) {
      return false;
    }

    _scheduleOuterReveal(_heroKey);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      final currentHero = _heroKey.currentState;

      if (currentHero == null || currentHero.hasFocusWithin) {
        return;
      }

      final currentFocus = FocusManager.instance.primaryFocus;

      if (currentFocus != null && !identical(currentFocus, previousFocus)) {
        return;
      }

      currentHero.focusBottom();
    });

    return true;
  }

  bool _focusCollectionTop() {
    final state = _collectionSectionKey.currentState;

    if (state == null) {
      return false;
    }

    final moved = state.focusTop();

    if (!moved) {
      return false;
    }

    final revealKey = state.topRevealKey;

    if (revealKey != null) {
      _scheduleOuterReveal(revealKey);
    }

    return true;
  }

  bool _focusCollectionBottom() {
    final state = _collectionSectionKey.currentState;

    if (state == null) {
      return false;
    }

    final moved = state.focusBottom();

    if (!moved) {
      return false;
    }

    final revealKey = state.bottomRevealKey;

    if (revealKey != null) {
      _scheduleOuterReveal(revealKey);
    }

    return true;
  }

  bool _focusDiscoveryTop() {
    final state = _discoverySectionKey.currentState;

    if (state == null) {
      return false;
    }

    final moved = state.focusTop();

    if (!moved) {
      return false;
    }

    final revealKey = state.topRevealKey;

    if (revealKey != null) {
      _scheduleOuterReveal(revealKey);
    }

    return true;
  }

  bool _focusDiscoveryBottom() {
    final state = _discoverySectionKey.currentState;

    if (state == null) {
      return false;
    }

    final moved = state.focusBottom();

    if (!moved) {
      return false;
    }

    final revealKey = state.bottomRevealKey;

    if (revealKey != null) {
      _scheduleOuterReveal(revealKey);
    }

    return true;
  }

  bool _focusDetailsTop() {
    final state = _detailsSectionKey.currentState;

    if (state == null) {
      return false;
    }

    final moved = state.focusTop();

    if (!moved) {
      return false;
    }

    _scheduleOuterReveal(_detailsRevealKey);

    return true;
  }

  bool _focusDetailsBottom() {
    final state = _detailsSectionKey.currentState;

    if (state == null) {
      return false;
    }

    final moved = state.focusBottom();

    if (!moved) {
      return false;
    }

    final revealKey = state.bottomRevealKey;

    if (revealKey != null) {
      _scheduleOuterReveal(revealKey);
    }

    return true;
  }

  bool _moveUp(GlobalKey current) {
    final sections = _focusableVerticalSections();

    final index = sections.indexOf(current);

    if (index < 0) {
      return false;
    }

    if (index == 0) {
      return true;
    }

    final target = sections[index - 1];

    if (target == _heroKey) {
      return _focusHeroBottom();
    }

    if (target == _discoverySectionKey) {
      return _focusDiscoveryBottom();
    }

    if (target == _collectionSectionKey) {
      return _focusCollectionBottom();
    }

    if (target == _extrasSectionKey) {
      return _focusAndReveal(
        _extrasSectionKey,
        () => _extrasSectionKey.currentState?.focusTop() ?? false,
      );
    }

    if (target == _peopleSectionKey) {
      return _focusAndReveal(
        _peopleSectionKey,
        () => _peopleSectionKey.currentState?.focusTop() ?? false,
      );
    }

    if (target == _detailsSectionKey) {
      return _focusDetailsBottom();
    }

    if (target == _episodesSectionKey) {
      return _focusAndReveal(
        _episodesSectionKey,
        () => _episodesSectionKey.currentState?.focusBottom() ?? false,
      );
    }

    if (target == _chaptersSectionKey) {
      return _focusAndReveal(
        _chaptersSectionKey,
        () => _chaptersSectionKey.currentState?.focusTop() ?? false,
      );
    }

    return false;
  }

  bool _moveDown(GlobalKey current) {
    final sections = _focusableVerticalSections();

    final index = sections.indexOf(current);

    if (index == -1) {
      return false;
    }

    if (index >= sections.length - 1) {
      return true;
    }

    final target = sections[index + 1];

    if (target == _collectionSectionKey) {
      return _focusCollectionTop();
    }

    if (target == _episodesSectionKey) {
      return _focusAndReveal(
        _episodesSectionKey,
        () => _episodesSectionKey.currentState?.focusTop() ?? false,
      );
    }

    if (target == _chaptersSectionKey) {
      return _focusAndReveal(
        _chaptersSectionKey,
        () => _chaptersSectionKey.currentState?.focusTop() ?? false,
      );
    }

    if (target == _peopleSectionKey) {
      return _focusAndReveal(
        _peopleSectionKey,
        () => _peopleSectionKey.currentState?.focusTop() ?? false,
      );
    }

    if (target == _extrasSectionKey) {
      return _focusAndReveal(
        _extrasSectionKey,
        () => _extrasSectionKey.currentState?.focusTop() ?? false,
      );
    }

    if (target == _detailsSectionKey) {
      return _focusDetailsTop();
    }

    if (target == _discoverySectionKey) {
      return _focusDiscoveryTop();
    }

    return false;
  }

  bool _focusAndReveal(GlobalKey target, bool Function() focus) {
    final moved = focus();

    if (!moved) {
      return false;
    }

    _scheduleOuterReveal(target);

    return true;
  }

  bool _handleDetailsNavigateDown() {
    if (!_scrollController.hasClients) {
      return true;
    }

    final viewport = _scrollController.position.context.storageContext
        .findRenderObject();

    if (viewport is! RenderBox) {
      return true;
    }

    final position = _scrollController.position;

    final target = (position.pixels + viewport.size.height * 0.4).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    _outerRevealRequest++;

    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
    );

    return true;
  }

  bool _handleDetailsNavigateUp() {
    if (!_scrollController.hasClients) {
      return _moveUp(_detailsSectionKey);
    }

    final position = _scrollController.position;

    final viewportObject = position.context.storageContext.findRenderObject();

    final anchor = _detailsRevealKey.currentContext?.findRenderObject();

    if (viewportObject is! RenderBox || anchor == null || !anchor.attached) {
      return _moveUp(_detailsSectionKey);
    }

    final viewport = RenderAbstractViewport.maybeOf(anchor);

    if (viewport == null) {
      return _moveUp(_detailsSectionKey);
    }

    final detailsEntry = viewport
        .getOffsetToReveal(anchor, 0)
        .offset
        .clamp(position.minScrollExtent, position.maxScrollExtent);

    if (position.pixels <= detailsEntry) {
      return _moveUp(_detailsSectionKey);
    }

    final target = (position.pixels - viewportObject.size.height * 0.4).clamp(
      position.minScrollExtent,
      detailsEntry,
    );

    _outerRevealRequest++;

    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
    );

    return true;
  }

  void _scheduleOuterReveal(GlobalKey target) {
    final request = ++_outerRevealRequest;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || request != _outerRevealRequest) {
        return;
      }

      if (!_scrollController.hasClients) {
        return;
      }

      final position = _scrollController.position;

      final revealTarget = target == _episodesSectionKey
          ? _episodesSectionKey.currentState?.artworkRailAnchorKey ?? target
          : target;

      final destination = _outerRevealOffset(revealTarget, position);

      if (destination == null) {
        return;
      }

      _scrollController.animateTo(
        destination,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
      );
    });
  }

  double? _outerRevealOffset(GlobalKey target, ScrollPosition position) {
    if (target == _heroKey) {
      return position.minScrollExtent;
    }

    final targetObject = target.currentContext?.findRenderObject();

    if (targetObject == null || !targetObject.attached) {
      return null;
    }

    final viewport = RenderAbstractViewport.maybeOf(targetObject);

    if (viewport == null) {
      return null;
    }

    final alignment = target == _detailsRevealKey ? 0.0 : 0.5;

    final revealed = viewport.getOffsetToReveal(targetObject, alignment);

    return revealed.offset.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
  }

  bool restoreBackdropAfterResume() {
    if (_vm.item?.type != 'Series') {
      return false;
    }

    return _episodesSectionKey.currentState?.restoreSelectedSeasonBackdrop() ??
        false;
  }

  @override
  void initState() {
    super.initState();

    _vm.addListener(_onViewModelChanged);

    NavigationLayout.focusDetailsPlayButtonNotifier.value =
        widget.initialFocusNode;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      _ensureSeerrPersonCreditsLoaded();
    });
  }

  void _onViewModelChanged() {
    if (!mounted) {
      return;
    }

    _ensureSeerrPersonCreditsLoaded();

    setState(() {});
  }

  bool _focusPersonTabs() {
    final content = _personContentKey.currentState;

    final moved = content?.focusTop() ?? false;

    final target = content?.tabsRevealKey;

    if (moved && target != null) {
      _scheduleOuterReveal(target);
    }

    return moved;
  }

  bool _focusPersonRail() {
    final content = _personContentKey.currentState;

    final moved = content?.focusBottom() ?? false;

    final target = content?.activeRailRevealKey;

    if (moved && target != null) {
      _scheduleOuterReveal(target);
    }

    return moved;
  }

  bool _focusPersonHero() {
    final hero = _personHeroKey.currentState;

    if (hero == null || !hero.canFocusBottom) {
      return false;
    }

    _personHeroParentFocusInProgress = true;

    final moved = hero.focusBottom();

    _personHeroParentFocusInProgress = false;

    if (moved) {
      _scheduleOuterReveal(_personHeroKey);
    }

    return moved;
  }

  void _handleExternalPersonHeroFocusEntry() {
    if (_personHeroParentFocusInProgress) {
      return;
    }

    _scheduleOuterReveal(_personHeroKey);
  }

  double _immersiveHeroScale(Size size) {
    if (size.height > size.width) {
      return (size.width / 430.0).clamp(0.84, 1.0);
    }

    return (size.width / 1920.0).clamp(0.90, 1.08);
  }

  double _immersiveLandscapeExplicitHorizontalInset(Size size) {
    return PlatformDetection.isTV
        ? 56.0
        : (size.width * 0.046).clamp(56.0, 96.0);
  }

  EdgeInsets _immersiveLandscapeContentInsets() {
    final navbarIsTop =
        widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;

    final safePadding = MediaQuery.paddingOf(context);

    final size = MediaQuery.sizeOf(context);

    final scale = _immersiveHeroScale(size);

    final heroTop = navbarIsTop
        ? (212.0 * scale).clamp(190.0, 232.0)
        : (152.0 * scale).clamp(136.0, 166.0);

    final horizontalInset = _immersiveLandscapeExplicitHorizontalInset(size);

    final horizontalSafePadding = PlatformDetection.isTV
        ? EdgeInsets.zero
        : safePadding;

    return EdgeInsets.fromLTRB(
      horizontalInset + horizontalSafePadding.left,
      heroTop + safePadding.top,
      horizontalInset + horizontalSafePadding.right,
      (40.0 * scale).clamp(36.0, 44.0) + safePadding.bottom,
    );
  }

  EdgeInsets _immersivePortraitHeroInsets() {
    final safePadding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);

    if (_isPhonePortrait(context)) {
      return EdgeInsets.fromLTRB(
        ImmersiveSpacing.mobileHorizontalInset + safePadding.left,
        safePadding.top + 80,
        ImmersiveSpacing.mobileHorizontalInset + safePadding.right,
        20,
      );
    }

    final horizontalInset = (size.width * 0.055).clamp(20.0, 28.0);

    return EdgeInsets.fromLTRB(
      horizontalInset + safePadding.left,
      safePadding.top + 20,
      horizontalInset + safePadding.right,
      24,
    );
  }

  EdgeInsets _immersiveSectionInsets() {
    final safePadding = MediaQuery.paddingOf(context);

    final size = MediaQuery.sizeOf(context);

    if (_usePortraitLayout(context)) {
      final horizontalInset = _isPhonePortrait(context)
          ? ImmersiveSpacing.mobileHorizontalInset
          : (size.width * 0.055).clamp(20.0, 28.0);

      return EdgeInsets.fromLTRB(
        horizontalInset + safePadding.left,
        0,
        horizontalInset + safePadding.right,
        0,
      );
    }

    return _immersiveLandscapeContentInsets();
  }

  Future<void> _ensureSeerrPersonCreditsLoaded() async {
    final item = _vm.item;

    if (item == null || item.type != 'Person') {
      return;
    }

    final itemId = item.id;

    if (_seerrLoadedForItemId == itemId || _seerrLoadingForItemId == itemId) {
      return;
    }

    final tmdbId = item.tmdbId;

    if (tmdbId == null || tmdbId.isEmpty) {
      _seerrLoadedForItemId = itemId;
      return;
    }

    if (!GetIt.instance<PluginSyncService>().seerrAvailable) {
      _seerrLoadedForItemId = itemId;
      return;
    }

    final personId = int.tryParse(tmdbId);

    if (personId == null) {
      _seerrLoadedForItemId = itemId;
      return;
    }

    _seerrLoadingForItemId = itemId;

    if (mounted) {
      setState(() {
        _seerrAppearances = null;
        _seerrCrewCredits = null;
      });
    }

    try {
      final repository = await GetIt.instance.getAsync<SeerrRepository>();

      await repository.ensureInitialized();

      final credits = await repository.getPersonCombinedCredits(personId);

      const excludedJobs = {'thanks', 'special thanks'};

      final appearances = credits.cast
          .where((credit) => credit.posterPath != null)
          .toList();

      final crew = credits.crew
          .where(
            (credit) =>
                credit.posterPath != null &&
                !excludedJobs.contains(credit.job?.toLowerCase()),
          )
          .toList();

      if (!mounted || _vm.item?.id != itemId) {
        return;
      }

      setState(() {
        _seerrAppearances = appearances;
        _seerrCrewCredits = crew;
        _seerrLoadedForItemId = itemId;
      });
    } catch (error) {
      debugPrint('Error loading immersive Seerr person credits: $error');

      if (!mounted || _vm.item?.id != itemId) {
        return;
      }

      setState(() {
        _seerrAppearances = const [];
        _seerrCrewCredits = const [];
        _seerrLoadedForItemId = itemId;
      });
    } finally {
      if (_seerrLoadingForItemId == itemId) {
        _seerrLoadingForItemId = null;
      }
    }
  }

  @override
  void didUpdateWidget(covariant ImmersiveDetailContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!identical(oldWidget.viewModel, widget.viewModel)) {
      oldWidget.viewModel.removeListener(_onViewModelChanged);

      widget.viewModel.addListener(_onViewModelChanged);
    }

    if (widget.initialFocusNode != oldWidget.initialFocusNode) {
      NavigationLayout.focusDetailsPlayButtonNotifier.value =
          widget.initialFocusNode;
    }

    final oldId = oldWidget.viewModel.item?.id;
    final newId = widget.viewModel.item?.id;

    if (oldId != newId) {
      _seerrAppearances = null;
      _seerrCrewCredits = null;

      _seerrLoadedForItemId = null;
      _seerrLoadingForItemId = null;

      _outerRevealRequest++;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }

        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.minScrollExtent);
        }

        _ensureSeerrPersonCreditsLoaded();
      });
    }
  }

  @override
  void dispose() {
    if (NavigationLayout.focusDetailsPlayButtonNotifier.value ==
        widget.initialFocusNode) {
      NavigationLayout.focusDetailsPlayButtonNotifier.value = null;
    }

    _vm.removeListener(_onViewModelChanged);
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = _vm.item;

    if (item == null) {
      return const SizedBox.shrink();
    }

    final size = MediaQuery.sizeOf(context);

    final usePortraitLayout = _usePortraitLayout(context);
    final isPhonePortrait = _isPhonePortrait(context);
    final isPerson = item.type == 'Person';

    final landscapeContentInsets = _immersiveLandscapeContentInsets();
    final portraitHeroInsets = _immersivePortraitHeroInsets();
    final sectionInsets = _immersiveSectionInsets();

    final backdrop = RepaintBoundary(
      child: ValueListenableBuilder<String?>(
        valueListenable: widget.backdropUrl,
        builder: (context, backdropUrl, _) {
          return _buildBackdrop(context, backdropUrl, item);
        },
      ),
    );

    final hero = RepaintBoundary(
      child: isPerson
          ? ImmersivePersonHero(
              key: _personHeroKey,
              item: item,
              viewModel: _vm,
              imageApi: _vm.imageApi,
              prefs: widget.prefs,
              initialFocusNode: widget.initialFocusNode,
              onNavigateDown: _focusPersonTabs,
              onExternalFocusEntry: _handleExternalPersonHeroFocusEntry,
            )
          : ImmersiveHero(
              key: _heroKey,
              item: item,
              viewModel: _vm,
              actionButtonsKey: _actionButtonsKey,
              selectedMediaSourceId: widget.selectedMediaSourceId,
              onSelectedMediaSourceChanged: widget.onSelectedMediaSourceChanged,
              initialFocusNode: widget.initialFocusNode,
              autoPlay: widget.autoPlay,
              actionsExpanded: widget.actionsExpanded,
              onActionsExpandedChanged: widget.onActionsExpandedChanged,
              onNavigateDown: () => _moveDown(_heroKey),
              prefs: widget.prefs,
            ),
    );

    final sections = isPerson
        ? _buildPersonSections()
        : _buildMediaSections(context, item, sectionInsets);

    if (usePortraitLayout) {
      final heroMinHeight = isPhonePortrait
          ? (size.height * 0.60).clamp(500.0, 610.0)
          : (size.height * 0.74).clamp(560.0, 720.0);

      return ImmersivePortraitLayout(
        backdrop: backdrop,
        hero: hero,
        sections: sections,
        scrollController: _scrollController,
        heroPadding: portraitHeroInsets,
        firstSectionPadding: isPerson
            ? EdgeInsets.fromLTRB(sectionInsets.left, 0, sectionInsets.right, 0)
            : EdgeInsets.zero,
        remainingSectionsPadding: isPerson
            ? EdgeInsets.fromLTRB(sectionInsets.left, 0, sectionInsets.right, 0)
            : EdgeInsets.zero,
        heroMinHeight: heroMinHeight,
        heroToSectionSpacing: isPhonePortrait
            ? ImmersiveSpacing.mobileHeroToSection
            : 48,
      );
    }

    final heroLayoutScale = _immersiveHeroScale(size);

    return ImmersiveLandscapeLayout(
      backdrop: backdrop,
      hero: hero,
      sections: sections,
      scrollController: _scrollController,
      heroPadding: landscapeContentInsets,
      compactFirstFold: isPerson,
      compactHeroHeight: isPerson
          ? (380.0 * heroLayoutScale).clamp(340.0, 410.0)
          : (395.0 * heroLayoutScale).clamp(355.0, 425.0),
      compactHeroToSectionSpacing: isPerson ? 0 : ImmersiveSpacing.sectionGap,
      firstSectionPadding: isPerson
          ? EdgeInsets.fromLTRB(
              landscapeContentInsets.left,
              0,
              landscapeContentInsets.right,
              0,
            )
          : EdgeInsets.zero,
      remainingSectionsPadding: isPerson
          ? EdgeInsets.fromLTRB(
              landscapeContentInsets.left,
              0,
              landscapeContentInsets.right,
              0,
            )
          : EdgeInsets.zero,
    );
  }

  List<Widget> _buildPersonSections() {
    final seerrCrewCredits = _processedSeerrItems(
      _seerrCrewCredits,
      isCrew: true,
    );

    final seerrAppearances = _processedSeerrItems(
      _seerrAppearances,
      isCrew: false,
    );

    return [
      _ImmersiveSectionEntrance(
        delay: Duration.zero,
        child: ImmersivePersonContent(
          key: _personContentKey,
          viewModel: _vm,
          prefs: widget.prefs,
          seerrCrewCredits: seerrCrewCredits,
          seerrAppearances: seerrAppearances,
          onBackdropItemFocused: widget.onBackdropItemFocused,
          onNavigateUp: _focusPersonHero,
          onNavigateDown: _focusPersonRail,
          onRailNavigateUp: _focusPersonTabs,
          onRailNavigateDown: () {},
        ),
      ),
    ];
  }

  List<Widget> _buildMediaSections(
    BuildContext context,
    AggregatedItem item,
    EdgeInsets contentInsets,
  ) {
    final sections = <Widget>[];

    final isPhonePortrait = _isPhonePortrait(context);

    final sectionGap = isPhonePortrait
        ? ImmersiveSpacing.mobileSectionGap
        : ImmersiveSpacing.sectionGap;

    final detailsSectionGap = isPhonePortrait
        ? ImmersiveSpacing.mobileDetailsSectionGap
        : ImmersiveSpacing.detailsSectionGap;

    void addSection(String name, Widget child) {
      final index = sections.length;

      sections.add(
        KeyedSubtree(
          key: ValueKey<String>('immersive-section-$name'),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              contentInsets.left,
              index == 0 ? 0 : sectionGap,
              contentInsets.right,
              0,
            ),
            child: _ImmersiveSectionEntrance(
              delay: Duration(milliseconds: index * 40),
              child: child,
            ),
          ),
        ),
      );
    }

    final sectionWidgets = <GlobalKey, Widget>{};

    if (item.type == 'Series' || item.type == 'Season') {
      sectionWidgets[_episodesSectionKey] = SizedBox(
        width: double.infinity,
        child: ImmersiveEpisodesSection(
          key: _episodesSectionKey,
          viewModel: _vm,
          prefs: widget.prefs,
          actionButtonsKey: _actionButtonsKey,
          onBackdropItemFocused: widget.onBackdropItemFocused,
          onNavigateUp: () => _moveUp(_episodesSectionKey),
          onNavigateDown: () => _moveDown(_episodesSectionKey),
        ),
      );
    }

    if (ImmersiveCollectionSection.shouldInclude(_vm)) {
      sectionWidgets[_collectionSectionKey] = _buildCollectionSection();
    }

    if (_shouldShowChapters(item)) {
      sectionWidgets[_chaptersSectionKey] = _buildChaptersSection(item);
    }

    if (_vm.features.isNotEmpty) {
      sectionWidgets[_extrasSectionKey] = _buildExtrasSection();
    }

    if (ImmersiveDiscoverySection.shouldInclude(_vm)) {
      sectionWidgets[_discoverySectionKey] = _buildDiscoverySection();
    }

    if (_vm.actors.isNotEmpty ||
        _vm.directors.isNotEmpty ||
        _vm.writers.isNotEmpty) {
      sectionWidgets[_peopleSectionKey] = _buildCastCrewSection(item);
    }

    for (final key in _orderedMediaSectionKeys(item)) {
      final child = sectionWidgets[key];

      if (child != null) {
        addSection(_sectionName(key), child);
      }
    }

    final detailsIndex = sections.length;

    sections.add(
      KeyedSubtree(
        key: const ValueKey<String>('immersive-section-details'),
        child: Padding(
          padding: EdgeInsets.only(
            top: sections.isEmpty ? 0 : detailsSectionGap,
          ),
          child: _ImmersiveSectionEntrance(
            delay: Duration(milliseconds: detailsIndex * 40),
            child: KeyedSubtree(
              key: _detailsRevealKey,
              child: _buildDetailsSection(item, contentInsets),
            ),
          ),
        ),
      ),
    );

    return sections;
  }

  List<GlobalKey> _orderedMediaSectionKeys(AggregatedItem item) {
    final keys = <GlobalKey>[];

    if (item.type == 'Series' || item.type == 'Season') {
      keys.add(_episodesSectionKey);
    }

    if (ImmersiveCollectionSection.shouldInclude(_vm)) {
      keys.add(_collectionSectionKey);
    }

    if (_shouldShowChapters(item)) {
      keys.add(_chaptersSectionKey);
    }

    if (_vm.features.isNotEmpty) {
      keys.add(_extrasSectionKey);
    }

    if (ImmersiveDiscoverySection.shouldInclude(_vm)) {
      keys.add(_discoverySectionKey);
    }

    if (_vm.actors.isNotEmpty ||
        _vm.directors.isNotEmpty ||
        _vm.writers.isNotEmpty) {
      keys.add(_peopleSectionKey);
    }

    return keys;
  }

  String _sectionName(GlobalKey key) {
    if (key == _episodesSectionKey) {
      return 'episodes';
    }

    if (key == _collectionSectionKey) {
      return 'collection';
    }

    if (key == _chaptersSectionKey) {
      return 'chapters';
    }

    if (key == _extrasSectionKey) {
      return 'extras';
    }

    if (key == _discoverySectionKey) {
      return 'discovery';
    }

    return 'people';
  }

  List<SeerrDiscoverItem> _processedSeerrItems(
    List<SeerrDiscoverItem>? items, {
    required bool isCrew,
  }) {
    if (items == null || items.isEmpty) {
      return const [];
    }

    final grouped = _groupSeerrItems(items, isCrew: isCrew);

    return _sortSeerrItems(grouped);
  }

  List<SeerrDiscoverItem> _groupSeerrItems(
    List<SeerrDiscoverItem> items, {
    required bool isCrew,
  }) {
    final shouldGroup = widget.prefs.get(UserPreferences.personPageGroupItems);

    if (!shouldGroup) {
      return List<SeerrDiscoverItem>.from(items);
    }

    final grouped = <int, List<SeerrDiscoverItem>>{};

    for (final item in items) {
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
            .map((entry) => entry.job ?? entry.department)
            .where((job) => job != null && job.isNotEmpty)
            .map((job) => job!)
            .toSet();

        final combinedJobs = jobs.join(', ');

        result.add(
          SeerrDiscoverItem(
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
          ),
        );

        continue;
      }

      final characters = entries
          .map((entry) => entry.character)
          .where((character) => character != null && character.isNotEmpty)
          .map((character) => character!)
          .toSet();

      final combinedCharacters = characters.join(', ');

      result.add(
        SeerrDiscoverItem(
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
        ),
      );
    }

    return result;
  }

  List<SeerrDiscoverItem> _sortSeerrItems(List<SeerrDiscoverItem> items) {
    final sortOption = widget.prefs.get(UserPreferences.personPageSortOption);

    final sorted = List<SeerrDiscoverItem>.from(items);

    if (sortOption == 'alphabetical') {
      sorted.sort(
        (a, b) => a.displayTitle.toLowerCase().compareTo(
          b.displayTitle.toLowerCase(),
        ),
      );

      return sorted;
    }

    final ascending = sortOption == 'releaseDateAsc';

    sorted.sort((a, b) {
      final dateStringA = a.releaseDate ?? a.firstAirDate;
      final dateStringB = b.releaseDate ?? b.firstAirDate;

      if (dateStringA == null && dateStringB == null) {
        return a.displayTitle.toLowerCase().compareTo(
          b.displayTitle.toLowerCase(),
        );
      }

      if (dateStringA == null) {
        return 1;
      }

      if (dateStringB == null) {
        return -1;
      }

      final dateA = DateTime.tryParse(dateStringA);
      final dateB = DateTime.tryParse(dateStringB);

      if (dateA == null && dateB == null) {
        return dateStringA.compareTo(dateStringB);
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

  Widget _buildBackdrop(
    BuildContext context,
    String? backdropUrl,
    AggregatedItem item,
  ) {
    final base = Theme.of(context).scaffoldBackgroundColor;

    final portrait = _usePortraitLayout(context);

    final backgroundAmount = widget.prefs
        .get(UserPreferences.detailsBackgroundBlurAmount)
        .toDouble()
        .clamp(0.0, 25.0)
        .toDouble();

    final opacityFactor = backgroundAmount / 25.0;

    final maxAlpha = item.type == 'Person' ? 0.40 : 0.80;

    final overlayAlpha = opacityFactor * maxAlpha;

    final gradientScale = 0.3 + 0.7 * opacityFactor;

    double scaledAlpha(double alpha) {
      return (alpha * gradientScale).clamp(0.0, 1.0).toDouble();
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: base),

        FullscreenBackdropSwitcher(
          imageUrl: backdropUrl != null && backdropUrl.isNotEmpty
              ? backdropUrl
              : null,
          duration: const Duration(milliseconds: 350),
          alignment: portrait ? Alignment.topCenter : Alignment.centerRight,
          fadeInDuration: Duration.zero,
          imageBuilder: (imageUrl) => OfflineAwareImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            alignment: portrait ? Alignment.topCenter : Alignment.centerRight,
            fadeInDuration: Duration.zero,
            errorWidget: (_, _, _) => const SizedBox.shrink(),
          ),
        ),

        ColoredBox(color: Colors.black.withValues(alpha: overlayAlpha)),

        if (!portrait)
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  base.withValues(alpha: scaledAlpha(0.96)),
                  base.withValues(alpha: scaledAlpha(0.86)),
                  base.withValues(alpha: scaledAlpha(0.58)),
                  base.withValues(alpha: scaledAlpha(0.22)),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.18, 0.38, 0.60, 0.82],
              ),
            ),
          ),

        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: portrait
                  ? [
                      base.withValues(alpha: scaledAlpha(1.0)),
                      base.withValues(alpha: scaledAlpha(0.96)),
                      base.withValues(alpha: scaledAlpha(0.76)),
                      base.withValues(alpha: scaledAlpha(0.30)),
                      Colors.transparent,
                    ]
                  : [
                      base.withValues(alpha: scaledAlpha(1.0)),
                      base.withValues(alpha: scaledAlpha(0.96)),
                      base.withValues(alpha: scaledAlpha(0.78)),
                      base.withValues(alpha: scaledAlpha(0.48)),
                      base.withValues(alpha: scaledAlpha(0.18)),
                      Colors.transparent,
                    ],
              stops: portrait
                  ? const [0.00, 0.20, 0.43, 0.68, 0.88]
                  : const [0.00, 0.18, 0.38, 0.58, 0.76, 0.94],
            ),
          ),
        ),

        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(
                  alpha: scaledAlpha(portrait ? 0.20 : 0.28),
                ),
                Colors.black.withValues(
                  alpha: scaledAlpha(portrait ? 0.04 : 0.08),
                ),
                Colors.transparent,
              ],
              stops: const [0.0, 0.18, 0.42],
            ),
          ),
        ),

        if (!portrait)
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.30, -0.10),
                radius: 1.15,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withValues(alpha: scaledAlpha(0.12)),
                  Colors.black.withValues(alpha: scaledAlpha(0.30)),
                ],
                stops: const [0.00, 0.58, 0.82, 1.00],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCollectionSection() {
    return ImmersiveCollectionSection(
      key: _collectionSectionKey,
      viewModel: _vm,
      prefs: widget.prefs,
      actionButtonsKey: _actionButtonsKey,
      onNavigateUp: () => _moveUp(_collectionSectionKey),
      onNavigateDown: () => _moveDown(_collectionSectionKey),
      onRevealRequested: _scheduleOuterReveal,
    );
  }

  Widget _buildExtrasSection() {
    return ImmersiveExtrasSection(
      key: _extrasSectionKey,
      items: _vm.features,
      imageApi: _vm.imageApi,
      prefs: widget.prefs,
      onNavigateUp: () => _moveUp(_extrasSectionKey),
      onNavigateDown: () => _moveDown(_extrasSectionKey),
    );
  }

  Widget _buildChaptersSection(AggregatedItem item) {
    return ImmersiveChaptersSection(
      key: _chaptersSectionKey,
      item: item,
      imageApi: _vm.imageApi,
      onPlayFromChapter: widget.onPlayFromChapter ?? (_) {},
      onNavigateUp: () => _moveUp(_chaptersSectionKey),
      onNavigateDown: () => _moveDown(_chaptersSectionKey),
    );
  }

  Widget _buildDiscoverySection() {
    return ImmersiveDiscoverySection(
      key: _discoverySectionKey,
      viewModel: _vm,
      prefs: widget.prefs,
      onNavigateUp: () => _moveUp(_discoverySectionKey),
      onNavigateDown: () => _moveDown(_discoverySectionKey),
      onRevealRequested: _scheduleOuterReveal,
    );
  }

  Widget _buildCastCrewSection(AggregatedItem item) {
    return ImmersivePeopleSection(
      key: _peopleSectionKey,
      actors: _vm.actors,
      directors: _vm.directors,
      writers: _vm.writers,
      imageApi: _vm.imageApi,
      serverId: item.serverId,
      onNavigateUp: () => _moveUp(_peopleSectionKey),
      onNavigateDown: () => _moveDown(_peopleSectionKey),
    );
  }

  Widget _buildDetailsSection(AggregatedItem item, EdgeInsets contentInsets) {
    return ImmersiveDetailsSection(
      key: _detailsSectionKey,
      item: item,
      viewModel: _vm,
      contentInsets: contentInsets,
      selectedMediaSource: selectedMediaSourceForItem(
        item,
        widget.selectedMediaSourceId,
      ),
      onNavigateUp: _handleDetailsNavigateUp,
      onNavigateDown: _handleDetailsNavigateDown,
    );
  }
}

class _ImmersiveSectionEntrance extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const _ImmersiveSectionEntrance({required this.child, required this.delay});

  @override
  State<_ImmersiveSectionEntrance> createState() =>
      _ImmersiveSectionEntranceState();
}

class _ImmersiveSectionEntranceState extends State<_ImmersiveSectionEntrance>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(milliseconds: 240);

  late final AnimationController _controller;

  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _duration);

    final animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _opacity = animation;

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.025),
      end: Offset.zero,
    ).animate(animation);

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      _delayTimer = Timer(widget.delay, () {
        if (!mounted) {
          return;
        }

        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}
