import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:playback_core/playback_core.dart';
import 'package:server_core/server_core.dart';

import '../../../../../data/models/aggregated_item.dart';
import '../../../../../data/viewmodels/item_detail_view_model.dart';
import '../../../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../util/detail_track_highlight.dart';
import '../../../../navigation/destinations.dart';
import '../../../../widgets/seerr/seerr_item_chips.dart';
import '../../../../widgets/seerr/seerr_item_status.dart';
import '../../../../widgets/seerr/seerr_stats_card.dart';
import '../../item_detail_screen.dart' show selectedMediaSourceForItem;
import '../shared/immersive_spacing.dart';

class ImmersiveDetailsSection extends StatefulWidget {
  final AggregatedItem item;
  final ItemDetailViewModel viewModel;
  final Map<String, dynamic>? selectedMediaSource;

  /// The section background is full-bleed.
  ///
  /// These insets only align its inner content with the rest of Immersive.
  final EdgeInsets contentInsets;
  final bool Function()? onNavigateUp;
  final bool Function()? onNavigateDown;

  const ImmersiveDetailsSection({
    super.key,
    required this.item,
    required this.viewModel,
    required this.selectedMediaSource,
    required this.contentInsets,
    this.onNavigateUp,
    this.onNavigateDown,
  });

  @override
  State<ImmersiveDetailsSection> createState() =>
      ImmersiveDetailsSectionState();
}

class ImmersiveDetailsSectionState extends State<ImmersiveDetailsSection> {
  static const double _studioRowTolerance = 12;

  final GlobalKey _studiosRevealKey = GlobalKey();
  final GlobalKey _seerrRevealKey = GlobalKey();
  final GlobalKey _readingContentKey = GlobalKey();

  PlaybackInfoResult? _playbackInfo;

  bool _loadingPlaybackInfo = false;
  bool _playbackInfoFailed = false;

  String? _loadedPlaybackInfoItemId;
  String? _loadedMediaSourceId;
  int? _loadedAudioIndex;
  int? _loadedSubtitleIndex;

  String? _loadingPlaybackInfoItemId;
  String? _loadingMediaSourceId;
  int? _loadingAudioIndex;
  int? _loadingSubtitleIndex;

  int _playbackInfoRequestSerial = 0;

  late final FocusNode _seerrChipsFocusNode = FocusNode(
    debugLabel: 'immersive-details-seerr-chips',
  );

  late final FocusNode _readingFocusNode = FocusNode(
    debugLabel: 'immersive-details-reader',
  );

  final Map<String, FocusNode> _studioFocusNodes = {};

  String? _focusedStudioKey;
  String? _lastFocusedStudioKey;

  ItemDetailViewModel get _vm => widget.viewModel;

  SeerrMediaDetailState? get _seerrState => seerrItemTabState(_vm);

  bool get _hasSeerrChips {
    final state = _seerrState;

    return state != null && SeerrItemChips.hasContent(state);
  }

  bool _hasSeerrStats(BuildContext context) {
    final state = _seerrState;

    return state != null &&
        SeerrStatsCard.hasContent(state, AppLocalizations.of(context));
  }

  GlobalKey? get topRevealKey {
    final studios = _studioNames(widget.item);

    if (studios.isNotEmpty) {
      return _studiosRevealKey;
    }

    if (_hasSeerrChips) {
      return _seerrRevealKey;
    }

    return _readingContentKey;
  }

  GlobalKey? get bottomRevealKey {
    final targetItem = _getRelevantEpisode(widget.item) ?? widget.item;

    final isPlayable =
        targetItem.type != 'Series' &&
        targetItem.type != 'Season' &&
        targetItem.type != 'Person';

    final hasTechnicalDetails =
        isPlayable && _mediaSourceFor(targetItem) != null;

    final hasStats = mounted && _hasSeerrStats(context);

    if (hasStats || hasTechnicalDetails) {
      return _readingContentKey;
    }

    if (_hasSeerrChips) {
      return _seerrRevealKey;
    }

    final studios = _studioNames(widget.item);

    if (studios.isNotEmpty) {
      return _studiosRevealKey;
    }

    return null;
  }

  @override
  void dispose() {
    _seerrChipsFocusNode.dispose();
    _readingFocusNode.dispose();

    for (final node in _studioFocusNodes.values) {
      node.dispose();
    }

    _studioFocusNodes.clear();

    super.dispose();
  }

  bool get canFocusTop {
    if (!mounted) {
      return false;
    }

    final studios = _studioNames(widget.item);

    if (studios.isNotEmpty) {
      final key = _studioKey(0, studios.first);
      final node = _studioFocusNodes[key];

      return node != null && node.canRequestFocus && node.context != null;
    }

    if (_hasSeerrChips) {
      return _seerrChipsFocusNode.canRequestFocus &&
          _seerrChipsFocusNode.context != null;
    }

    return _readingFocusNode.canRequestFocus &&
        _readingFocusNode.context != null;
  }

  bool focusTop() {
    final studios = _studioNames(widget.item);

    if (studios.isNotEmpty &&
        _focusFirstStudio(studios, scrollIfNeeded: false)) {
      return true;
    }

    if (_hasSeerrChips &&
        _seerrChipsFocusNode.canRequestFocus &&
        _seerrChipsFocusNode.context != null) {
      _seerrChipsFocusNode.requestFocus();

      return true;
    }

    if (_readingFocusNode.canRequestFocus &&
        _readingFocusNode.context != null) {
      _readingFocusNode.requestFocus();

      return true;
    }

    return false;
  }

