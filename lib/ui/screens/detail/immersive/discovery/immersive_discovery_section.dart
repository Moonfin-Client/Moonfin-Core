import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/services/plugin_sync_service.dart';
import '../../../../../data/services/seerr/seerr_api_models.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../preference/preference_constants.dart';
import '../../../../../preference/user_preferences.dart';
import '../../../../../util/platform_detection.dart';
import '../../../../widgets/navigation_layout.dart';
import '../../../../widgets/focus/locked_focus_row.dart';
import '../../../../widgets/seerr/seerr_item_status.dart';
import '../shared/immersive_spacing.dart';
import 'immersive_discovery_card.dart';
import 'immersive_discovery_rail.dart';

class ImmersiveDiscoverySection extends StatefulWidget {
  final ItemDetailViewModel viewModel;

  final UserPreferences prefs;

  final bool Function()? onNavigateUp;

  final bool Function()? onNavigateDown;

  final ValueChanged<GlobalKey>? onRevealRequested;

  const ImmersiveDiscoverySection({
    super.key,
    required this.viewModel,
    required this.prefs,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onRevealRequested,
  });

  static bool supportsItem(AggregatedItem item) {
    return item.type == 'Movie' || item.type == 'Series';
  }

  static bool _seerrExpected(ItemDetailViewModel viewModel) {
    final item = viewModel.item;

    if (item == null || !supportsItem(item)) {
      return false;
    }

    if (!GetIt.instance<PluginSyncService>().seerrAvailable) {
      return false;
    }

    return (item.tmdbId?.isNotEmpty ?? false) ||
        (item.imdbId?.isNotEmpty ?? false);
  }

  static bool _seerrRelatedResolved(ItemDetailViewModel viewModel) {
    if (!_seerrExpected(viewModel)) {
      return true;
    }

    final seerr = viewModel.seerr;

    if (seerr == null) {
      return false;
    }

    if (seerr.state.error != null) {
      return true;
    }

    return seerr.relatedLoadComplete;
  }

  static bool shouldInclude(ItemDetailViewModel viewModel) {
    final item = viewModel.item;

    if (item == null || !supportsItem(item)) {
      return false;
    }

    if (!viewModel.similarInitialLoadComplete) {
      return true;
    }

    if (viewModel.similar.isNotEmpty) {
      return true;
    }

    if (!_seerrExpected(viewModel)) {
      return false;
    }

    if (!_seerrRelatedResolved(viewModel)) {
      return true;
    }

    final state = seerrItemTabState(viewModel);

    return state != null &&
        (state.similar.isNotEmpty || state.recommendations.isNotEmpty);
  }

  @override
  State<ImmersiveDiscoverySection> createState() =>
      ImmersiveDiscoverySectionState();
}