  bool focusBottom() {
    final targetItem = _getRelevantEpisode(widget.item) ?? widget.item;

    final isPlayable =
        targetItem.type != 'Series' &&
        targetItem.type != 'Season' &&
        targetItem.type != 'Person';

    final hasTechnicalDetails =
        isPlayable && _mediaSourceFor(targetItem) != null;

    final hasStats = mounted && _hasSeerrStats(context);

    if ((hasStats || hasTechnicalDetails) &&
        _readingFocusNode.canRequestFocus &&
        _readingFocusNode.context != null) {
      _readingFocusNode.requestFocus();

      return true;
    }

    if (_hasSeerrChips &&
        _seerrChipsFocusNode.canRequestFocus &&
        _seerrChipsFocusNode.context != null) {
      _seerrChipsFocusNode.requestFocus();

      return true;
    }

    final studios = _studioNames(widget.item);

    if (studios.isNotEmpty) {
      return _focusLastStudio(studios, scrollIfNeeded: false);
    }

    return false;
  }

  AggregatedItem? _getRelevantEpisode(AggregatedItem item) {
    if (item.type == 'Episode') {
      return item;
    }

    if (item.type == 'Series') {
      if (_vm.nextUp != null) {
        return _vm.nextUp;
      }

      if (_vm.seriesEpisodes.isNotEmpty) {
        try {
          return _vm.seriesEpisodes.firstWhere((episode) => !episode.isPlayed);
        } catch (_) {
          return _vm.seriesEpisodes.first;
        }
      }
    }

    if (item.type == 'Season' && _vm.episodes.isNotEmpty) {
      return _vm.episodes.first;
    }

    return null;
  }

  Map<String, dynamic>? _mediaSourceFor(AggregatedItem item) {
    final selectedSourceId = widget.selectedMediaSource?['Id']?.toString();

    return selectedMediaSourceForItem(item, selectedSourceId);
  }

  List<String> _studioNames(AggregatedItem item) {
    final names = <String>[];
    final seen = <String>{};

    for (final studio in item.studios) {
      final name = studio['Name']?.toString().trim() ?? '';

      if (name.isEmpty) {
        continue;
      }

      final normalized = name.toLowerCase();

      if (seen.add(normalized)) {
        names.add(name);
      }
    }

    return names;
  }

  String _studioKey(int index, String name) => '$index:$name';

  FocusNode _studioFocusNode({
    required int index,
    required String name,
    required bool hasSeerrChips,
    required bool hasReadingContent,
    required VoidCallback onActivate,
  }) {
    final key = _studioKey(index, name);

    final node = _studioFocusNodes.putIfAbsent(
      key,
      () => FocusNode(debugLabel: 'immersive-details-studio-$index'),
    );

    node.onKeyEvent = (_, event) {
      if (event is KeyDownEvent &&
          (event.logicalKey == LogicalKeyboardKey.enter ||
              event.logicalKey == LogicalKeyboardKey.select ||
              event.logicalKey == LogicalKeyboardKey.space)) {
        onActivate();

        return KeyEventResult.handled;
      }

      if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
        return KeyEventResult.ignored;
      }

      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        _focusStudioHorizontal(
          currentNode: node,
          direction: AxisDirection.left,
        );

        return KeyEventResult.handled;
      }

      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        _focusStudioHorizontal(
          currentNode: node,
          direction: AxisDirection.right,
        );

        return KeyEventResult.handled;
      }

      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        final moved = _focusStudioVertical(
          currentNode: node,
          direction: AxisDirection.up,
        );

        if (moved) {
          return KeyEventResult.handled;
        }

        final movedOutside = widget.onNavigateUp?.call() ?? false;

        return movedOutside ? KeyEventResult.handled : KeyEventResult.ignored;
      }

      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        final moved = _focusStudioVertical(
          currentNode: node,
          direction: AxisDirection.down,
        );

        if (moved) {
          return KeyEventResult.handled;
        }

        if (hasSeerrChips &&
            _seerrChipsFocusNode.canRequestFocus &&
            _seerrChipsFocusNode.context != null) {
          _seerrChipsFocusNode.requestFocus();

          return KeyEventResult.handled;
        }

        if (hasReadingContent &&
            _readingFocusNode.canRequestFocus &&
            _readingFocusNode.context != null) {
          _readingFocusNode.requestFocus();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              return;
            }

            _scrollReadingByViewport(direction: AxisDirection.down);
          });

          return KeyEventResult.handled;
        }

        final movedOutside = widget.onNavigateDown?.call() ?? false;

        return movedOutside ? KeyEventResult.handled : KeyEventResult.ignored;
      }

      return KeyEventResult.ignored;
    };

    return node;
  }

  void _requestStudioFocus(FocusNode node, {required bool scrollIfNeeded}) {
    if (!node.canRequestFocus || node.context == null) {
      return;
    }

    node.requestFocus();

    if (!scrollIfNeeded) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      _revealStudio(node);
    });
  }

  Future<void> _revealStudio(FocusNode node) async {
    if (!mounted) {
      return;
    }

    final context = node.context;

    if (context == null) {
      return;
    }

    final renderObject = context.findRenderObject();

    if (renderObject == null || !renderObject.attached) {
      return;
    }

    final scrollable = Scrollable.maybeOf(context);

    if (scrollable == null) {
      return;
    }

    final position = scrollable.position;

    if (!position.hasPixels || !position.hasContentDimensions) {
      return;
    }

    final viewport = RenderAbstractViewport.maybeOf(renderObject);

    if (viewport == null) {
      return;
    }

    final revealed = viewport.getOffsetToReveal(renderObject, 0.5);

    final target = revealed.offset
        .clamp(position.minScrollExtent, position.maxScrollExtent)
        .toDouble();

    if ((target - position.pixels).abs() < 1) {
      return;
    }

    await position.animateTo(
      target,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOutCubic,
    );
  }

  bool _scrollReadingByViewport({required AxisDirection direction}) {
    final context = _readingContentKey.currentContext;

    if (context == null) {
      return false;
    }

    final renderObject = context.findRenderObject();

    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return false;
    }

    final scrollable = Scrollable.maybeOf(context);

    if (scrollable == null) {
      return false;
    }

    final position = scrollable.position;

    if (!position.hasPixels || !position.hasContentDimensions) {
      return false;
    }

    final screenHeight = MediaQuery.sizeOf(context).height;

    final contentTop = renderObject.localToGlobal(Offset.zero).dy;

    final contentBottom = renderObject
        .localToGlobal(renderObject.size.bottomLeft(Offset.zero))
        .dy;

    final safeTop = screenHeight * 0.14;
    final safeBottom = screenHeight * 0.86;

    final pageDistance = position.viewportDimension * 0.52;

    double delta;

    if (direction == AxisDirection.down) {
      final hiddenBelow = contentBottom - safeBottom;

      if (hiddenBelow <= 1) {
        return false;
      }

      delta = hiddenBelow < pageDistance ? hiddenBelow : pageDistance;
    } else if (direction == AxisDirection.up) {
      final hiddenAbove = safeTop - contentTop;

      if (hiddenAbove <= 1) {
        return false;
      }

      delta = -(hiddenAbove < pageDistance ? hiddenAbove : pageDistance);
    } else {
      return false;
    }

    final target = (position.pixels + delta)
        .clamp(position.minScrollExtent, position.maxScrollExtent)
        .toDouble();

    if ((target - position.pixels).abs() < 1) {
      return false;
    }

    position.animateTo(
      target,
      duration: const Duration(milliseconds: 210),
      curve: Curves.easeOutCubic,
    );

    return true;
  }

  List<MapEntry<FocusNode, Offset>> _studioNodesWithCenters() {
    final result = <MapEntry<FocusNode, Offset>>[];

    for (final node in _studioFocusNodes.values) {
      if (!node.canRequestFocus || node.context == null) {
        continue;
      }

      final center = _focusNodeCenter(node);

      if (center == null) {
        continue;
      }

      result.add(MapEntry(node, center));
    }

    return result;
  }

  bool _focusStudioHorizontal({
    required FocusNode currentNode,
    required AxisDirection direction,
  }) {
    final currentCenter = _focusNodeCenter(currentNode);

    if (currentCenter == null) {
      return false;
    }

    final nodes = _studioNodesWithCenters();

    final sameRow = nodes.where((entry) {
      if (entry.key == currentNode) {
        return false;
      }

      return (entry.value.dy - currentCenter.dy).abs() <= _studioRowTolerance;
    }).toList();

    MapEntry<FocusNode, Offset>? candidate;

    if (direction == AxisDirection.left) {
      final left =
          sameRow
              .where((entry) => entry.value.dx < currentCenter.dx - 1)
              .toList()
            ..sort((a, b) => b.value.dx.compareTo(a.value.dx));

      if (left.isNotEmpty) {
        candidate = left.first;
      }
    } else if (direction == AxisDirection.right) {
      final right =
          sameRow
              .where((entry) => entry.value.dx > currentCenter.dx + 1)
              .toList()
            ..sort((a, b) => a.value.dx.compareTo(b.value.dx));

      if (right.isNotEmpty) {
        candidate = right.first;
      }
    }

    if (candidate == null) {
      return false;
    }

    _requestStudioFocus(candidate.key, scrollIfNeeded: false);

    return true;
  }

  bool _focusStudioVertical({
    required FocusNode currentNode,
    required AxisDirection direction,
  }) {
    final currentCenter = _focusNodeCenter(currentNode);

    if (currentCenter == null) {
      return false;
    }

    final nodes = _studioNodesWithCenters();

    final candidates = nodes.where((entry) {
      if (entry.key == currentNode) {
        return false;
      }

      final dy = entry.value.dy - currentCenter.dy;

      if (direction == AxisDirection.up) {
        return dy < -_studioRowTolerance;
      }

      if (direction == AxisDirection.down) {
        return dy > _studioRowTolerance;
      }

      return false;
    }).toList();

    if (candidates.isEmpty) {
      return false;
    }

    final targetRowY = switch (direction) {
      AxisDirection.up =>
        candidates
            .map((entry) => entry.value.dy)
            .reduce((a, b) => a > b ? a : b),

      AxisDirection.down =>
        candidates
            .map((entry) => entry.value.dy)
            .reduce((a, b) => a < b ? a : b),

      _ => currentCenter.dy,
    };

    final targetRow = candidates.where((entry) {
      return (entry.value.dy - targetRowY).abs() <= _studioRowTolerance;
    }).toList();

    if (targetRow.isEmpty) {
      return false;
    }

    targetRow.sort((a, b) {
      final aDistance = (a.value.dx - currentCenter.dx).abs();

      final bDistance = (b.value.dx - currentCenter.dx).abs();

      final comparison = aDistance.compareTo(bDistance);

      if (comparison != 0) {
        return comparison;
      }

      return a.value.dx.compareTo(b.value.dx);
    });

    _requestStudioFocus(targetRow.first.key, scrollIfNeeded: true);

    return true;
  }

  Offset? _focusNodeCenter(FocusNode node) {
    final context = node.context;

    if (context == null) {
      return null;
    }

    final renderObject = context.findRenderObject();

    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return null;
    }

    return renderObject.localToGlobal(renderObject.size.center(Offset.zero));
  }

  bool _focusFirstStudio(List<String> studios, {required bool scrollIfNeeded}) {
    if (studios.isEmpty) {
      return false;
    }

    final key = _studioKey(0, studios.first);

    final node = _studioFocusNodes[key];

    if (node == null || !node.canRequestFocus || node.context == null) {
      return false;
    }

    _requestStudioFocus(node, scrollIfNeeded: scrollIfNeeded);

    return true;
  }

  bool _focusRememberedStudio(
    List<String> studios, {
    required bool scrollIfNeeded,
  }) {
    if (studios.isEmpty) {
      return false;
    }

    final rememberedKey = _lastFocusedStudioKey;

    if (rememberedKey != null) {
      final node = _studioFocusNodes[rememberedKey];

      if (node != null && node.canRequestFocus && node.context != null) {
        _requestStudioFocus(node, scrollIfNeeded: scrollIfNeeded);

        return true;
      }
    }

    return _focusLastStudio(studios, scrollIfNeeded: scrollIfNeeded);
  }

  bool _focusLastStudio(List<String> studios, {required bool scrollIfNeeded}) {
    if (studios.isEmpty) {
      return false;
    }

    final index = studios.length - 1;

    final key = _studioKey(index, studios[index]);

    final node = _studioFocusNodes[key];

    if (node == null || !node.canRequestFocus || node.context == null) {
      return false;
    }

    _requestStudioFocus(node, scrollIfNeeded: scrollIfNeeded);

    return true;
  }

  bool _focusSeerrChips() {
    if (!_hasSeerrChips ||
        !_seerrChipsFocusNode.canRequestFocus ||
        _seerrChipsFocusNode.context == null) {
      return false;
    }

    _seerrChipsFocusNode.requestFocus();

    return true;
  }

  bool _focusReading() {
    if (!_readingFocusNode.canRequestFocus ||
        _readingFocusNode.context == null) {
      return false;
    }

    _readingFocusNode.requestFocus();

    return true;
  }

  bool _playbackInfoLoadedFor(
    AggregatedItem item,
    Map<String, dynamic> mediaSource,
  ) {
    if (_playbackInfo == null && !_playbackInfoFailed) {
      return false;
    }

    return _loadedPlaybackInfoItemId == item.id &&
        _loadedMediaSourceId == mediaSource['Id']?.toString() &&
        _loadedAudioIndex == _vm.selectedAudioIndex &&
        _loadedSubtitleIndex == _vm.selectedSubtitleIndex;
  }

  bool _playbackInfoLoadingFor(
    AggregatedItem item,
    Map<String, dynamic> mediaSource,
  ) {
    if (!_loadingPlaybackInfo) {
      return false;
    }

    return _loadingPlaybackInfoItemId == item.id &&
        _loadingMediaSourceId == mediaSource['Id']?.toString() &&
        _loadingAudioIndex == _vm.selectedAudioIndex &&
        _loadingSubtitleIndex == _vm.selectedSubtitleIndex;
  }

  bool _playbackRequestStillMatchesCurrentState({
    required String itemId,
    required String? mediaSourceId,
    required int? audioIndex,
    required int? subtitleIndex,
  }) {
    final currentTarget = _getRelevantEpisode(widget.item) ?? widget.item;

    if (currentTarget.id != itemId) {
      return false;
    }

    final currentMediaSource = _mediaSourceFor(currentTarget);

    return currentMediaSource?['Id']?.toString() == mediaSourceId &&
        _vm.selectedAudioIndex == audioIndex &&
        _vm.selectedSubtitleIndex == subtitleIndex;
  }

  Future<void> _loadPlaybackInfo(
    AggregatedItem item,
    Map<String, dynamic> mediaSource,
  ) async {
    if (_playbackInfoLoadedFor(item, mediaSource) ||
        _playbackInfoLoadingFor(item, mediaSource)) {
      return;
    }

    final requestedItemId = item.id;

    final requestedMediaSourceId = mediaSource['Id']?.toString();

    final requestedAudioIndex = _vm.selectedAudioIndex;

    final requestedSubtitleIndex = _vm.selectedSubtitleIndex;

    final requestSerial = ++_playbackInfoRequestSerial;

    if (mounted) {
      setState(() {
        _loadingPlaybackInfo = true;
        _playbackInfoFailed = false;
        _playbackInfo = null;

        _loadingPlaybackInfoItemId = requestedItemId;

        _loadingMediaSourceId = requestedMediaSourceId;

        _loadingAudioIndex = requestedAudioIndex;

        _loadingSubtitleIndex = requestedSubtitleIndex;
      });
    }

    try {
      final client = GetIt.instance<MediaServerClient>();

      final manager = GetIt.instance<PlaybackManager>();

      final backend = manager.backend;

      final profile = backend?.getDeviceProfile() ?? {};

      final bitrate = (profile['MaxStreamingBitrate'] as num?)?.toInt();

      final request = PlaybackInfoRequest(
        itemId: requestedItemId,
        mediaSourceId: requestedMediaSourceId,
        audioStreamIndex: requestedAudioIndex,
        subtitleStreamIndex: requestedSubtitleIndex,
        deviceProfile: profile,
        maxStreamingBitrate: bitrate,
        enableDirectPlay: true,
        enableDirectStream: true,
        enableTranscoding: true,
      );

      final rawInfo = await client.playbackApi.getPlaybackInfo(
        requestedItemId,
        requestBody: request.toJson(),
        userId: client.userId,
      );

      final parsed = PlaybackInfoResult.fromJson(rawInfo);

      if (!mounted || requestSerial != _playbackInfoRequestSerial) {
        return;
      }

      final stillCurrent = _playbackRequestStillMatchesCurrentState(
        itemId: requestedItemId,
        mediaSourceId: requestedMediaSourceId,
        audioIndex: requestedAudioIndex,
        subtitleIndex: requestedSubtitleIndex,
      );

      if (!stillCurrent) {
        setState(() {
          _loadingPlaybackInfo = false;

          _loadingPlaybackInfoItemId = null;
          _loadingMediaSourceId = null;
          _loadingAudioIndex = null;
          _loadingSubtitleIndex = null;
        });

        return;
      }

      setState(() {
        _loadingPlaybackInfo = false;
        _playbackInfoFailed = false;
        _playbackInfo = parsed;

        _loadedPlaybackInfoItemId = requestedItemId;

        _loadedMediaSourceId = requestedMediaSourceId;

        _loadedAudioIndex = requestedAudioIndex;

        _loadedSubtitleIndex = requestedSubtitleIndex;

        _loadingPlaybackInfoItemId = null;
        _loadingMediaSourceId = null;
        _loadingAudioIndex = null;
        _loadingSubtitleIndex = null;
      });
    } catch (_) {
      if (!mounted || requestSerial != _playbackInfoRequestSerial) {
        return;
      }

      final stillCurrent = _playbackRequestStillMatchesCurrentState(
        itemId: requestedItemId,
        mediaSourceId: requestedMediaSourceId,
        audioIndex: requestedAudioIndex,
        subtitleIndex: requestedSubtitleIndex,
      );

      if (!stillCurrent) {
        setState(() {
          _loadingPlaybackInfo = false;

          _loadingPlaybackInfoItemId = null;
          _loadingMediaSourceId = null;
          _loadingAudioIndex = null;
          _loadingSubtitleIndex = null;
        });

        return;
      }

      setState(() {
        _loadingPlaybackInfo = false;
        _playbackInfo = null;
        _playbackInfoFailed = true;

        _loadedPlaybackInfoItemId = requestedItemId;

        _loadedMediaSourceId = requestedMediaSourceId;

        _loadedAudioIndex = requestedAudioIndex;

        _loadedSubtitleIndex = requestedSubtitleIndex;

        _loadingPlaybackInfoItemId = null;
        _loadingMediaSourceId = null;
        _loadingAudioIndex = null;
        _loadingSubtitleIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final targetItem = _getRelevantEpisode(widget.item) ?? widget.item;

    final isPlayable =
        targetItem.type != 'Series' &&
        targetItem.type != 'Season' &&
        targetItem.type != 'Person';

    final studios = _studioNames(widget.item);

    final mediaSource = isPlayable ? _mediaSourceFor(targetItem) : null;

    final hasTechnicalDetails = mediaSource != null;

    final seerrState = _seerrState;

    final hasSeerrChips =
        seerrState != null && SeerrItemChips.hasContent(seerrState);

    final hasSeerrStats =
        seerrState != null &&
        SeerrStatsCard.hasContent(seerrState, AppLocalizations.of(context));

    final hasStudios = studios.isNotEmpty;

    if (!hasTechnicalDetails &&
        !hasStudios &&
        !hasSeerrChips &&
        !hasSeerrStats) {
      return const SizedBox.shrink();
    }

    if (mediaSource != null &&
        !_playbackInfoLoadedFor(targetItem, mediaSource) &&
        !_playbackInfoLoadingFor(targetItem, mediaSource)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }

        _loadPlaybackInfo(targetItem, mediaSource);
      });
    }

    return _buildDetailsSection(
      context,
      item: targetItem,
      mediaSource: mediaSource,
      studios: studios,
      seerrState: seerrState,
    );
  }

  Widget _buildDetailsSection(
    BuildContext context, {
    required AggregatedItem item,
    required Map<String, dynamic>? mediaSource,
    required List<String> studios,
    required SeerrMediaDetailState? seerrState,
  }) {
    final theme = Theme.of(context);

    final l10n = AppLocalizations.of(context);

    final foreground = AppColorScheme.onSurface;

    final hasTechnicalDetails = mediaSource != null;

    final hasStudios = studios.isNotEmpty;

    final hasSeerrChips =
        seerrState != null && SeerrItemChips.hasContent(seerrState);

    final hasSeerrStats =
        seerrState != null && SeerrStatsCard.hasContent(seerrState, l10n);

    final hasReadingContent = hasSeerrStats || hasTechnicalDetails;

    var fileName = '';
    var formattedSize = '';
    var container = '';

    var videoDetails = <String>[];

    var audioStreams = <Map<String, dynamic>>[];

    var subtitleStreams = <Map<String, dynamic>>[];

    int? activeAudioIndex;
    int? activeSubtitleIndex;

    String formatLanguage(String? code) {
      if (code == null || code.isEmpty) {
        return 'Unknown';
      }

      return code.toUpperCase();
    }

    if (mediaSource != null) {
      final sizeBytes = (mediaSource['Size'] as num?)?.toInt() ?? 0;

      if (sizeBytes > 0) {
        final mb = sizeBytes / (1024 * 1024);

        if (mb > 999) {
          formattedSize = '${(mb / 1024).toStringAsFixed(2)} GB';
        } else {
          formattedSize = '${mb.toStringAsFixed(0)} MB';
        }
      } else {
        formattedSize = 'Unknown Size';
      }

      final path = mediaSource['Path'] as String? ?? '';

      fileName = path.split('/').last.split('\\').last;

      container =
          mediaSource['Container']?.toString().toUpperCase() ?? 'Unknown';

      final rawStreams =
          (mediaSource['MediaStreams'] as List?)
              ?.whereType<Map>()
              .map((stream) => stream.cast<String, dynamic>())
              .toList() ??
          <Map<String, dynamic>>[];

      final videoStreams = rawStreams
          .where((stream) => stream['Type'] == 'Video')
          .toList();

      audioStreams = rawStreams
          .where((stream) => stream['Type'] == 'Audio')
          .toList();

      subtitleStreams = rawStreams
          .where((stream) => stream['Type'] == 'Subtitle')
          .toList();

      if (videoStreams.isNotEmpty) {
        final video = videoStreams.first;

        final codec =
            video['Codec']?.toString().toUpperCase() ?? 'Unknown Codec';

        final profile = video['Profile']?.toString();

        final width = video['Width']?.toString();

        final height = video['Height']?.toString();

        final frameRate = video['RealFrameRate'] ?? video['AverageFrameRate'];

        final bitDepth = (video['BitDepth'] as num?)?.toInt();

        final videoRange = video['VideoRange']?.toString();

        final videoRangeType = video['VideoRangeType']?.toString();

        var codecLabel = codec;

        if (profile != null && profile.isNotEmpty) {
          codecLabel += ' ($profile)';
        }

        videoDetails.add(codecLabel);

        if (width != null && height != null) {
          videoDetails.add('$width × $height');
        }

        if (frameRate != null) {
          final parsed = double.tryParse(frameRate.toString());

          if (parsed != null) {
            videoDetails.add('${parsed.toStringAsFixed(3)} fps');
          }
        }

        if (bitDepth != null) {
          videoDetails.add('$bitDepth-bit');
        }

        if (videoRange != null && videoRange.isNotEmpty) {
          var rangeLabel = videoRange;

          if (videoRangeType != null && videoRangeType.isNotEmpty) {
            rangeLabel += ' ($videoRangeType)';
          }

          videoDetails.add(rangeLabel);
        }
      }

      final manager = GetIt.instance<PlaybackManager>();

      final currentQueueItem = manager.queueService.currentItem;

      final isPlayingThisItem =
          currentQueueItem is AggregatedItem && currentQueueItem.id == item.id;

      activeAudioIndex = highlightedAudioIndex(
        audioStreams: audioStreams,
        seriesId: item.seriesId,
        selectedIndex: _vm.selectedAudioIndex,
        activePlaybackIndex: isPlayingThisItem
            ? manager.audioStreamIndex
            : null,
      );

      activeSubtitleIndex = highlightedSubtitleIndex(
        subtitleStreams: subtitleStreams,
        audioStreams: audioStreams,
        seriesId: item.seriesId,
        selectedIndex: _vm.selectedSubtitleIndex,
        activePlaybackIndex: isPlayingThisItem
            ? manager.subtitleStreamIndex
            : null,
        activeAudioIndex: activeAudioIndex,
      );
    }

    final baseBackground = theme.scaffoldBackgroundColor.withValues(alpha: 1.0);

    final sectionBackground = Color.alphaBlend(
      foreground.withValues(alpha: 0.055),
      baseBackground,
    ).withValues(alpha: 1.0);

    return ColoredBox(
      color: sectionBackground,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            widget.contentInsets.left,
            ImmersiveSpacing.detailsVerticalPadding,
            widget.contentInsets.right,
            ImmersiveSpacing.detailsVerticalPadding,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final useColumns = constraints.maxWidth >= 900;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, l10n.details),

                  if (hasStudios) ...[
                    const SizedBox(height: 26),

                    KeyedSubtree(
                      key: _studiosRevealKey,
                      child: _buildStudiosGroup(
                        context,
                        studios,
                        hasSeerrChips: hasSeerrChips,
                        hasReadingContent: hasReadingContent,
                      ),
                    ),
                  ],

                  if (hasSeerrChips) ...[
                    SizedBox(
                      height: hasStudios
                          ? 20
                          : ImmersiveSpacing.detailsTitleToContent,
                    ),

                    KeyedSubtree(
                      key: _seerrRevealKey,
                      child: SeerrItemChips(
                        state: seerrState,
                        firstFocusNode: _seerrChipsFocusNode,
                        onNavigateUp: () {
                          if (hasStudios &&
                              _focusRememberedStudio(
                                studios,
                                scrollIfNeeded: true,
                              )) {
                            return;
                          }

                          widget.onNavigateUp?.call();
                        },
                        onNavigateDown: hasReadingContent
                            ? () {
                                if (!_focusReading()) {
                                  return;
                                }

                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  if (!mounted) {
                                    return;
                                  }

                                  _scrollReadingByViewport(
                                    direction: AxisDirection.down,
                                  );
                                });
                              }
                            : () {
                                widget.onNavigateDown?.call();
                              },
                      ),
                    ),
                  ],

                  if (hasReadingContent) ...[
                    Focus(
                      focusNode: _readingFocusNode,
                      onKeyEvent: (_, event) {
                        if (event is! KeyDownEvent &&
                            event is! KeyRepeatEvent) {
                          return KeyEventResult.ignored;
                        }

                        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                          if (_scrollReadingByViewport(
                            direction: AxisDirection.down,
                          )) {
                            return KeyEventResult.handled;
                          }

                          final moved = widget.onNavigateDown?.call() ?? false;

                          return moved
                              ? KeyEventResult.handled
                              : KeyEventResult.ignored;
                        }

                        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                          if (_scrollReadingByViewport(
                            direction: AxisDirection.up,
                          )) {
                            return KeyEventResult.handled;
                          }

                          if (hasSeerrChips && _focusSeerrChips()) {
                            return KeyEventResult.handled;
                          }

                          if (hasStudios &&
                              _focusRememberedStudio(
                                studios,
                                scrollIfNeeded: true,
                              )) {
                            return KeyEventResult.handled;
                          }

                          final moved = widget.onNavigateUp?.call() ?? false;

                          return moved
                              ? KeyEventResult.handled
                              : KeyEventResult.ignored;
                        }

                        return KeyEventResult.ignored;
                      },
                      child: const SizedBox(width: 1, height: 1),
                    ),

                    KeyedSubtree(
                      key: _readingContentKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (hasSeerrStats) ...[
                            SizedBox(
                              height: hasSeerrChips || hasStudios
                                  ? 26
                                  : ImmersiveSpacing.detailsTitleToContent,
                            ),

                            SeerrStatsCard(state: seerrState),
                          ],

                          if (hasTechnicalDetails) ...[
                            SizedBox(
                              height:
                                  hasSeerrStats || hasSeerrChips || hasStudios
                                  ? 46
                                  : ImmersiveSpacing.detailsTitleToContent,
                            ),

                            if (useColumns)
                              _buildDesktopContent(
                                context,
                                fileName: fileName,
                                formattedSize: formattedSize,
                                container: container,
                                videoDetails: videoDetails,
                                audioStreams: audioStreams,
                                subtitleStreams: subtitleStreams,
                                activeAudioIndex: activeAudioIndex,
                                activeSubtitleIndex: activeSubtitleIndex,
                                formatLanguage: formatLanguage,
                              )
                            else
                              _buildCompactContent(
                                context,
                                fileName: fileName,
                                formattedSize: formattedSize,
                                container: container,
                                videoDetails: videoDetails,
                                audioStreams: audioStreams,
                                subtitleStreams: subtitleStreams,
                                activeAudioIndex: activeAudioIndex,
                                activeSubtitleIndex: activeSubtitleIndex,
                                formatLanguage: formatLanguage,
                              ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStudiosGroup(
    BuildContext context,
    List<String> studios, {
    required bool hasSeerrChips,
    required bool hasReadingContent,
  }) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGroupTitle(context, l10n.studios),

        const SizedBox(height: 10),

        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var i = 0; i < studios.length; i++)
              _buildStudioBadge(
                context,
                index: i,
                name: studios[i],
                hasSeerrChips: hasSeerrChips,
                hasReadingContent: hasReadingContent,
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildStudioBadge(
    BuildContext context, {
    required int index,
    required String name,
    required bool hasSeerrChips,
    required bool hasReadingContent,
  }) {
    final textTheme = Theme.of(context).textTheme;

    final foreground = AppColorScheme.onSurface;

    final key = _studioKey(index, name);

    void openStudio() {
      context.push(Destinations.studio(name));
    }

    final focusNode = _studioFocusNode(
      index: index,
      name: name,
      hasSeerrChips: hasSeerrChips,
      hasReadingContent: hasReadingContent,
      onActivate: openStudio,
    );

    final focused = _focusedStudioKey == key;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: FocusableActionDetector(
        focusNode: focusNode,
        mouseCursor: SystemMouseCursors.click,
        onShowFocusHighlight: (showFocus) {
          if (showFocus) {
            _lastFocusedStudioKey = key;
          }

          final nextKey = showFocus ? key : null;

          if (_focusedStudioKey != nextKey) {
            setState(() {
              _focusedStudioKey = nextKey;
            });
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: openStudio,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 44),
            child: Align(
              widthFactor: 1,
              heightFactor: 1,
              alignment: Alignment.center,
              child: AnimatedScale(
                scale: focused ? 1.04 : 1,
                duration: const Duration(milliseconds: 130),
                curve: Curves.easeOutCubic,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 130),
                  curve: Curves.easeOutCubic,
                  transform: Matrix4.translationValues(
                    0,
                    focused ? -1.5 : 0,
                    0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: foreground.withValues(
                      alpha: focused ? 0.105 : 0.032,
                    ),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      width: focused ? 1.2 : 1,
                      color: foreground.withValues(
                        alpha: focused ? 0.62 : 0.075,
                      ),
                    ),
                    boxShadow: focused
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.22),
                              blurRadius: 14,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : const [],
                  ),
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      color: foreground.withValues(
                        alpha: focused ? 0.98 : 0.74,
                      ),
                      fontWeight: focused ? FontWeight.w600 : FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopContent(
    BuildContext context, {
    required String fileName,
    required String formattedSize,
    required String container,
    required List<String> videoDetails,
    required List<Map<String, dynamic>> audioStreams,
    required List<Map<String, dynamic>> subtitleStreams,
    required int? activeAudioIndex,
    required int? activeSubtitleIndex,
    required String Function(String? code) formatLanguage,
  }) {
    final l10n = AppLocalizations.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 12,
          child: _buildGroup(
            context,
            title: l10n.fileInformation,
            child: _buildFileContent(
              context,
              fileName: fileName,
              formattedSize: formattedSize,
              container: container,
              includePlaybackCapability: true,
            ),
          ),
        ),

        _columnDivider(),

        Expanded(
          flex: 10,
          child: _buildGroup(
            context,
            title: l10n.video,
            child: _buildVideoContent(context, videoDetails),
          ),
        ),

        _columnDivider(),

        Expanded(
          flex: 11,
          child: _buildGroup(
            context,
            title: l10n.audio,
            child: _buildTrackList(
              context,
              streams: audioStreams,
              activeIndex: activeAudioIndex,
              formatLanguage: formatLanguage,
              includeForced: false,
            ),
          ),
        ),

        _columnDivider(),

        Expanded(
          flex: 11,
          child: _buildGroup(
            context,
            title: l10n.subtitles,
            child: _buildTrackList(
              context,
              streams: subtitleStreams,
              activeIndex: activeSubtitleIndex,
              formatLanguage: formatLanguage,
              includeForced: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompactContent(
    BuildContext context, {
    required String fileName,
    required String formattedSize,
    required String container,
    required List<String> videoDetails,
    required List<Map<String, dynamic>> audioStreams,
    required List<Map<String, dynamic>> subtitleStreams,
    required int? activeAudioIndex,
    required int? activeSubtitleIndex,
    required String Function(String? code) formatLanguage,
  }) {
    final l10n = AppLocalizations.of(context);

    final groups = <Widget>[
      _buildGroup(
        context,
        title: l10n.fileInformation,
        child: _buildFileContent(
          context,
          fileName: fileName,
          formattedSize: formattedSize,
          container: container,
          includePlaybackCapability: true,
        ),
      ),

      if (videoDetails.isNotEmpty)
        _buildGroup(
          context,
          title: l10n.video,
          child: _buildVideoContent(context, videoDetails),
        ),

      if (audioStreams.isNotEmpty)
        _buildGroup(
          context,
          title: l10n.audio,
          child: _buildTrackList(
            context,
            streams: audioStreams,
            activeIndex: activeAudioIndex,
            formatLanguage: formatLanguage,
            includeForced: false,
          ),
        ),

      if (subtitleStreams.isNotEmpty)
        _buildGroup(
          context,
          title: l10n.subtitles,
          child: _buildTrackList(
            context,
            streams: subtitleStreams,
            activeIndex: activeSubtitleIndex,
            formatLanguage: formatLanguage,
            includeForced: true,
          ),
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < groups.length; i++) ...[
          if (i > 0) const SizedBox(height: 26),

          groups[i],
        ],
      ],
    );
  }

  Widget _buildGroup(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGroupTitle(context, title),

        const SizedBox(height: 12),

        child,
      ],
    );
  }

  Widget _buildFileContent(
    BuildContext context, {
    required String fileName,
    required String formattedSize,
    required String container,
    required bool includePlaybackCapability,
  }) {
    final l10n = AppLocalizations.of(context);

    final textTheme = Theme.of(context).textTheme;

    final foreground = AppColorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fileName.isNotEmpty)
          Text(
            fileName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(
              color: foreground.withValues(alpha: 0.9),
              fontWeight: FontWeight.w500,
              height: 1.35,
            ),
          ),

        const SizedBox(height: 7),

        Text(
          l10n.fileSizeFormat(formattedSize, container),
          style: textTheme.bodySmall?.copyWith(
            color: foreground.withValues(alpha: 0.5),
            height: 1.3,
          ),
        ),

        if (includePlaybackCapability) ...[
          const SizedBox(height: 12),

          _buildPlaybackCapability(context),
        ],
      ],
    );
  }

  Widget _buildVideoContent(BuildContext context, List<String> videoDetails) {
    final textTheme = Theme.of(context).textTheme;

    final foreground = AppColorScheme.onSurface;

    if (videoDetails.isEmpty) {
      return _emptyValue(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < videoDetails.length; i++)
          Padding(
            padding: EdgeInsets.only(
              bottom: i < videoDetails.length - 1 ? 5 : 0,
            ),
            child: Text(
              videoDetails[i],
              style: textTheme.bodySmall?.copyWith(
                color: foreground.withValues(alpha: 0.72),
                height: 1.35,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPlaybackCapability(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final textTheme = Theme.of(context).textTheme;

    final foreground = AppColorScheme.onSurface;

    if (_loadingPlaybackInfo) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 10,
            height: 10,
            child: CircularProgressIndicator(strokeWidth: 1.4),
          ),

          const SizedBox(width: 8),

          Flexible(
            child: Text(
              l10n.checkingDirectPlay,
              style: textTheme.labelSmall?.copyWith(
                color: foreground.withValues(alpha: 0.42),
                height: 1.3,
              ),
            ),
          ),
        ],
      );
    }

    if (_playbackInfoFailed) {
      return const SizedBox.shrink();
    }

    final playbackInfo = _playbackInfo;

    if (playbackInfo == null || playbackInfo.mediaSources.isEmpty) {
      return const SizedBox.shrink();
    }

    final source = playbackInfo.mediaSources.firstWhere(
      (source) => source.id == _loadedMediaSourceId,
      orElse: () => playbackInfo.mediaSources.first,
    );

    final canDirectPlay = source.supportsDirectPlay;

    final reasons = source.transcodingReasons;

    final statusColor = canDirectPlay
        ? AppColorScheme.statusAvailable
        : AppColorScheme.statusError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 8),

            Flexible(
              child: Text(
                l10n.directPlay,
                style: textTheme.labelSmall?.copyWith(
                  color: foreground.withValues(
                    alpha: canDirectPlay ? 0.58 : 0.68,
                  ),
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),

        if (!canDirectPlay && reasons.isNotEmpty) ...[
          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              reasons
                  .map((reason) => _formatTranscodeReason(reason, l10n))
                  .join(' · '),
              style: textTheme.labelSmall?.copyWith(
                color: foreground.withValues(alpha: 0.4),
                height: 1.35,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTrackList(
    BuildContext context, {
    required List<Map<String, dynamic>> streams,
    required int? activeIndex,
    required String Function(String? code) formatLanguage,
    required bool includeForced,
  }) {
    if (streams.isEmpty) {
      return _emptyValue(context);
    }

    final l10n = AppLocalizations.of(context);

    final textTheme = Theme.of(context).textTheme;

    final foreground = AppColorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < streams.length; i++)
          Builder(
            builder: (context) {
              final stream = streams[i];

              final title =
                  stream['DisplayTitle']?.toString() ??
                  stream['Codec']?.toString().toUpperCase() ??
                  'Unknown';

              final language = formatLanguage(stream['Language']?.toString());

              final isDefault = stream['IsDefault'] == true;

              final isForced = includeForced && stream['IsForced'] == true;

              final isSelected = stream['Index'] == activeIndex;

              final attributes = [
                if (isDefault) l10n.defaultLabel,
                if (isForced) l10n.forced,
              ];

              return Padding(
                padding: EdgeInsets.only(
                  bottom: i < streams.length - 1 ? 7 : 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      margin: const EdgeInsets.only(top: 6, right: 9),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColorScheme.accent
                            : foreground.withValues(alpha: 0.22),
                        shape: BoxShape.circle,
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$title ($language)',
                            style: textTheme.bodySmall?.copyWith(
                              color: foreground.withValues(
                                alpha: isSelected ? 0.94 : 0.66,
                              ),
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              height: 1.3,
                            ),
                          ),

                          if (attributes.isNotEmpty) ...[
                            const SizedBox(height: 2),

                            Text(
                              attributes.join(' · '),
                              style: textTheme.labelSmall?.copyWith(
                                color: foreground.withValues(alpha: 0.4),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final foreground = AppColorScheme.onSurface;

    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: foreground.withValues(alpha: 0.92),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildGroupTitle(BuildContext context, String title) {
    final foreground = AppColorScheme.onSurface;

    return Text(
      title,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: foreground.withValues(alpha: 0.46),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
      ),
    );
  }

  Widget _emptyValue(BuildContext context) {
    return Text(
      '—',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: AppColorScheme.onSurface.withValues(alpha: 0.28),
      ),
    );
  }

  Widget _columnDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: SizedBox(
        height: 132,
        child: VerticalDivider(
          width: 1,
          thickness: 1,
          color: AppColorScheme.onSurface.withValues(alpha: 0.08),
        ),
      ),
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
      'VideoResolutionNotSupported' =>
        l10n.transcodeVideoResolutionNotSupported,
      'VideoBitDepthNotSupported' => l10n.transcodeVideoBitDepthNotSupported,
      'VideoFramerateNotSupported' => l10n.transcodeVideoFramerateNotSupported,
      'ContainerBitrateExceedsLimit' =>
        l10n.transcodeContainerBitrateExceedsLimit,
      'VideoBitrateExceedsLimit' => l10n.transcodeVideoBitrateExceedsLimit,
      'AudioBitrateExceedsLimit' => l10n.transcodeAudioBitrateExceedsLimit,
      'AudioChannelsNotSupported' => l10n.transcodeAudioChannelsNotSupported,
      _ => reason,
    };
  }
}