class ImmersiveDiscoverySectionState extends State<ImmersiveDiscoverySection>
    with TickerProviderStateMixin {
  static int _hubSession = 0;

  static const Duration _skeletonGracePeriod = Duration(milliseconds: 450);

  static const Duration _railFadeDuration = Duration(milliseconds: 220);

  late final String _relatedHubKey;

  late final String _recommendationsHubKey;

  late final AnimationController _relatedOpacityController;

  late final AnimationController _recommendationsOpacityController;

  final ScrollController _relatedScrollController = ScrollController();

  final ScrollController _recommendationsScrollController = ScrollController();

  final GlobalKey<LockedFocusRowState<AggregatedItem>> _relatedRowKey =
      GlobalKey<LockedFocusRowState<AggregatedItem>>();

  final GlobalKey<LockedFocusRowState<AggregatedItem>> _recommendationsRowKey =
      GlobalKey<LockedFocusRowState<AggregatedItem>>();

  final GlobalKey _relatedRevealKey = GlobalKey();

  final GlobalKey _recommendationsRevealKey = GlobalKey();

  Timer? _skeletonTimer;

  bool _skeletonDelayElapsed = false;

  bool _relatedSkeletonShown = false;

  bool _recommendationsSkeletonShown = false;

  bool _relatedCardsShown = false;

  bool _recommendationsCardsShown = false;

  String? _trackedItemId;

  List<AggregatedItem> _baseRelatedSnapshot = const [];

  bool _baseRelatedCaptured = false;

  ItemDetailViewModel get _vm => widget.viewModel;

  bool _isCompactMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return !PlatformDetection.isTV && size.shortestSide < 600;
  }

  GlobalKey? get topRevealKey {
    if (_related.isNotEmpty) {
      return _relatedRevealKey;
    }

    if (_recommendations.isNotEmpty) {
      return _recommendationsRevealKey;
    }

    return null;
  }

  GlobalKey? get bottomRevealKey {
    if (_recommendations.isNotEmpty) {
      return _recommendationsRevealKey;
    }

    if (_related.isNotEmpty) {
      return _relatedRevealKey;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    final session = _hubSession++;

    _relatedHubKey = 'immersive-discovery-related-$session';

    _recommendationsHubKey = 'immersive-discovery-recommendations-$session';

    _relatedOpacityController = AnimationController(
      vsync: this,
      duration: _railFadeDuration,
    );

    _recommendationsOpacityController = AnimationController(
      vsync: this,
      duration: _railFadeDuration,
    );

    _trackedItemId = _vm.item?.id;

    _captureBaseRelatedIfAvailable();

    _initializeContent();

    _vm.addListener(_onViewModelChanged);

    _startSkeletonGracePeriod();
  }

  @override
  void didUpdateWidget(covariant ImmersiveDiscoverySection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!identical(oldWidget.viewModel, widget.viewModel)) {
      oldWidget.viewModel.removeListener(_onViewModelChanged);

      widget.viewModel.addListener(_onViewModelChanged);

      _resetForItem();
    }
  }

  @override
  void dispose() {
    _skeletonTimer?.cancel();

    _vm.removeListener(_onViewModelChanged);

    _relatedOpacityController.dispose();

    _recommendationsOpacityController.dispose();

    _relatedScrollController.dispose();

    _recommendationsScrollController.dispose();

    super.dispose();
  }

  void _initializeContent() {
    if (_related.isNotEmpty) {
      _relatedCardsShown = true;

      _relatedOpacityController.forward(from: 0);
    }

    if (_recommendations.isNotEmpty) {
      _recommendationsCardsShown = true;

      _recommendationsOpacityController.forward(from: 0);
    }
  }

  void _onViewModelChanged() {
    if (!mounted) {
      return;
    }

    final itemId = _vm.item?.id;

    if (itemId != _trackedItemId) {
      _resetForItem();
      return;
    }

    _captureBaseRelatedIfAvailable();

    _syncRailContent();

    setState(() {});
  }

  void _resetForItem() {
    _skeletonTimer?.cancel();

    _trackedItemId = _vm.item?.id;

    _baseRelatedSnapshot = const [];

    _baseRelatedCaptured = false;

    _skeletonDelayElapsed = false;

    _relatedSkeletonShown = false;

    _recommendationsSkeletonShown = false;

    _relatedCardsShown = false;

    _recommendationsCardsShown = false;

    _relatedOpacityController
      ..stop()
      ..value = 0;

    _recommendationsOpacityController
      ..stop()
      ..value = 0;

    _captureBaseRelatedIfAvailable();

    _initializeContent();

    _startSkeletonGracePeriod();

    if (mounted) {
      setState(() {});
    }
  }

  void _startSkeletonGracePeriod() {
    _skeletonTimer?.cancel();

    _skeletonTimer = Timer(_skeletonGracePeriod, () {
      if (!mounted) {
        return;
      }

      _skeletonDelayElapsed = true;

      final related = _related;

      final recommendations = _recommendations;

      final baseWaiting = !_vm.similarInitialLoadComplete;

      final seerrWaiting = _seerrExpected && !_seerrRelatedResolved;

      var changed = false;

      if (related.isEmpty &&
          (baseWaiting || seerrWaiting) &&
          !_relatedCardsShown &&
          !_relatedSkeletonShown) {
        _relatedSkeletonShown = true;

        _relatedOpacityController.forward(from: 0);

        changed = true;
      }

      if (recommendations.isEmpty &&
          seerrWaiting &&
          !_recommendationsCardsShown &&
          !_recommendationsSkeletonShown) {
        _recommendationsSkeletonShown = true;

        _recommendationsOpacityController.forward(from: 0);

        changed = true;
      }

      if (changed) {
        setState(() {});
      }
    });
  }

  void _syncRailContent() {
    final related = _related;

    final recommendations = _recommendations;

    final hasRelated = related.isNotEmpty;

    final hasRecommendations = recommendations.isNotEmpty;

    if (hasRelated && !_relatedCardsShown) {
      final replacingSkeleton = _relatedSkeletonShown;

      _relatedCardsShown = true;

      _relatedSkeletonShown = false;

      if (replacingSkeleton) {
        _relatedOpacityController
          ..stop()
          ..value = 1;
      } else {
        _relatedOpacityController.forward(from: 0);
      }
    }

    if (hasRecommendations && !_recommendationsCardsShown) {
      final replacingSkeleton = _recommendationsSkeletonShown;

      _recommendationsCardsShown = true;

      _recommendationsSkeletonShown = false;

      if (replacingSkeleton) {
        _recommendationsOpacityController
          ..stop()
          ..value = 1;
      } else {
        _recommendationsOpacityController.forward(from: 0);
      }
    }

    final baseWaiting = !_vm.similarInitialLoadComplete;

    final seerrWaiting = _seerrExpected && !_seerrRelatedResolved;

    if (!hasRelated && !baseWaiting && !seerrWaiting && _relatedSkeletonShown) {
      _relatedSkeletonShown = false;

      _relatedOpacityController
        ..stop()
        ..value = 0;
    }

    if (!hasRecommendations && !seerrWaiting && _recommendationsSkeletonShown) {
      _recommendationsSkeletonShown = false;

      _recommendationsOpacityController
        ..stop()
        ..value = 0;
    }

    if (!_skeletonDelayElapsed) {
      return;
    }

    if (!hasRelated &&
        (baseWaiting || seerrWaiting) &&
        !_relatedCardsShown &&
        !_relatedSkeletonShown) {
      _relatedSkeletonShown = true;

      _relatedOpacityController.forward(from: 0);
    }

    if (!hasRecommendations &&
        seerrWaiting &&
        !_recommendationsCardsShown &&
        !_recommendationsSkeletonShown) {
      _recommendationsSkeletonShown = true;

      _recommendationsOpacityController.forward(from: 0);
    }
  }

  bool get _seerrExpected {
    final item = _vm.item;

    if (item == null ||
        !ImmersiveDiscoverySection.supportsItem(item) ||
        !GetIt.instance<PluginSyncService>().seerrAvailable) {
      return false;
    }

    return (item.tmdbId?.isNotEmpty ?? false) ||
        (item.imdbId?.isNotEmpty ?? false);
  }

  bool get _seerrRelatedResolved {
    if (!_seerrExpected) {
      return true;
    }

    final seerr = _vm.seerr;

    if (seerr == null) {
      return false;
    }

    if (seerr.state.error != null) {
      return true;
    }

    return seerr.relatedLoadComplete;
  }

  bool get _navbarIsLeft =>
      widget.prefs.get(UserPreferences.navbarPosition) == NavbarPosition.left;

  void _handleLeftEdge() {
    NavigationLayout.focusNavbarNotifier.value?.call();
  }

  void _captureBaseRelatedIfAvailable() {
    if (_baseRelatedCaptured || _vm.similar.isEmpty) {
      return;
    }

    _baseRelatedSnapshot = _dedupeBaseRelated(_vm.similar);

    _baseRelatedCaptured = true;
  }

  List<AggregatedItem> _dedupeBaseRelated(List<AggregatedItem> source) {
    final currentItem = _vm.item;

    final currentKeys = currentItem == null
        ? const <String>{}
        : _identityKeys(currentItem);

    final seen = <String>{};

    final result = <AggregatedItem>[];

    for (final item in source) {
      final keys = _identityKeys(item);

      if (_sharesIdentity(keys, currentKeys) || _sharesIdentity(keys, seen)) {
        continue;
      }

      seen.addAll(keys);

      result.add(item);
    }

    return List<AggregatedItem>.unmodifiable(result);
  }

  List<AggregatedItem> get _baseRelated {
    if (_baseRelatedCaptured) {
      return _baseRelatedSnapshot;
    }

    return _dedupeBaseRelated(_vm.similar);
  }

  int get _protectedBaseCount =>
      ImmersiveSpacing.discoveryVisibleItemCount.ceil();

  List<AggregatedItem> get _protectedBaseRelated {
    return _baseRelated.take(_protectedBaseCount).toList(growable: false);
  }

  List<AggregatedItem> get _baseRelatedTail {
    final base = _baseRelated;

    if (base.length <= _protectedBaseCount) {
      return const [];
    }

    return base.skip(_protectedBaseCount).toList(growable: false);
  }

  List<AggregatedItem> get _recommendations {
    final state = seerrItemTabState(_vm);

    if (state == null || state.recommendations.isEmpty) {
      return const [];
    }

    final protectedKeys = <String>{
      for (final item in _protectedBaseRelated) ..._identityKeys(item),
    };

    final currentItem = _vm.item;

    final currentKeys = currentItem == null
        ? const <String>{}
        : _identityKeys(currentItem);

    final seen = <String>{};

    final result = <AggregatedItem>[];

    for (final item in state.recommendations) {
      final converted = _seerrItemToAggregated(item);

      final keys = _identityKeys(converted);

      if (_sharesIdentity(keys, currentKeys) ||
          _sharesIdentity(keys, protectedKeys) ||
          _sharesIdentity(keys, seen)) {
        continue;
      }

      seen.addAll(keys);

      result.add(converted);
    }

    return result;
  }

  List<AggregatedItem> get _related {
    final protectedBase = _protectedBaseRelated;

    final baseTail = _baseRelatedTail;

    final state = seerrItemTabState(_vm);

    if (state == null) {
      return [...protectedBase, ...baseTail];
    }

    final recommendations = _recommendations;

    final recommendationKeys = <String>{
      for (final item in recommendations) ..._identityKeys(item),
    };

    final filteredTail = <AggregatedItem>[];

    final tailSeen = <String>{};

    for (final item in baseTail) {
      final keys = _identityKeys(item);

      if (_sharesIdentity(keys, recommendationKeys) ||
          _sharesIdentity(keys, tailSeen)) {
        continue;
      }

      tailSeen.addAll(keys);

      filteredTail.add(item);
    }

    final result = <AggregatedItem>[...protectedBase, ...filteredTail];

    final currentItem = _vm.item;

    final currentKeys = currentItem == null
        ? const <String>{}
        : _identityKeys(currentItem);

    final seen = <String>{for (final item in result) ..._identityKeys(item)};

    // Source API calls this collection "similar". Inside Immersive Discovery
    // it is treated as the related-content rail.
    for (final item in state.similar) {
      final converted = _seerrItemToAggregated(item);

      final keys = _identityKeys(converted);

      if (_sharesIdentity(keys, currentKeys) ||
          _sharesIdentity(keys, seen) ||
          _sharesIdentity(keys, recommendationKeys)) {
        continue;
      }

      seen.addAll(keys);

      result.add(converted);
    }

    return result;
  }

  Set<String> _identityKeys(AggregatedItem item) {
    final keys = <String>{};

    final mediaType = switch (item.type) {
      'Series' => 'tv',
      'Movie' => 'movie',
      final type? => type.toLowerCase(),
      null => 'unknown',
    };

    final tmdbId = item.tmdbId?.trim();

    if (tmdbId != null && tmdbId.isNotEmpty) {
      keys.add('tmdb:$mediaType:$tmdbId');
    }

    final normalizedTitle = item.name.trim().toLowerCase().replaceAll(
      RegExp(r'\s+'),
      ' ',
    );

    if (normalizedTitle.isNotEmpty) {
      final year = item.productionYear?.toString() ?? '';

      keys.add('title:$mediaType:$normalizedTitle|year:$year');
    }

    if (keys.isEmpty) {
      keys.add('server:${item.serverId}|id:${item.id}');
    }

    return keys;
  }

  bool _sharesIdentity(Set<String> itemKeys, Set<String> knownKeys) {
    for (final key in itemKeys) {
      if (knownKeys.contains(key)) {
        return true;
      }
    }

    return false;
  }

  AggregatedItem _seerrItemToAggregated(SeerrDiscoverItem item) {
    final mediaType = item.mediaType ?? 'movie';

    final date = item.releaseDate ?? item.firstAirDate;

    final year = date != null && date.length >= 4
        ? int.tryParse(date.substring(0, 4))
        : null;

    return AggregatedItem(
      id: item.id.toString(),
      serverId: 'seerr',
      rawData: {
        'Name': item.displayTitle,
        'Overview': item.overview,
        'Type': mediaType == 'tv' ? 'Series' : 'Movie',
        'ProviderIds': {'Tmdb': item.id.toString()},
        'PosterPath': item.posterPath,
        'BackdropPath': item.backdropPath,
        'ProductionYear': ?year,
        'PremiereDate': ?date,
        'CommunityRating': item.voteAverage,
        'SeerrMediaType': mediaType,
        'SeerrStatus': item.mediaInfo?.status,
        'UserData': const {'Played': false, 'IsFavorite': false},
        'MediaSources': const [],
        'MediaStreams': const [],
        'CanDelete': false,
      },
    );
  }

  bool get canFocusTop {
    if (!mounted) {
      return false;
    }

    if (_related.isNotEmpty) {
      return _relatedRowKey.currentState != null;
    }

    if (_recommendations.isNotEmpty) {
      return _recommendationsRowKey.currentState != null;
    }

    return false;
  }

  bool focusTop() {
    if (_related.isNotEmpty && _relatedRowKey.currentState != null) {
      _relatedRowKey.currentState!.requestFocusFromMemory();

      return true;
    }

    if (_recommendations.isNotEmpty &&
        _recommendationsRowKey.currentState != null) {
      _recommendationsRowKey.currentState!.requestFocusFromMemory();

      return true;
    }

    return false;
  }

  bool focusBottom() {
    if (_recommendations.isNotEmpty &&
        _recommendationsRowKey.currentState != null) {
      _recommendationsRowKey.currentState!.requestFocusFromMemory();

      return true;
    }

    if (_related.isNotEmpty && _relatedRowKey.currentState != null) {
      _relatedRowKey.currentState!.requestFocusFromMemory();

      return true;
    }

    return false;
  }

  bool _focusRelated() {
    if (_related.isEmpty || _relatedRowKey.currentState == null) {
      return false;
    }

    _relatedRowKey.currentState!.requestFocusFromMemory();

    widget.onRevealRequested?.call(_relatedRevealKey);

    return true;
  }

  bool _focusRecommendations() {
    if (_recommendations.isEmpty ||
        _recommendationsRowKey.currentState == null) {
      return false;
    }

    _recommendationsRowKey.currentState!.requestFocusFromMemory();

    widget.onRevealRequested?.call(_recommendationsRevealKey);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final related = _related;

    final recommendations = _recommendations;

    final baseWaiting = !_vm.similarInitialLoadComplete;

    final seerrWaiting = _seerrExpected && !_seerrRelatedResolved;

    final showRelated = related.isNotEmpty || baseWaiting || seerrWaiting;

    final showRecommendations =
        _seerrExpected && (recommendations.isNotEmpty || seerrWaiting);

    if (!showRelated && !showRecommendations) {
      return const SizedBox.shrink();
    }

    final compact = _isCompactMobile(context);

    final interRailSpacing = compact
        ? ImmersiveSpacing.mobileSectionGap
        : ImmersiveSpacing.sectionGap;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showRelated)
          KeyedSubtree(
            key: _relatedRevealKey,
            child: ImmersiveDiscoveryRail(
              // Existing localization key kept because changing generated
              // localization API is outside this UI cleanup.
              title: l10n.similar,
              items: related,
              showSkeleton: _relatedSkeletonShown && related.isEmpty,
              opacity: _relatedOpacityController,
              rowKey: _relatedRowKey,
              hubKey: _relatedHubKey,
              controller: _relatedScrollController,
              onNavigateUp: () {
                return widget.onNavigateUp?.call() ?? false;
              },
              onNavigateDown: () {
                if (_focusRecommendations()) {
                  return true;
                }

                return widget.onNavigateDown?.call() ?? false;
              },
              onTap: (item) {
                ImmersiveDiscoveryCard.openItem(context, item);
              },
              onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
              itemBuilder: (context, item, width, isFocused) {
                return ImmersiveDiscoveryCard(
                  item: item,
                  imageApi: _vm.imageApi,
                  prefs: widget.prefs,
                  width: width,
                  isFocused: isFocused,
                );
              },
            ),
          ),

        if (showRelated && showRecommendations)
          SizedBox(height: interRailSpacing),

        if (showRecommendations)
          KeyedSubtree(
            key: _recommendationsRevealKey,
            child: ImmersiveDiscoveryRail(
              title: l10n.recommendations,
              items: recommendations,
              showSkeleton:
                  _recommendationsSkeletonShown && recommendations.isEmpty,
              opacity: _recommendationsOpacityController,
              rowKey: _recommendationsRowKey,
              hubKey: _recommendationsHubKey,
              controller: _recommendationsScrollController,
              onNavigateUp: () {
                if (_focusRelated()) {
                  return true;
                }

                return widget.onNavigateUp?.call() ?? false;
              },
              onNavigateDown: () {
                return widget.onNavigateDown?.call() ?? false;
              },
              onTap: (item) {
                ImmersiveDiscoveryCard.openItem(context, item);
              },
              onLeftEdge: _navbarIsLeft ? _handleLeftEdge : null,
              itemBuilder: (context, item, width, isFocused) {
                return ImmersiveDiscoveryCard(
                  item: item,
                  imageApi: _vm.imageApi,
                  prefs: widget.prefs,
                  width: width,
                  isFocused: isFocused,
                );
              },
            ),
          ),
      ],
    );
  }
}
