import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/services/seerr/seerr_error.dart';
import '../../../data/viewmodels/seerr_collection_view_model.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/library_row.dart';
import '../../widgets/media_card.dart';
import '../../widgets/navigation_layout.dart';
import '../../widgets/seerr/seerr_advanced_request_options.dart';
import '../../widgets/seerr/seerr_quota_row.dart';
import '../../widgets/seerr/seerr_tv_controls.dart';
import '../../widgets/track_selector_dialog.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/focus/request_initial_focus.dart';

const _tmdbPosterBase = 'https://image.tmdb.org/t/p/w342';
const _tmdbBackdropBase = 'https://image.tmdb.org/t/p/w1280';

class SeerrCollectionScreen extends StatefulWidget {
  final String collectionId;

  const SeerrCollectionScreen({super.key, required this.collectionId});

  @override
  State<SeerrCollectionScreen> createState() => _SeerrCollectionScreenState();
}

class _SeerrCollectionScreenState extends State<SeerrCollectionScreen> {
  SeerrCollectionViewModel? _vm;
  bool _initializing = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final repo = await GetIt.instance.getAsync<SeerrRepository>();
    final id = int.tryParse(widget.collectionId);
    if (id == null || !mounted) {
      setState(() => _initializing = false);
      return;
    }

    final vm = SeerrCollectionViewModel(repo, id);
    vm.addListener(_onChanged);

    setState(() {
      _vm = vm;
      _initializing = false;
    });

    vm.load();
  }

  @override
  void dispose() {
    _vm?.removeListener(_onChanged);
    _vm?.dispose();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) =>
      RequestInitialFocus(child: _buildContent(context));

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.background,
      body: NavigationLayout(
        showBackButton: true,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final l10n = AppLocalizations.of(context);
    final vm = _vm;
    if (_initializing || vm == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final s = vm.state;
    if (s.isLoading && s.collection == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (s.error != null && s.collection == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              s.error!,
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: vm.load, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    final collection = s.collection;
    if (collection == null) {
      return Center(
        child: Text(
          l10n.noResults,
          style: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.54),
          ),
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        if (collection.backdropPath != null)
          Opacity(
            opacity: 0.25,
            child: CachedNetworkImage(
              imageUrl: '$_tmdbBackdropBase${collection.backdropPath}',
              fit: BoxFit.cover,
            ),
          ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColorScheme.background.withValues(alpha: 0.35),
                AppColorScheme.background,
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 56,
            bottom: 48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(vm, collection, l10n),
              const SizedBox(height: 12),
              _buildPartsRow(vm, l10n),
            ],
          ),
        ),
      ],
    );
  }

  double get _leftInset => PlatformDetection.useMobileUi ? 16.0 : 48.0;

  Widget _buildHeader(
    SeerrCollectionViewModel vm,
    SeerrCollection collection,
    AppLocalizations l10n,
  ) {
    final s = vm.state;
    final requestable = s.requestableParts(is4k: false).isNotEmpty ||
        (vm.canRequest4kMovies && s.requestableParts(is4k: true).isNotEmpty);
    final showRequest = vm.canRequestMovies && requestable;
    final total = s.visibleParts.length;

    return Padding(
      padding: EdgeInsets.fromLTRB(_leftInset, 0, 24, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (collection.posterPath != null) ...[
            ClipRRect(
              borderRadius: AppRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: '$_tmdbPosterBase${collection.posterPath}',
                width: 120,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collection.name ?? '',
                  style: TextStyle(
                    color: AppColorScheme.onSurface,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.collectionMoviesSummary(total, s.availableCount),
                  style: TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                    fontSize: 13,
                  ),
                ),
                if (collection.overview != null &&
                    collection.overview!.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    collection.overview!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.8),
                      fontSize: 13.5,
                      height: 1.4,
                    ),
                  ),
                ],
                const SizedBox(height: 14),
                if (showRequest)
                  ElevatedButton.icon(
                    onPressed: s.isRequesting
                        ? null
                        : () => _showRequestSheet(vm),
                    icon: const Icon(Icons.add, size: 18),
                    label: Text(l10n.requestCollection),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorScheme.accent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                    ),
                  )
                else if (vm.canRequestMovies)
                  Text(
                    l10n.collectionAllRequested,
                    style: TextStyle(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.54),
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartsRow(SeerrCollectionViewModel vm, AppLocalizations l10n) {
    final parts = vm.state.visibleParts;
    if (parts.isEmpty) return const SizedBox.shrink();

    final suppressFocusGlow = ThemeRegistry.active.borders.focusGlow.isNotEmpty;
    final focusColor = Color(
      GetIt.instance<UserPreferences>()
          .get(UserPreferences.focusColor)
          .colorValue,
    );
    final cardExpansion = GetIt.instance<UserPreferences>().get(
      UserPreferences.cardFocusExpansion,
    );

    return LibraryRow(
      title: l10n.movies,
      children: parts
          .map(
            (item) => MediaCard(
              title: item.displayTitle,
              subtitle: _yearOf(item),
              imageUrl: item.posterPath != null
                  ? '$_tmdbPosterBase${item.posterPath}'
                  : null,
              width: 130,
              aspectRatio: 2 / 3,
              seerrMediaType: item.mediaType ?? 'movie',
              seerrStatus: item.mediaInfo?.status,
              focusColor: focusColor,
              cardFocusExpansion: cardExpansion,
              suppressFocusGlow: suppressFocusGlow,
              onTap: () => context.push(
                Destinations.seerrMedia(item.id.toString()),
                extra: {'mediaType': item.mediaType ?? 'movie'},
              ),
            ),
          )
          .toList(),
    );
  }

  static String? _yearOf(SeerrDiscoverItem item) {
    final date = item.releaseDate ?? item.firstAirDate;
    if (date == null || date.length < 4) return null;
    return date.substring(0, 4);
  }

  void _showRequestSheet(SeerrCollectionViewModel vm) {
    final l10n = AppLocalizations.of(context);
    showStyledPlayerDialog<void>(
      context,
      title: l10n.requestCollection,
      builder: (_) => _CollectionRequestSheet(
        vm: vm,
        onResult: _showResult,
      ),
    );
  }

  void _showResult(SeerrCollectionRequestResult result) {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);

    String message;
    if (result.allSucceeded) {
      message = l10n.requestedMoviesCount(result.requested);
    } else {
      message = l10n.requestedMoviesPartial(result.requested, result.total);
      final reason = switch (result.firstErrorKind) {
        SeerrRequestErrorKind.quotaExceeded => l10n.requestErrorQuota,
        SeerrRequestErrorKind.blocklisted => l10n.requestErrorBlocklisted,
        SeerrRequestErrorKind.permission => l10n.requestErrorPermission,
        _ => null,
      };
      if (reason != null) message = '$message ($reason)';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor:
            result.allSucceeded ? Colors.green[700] : Colors.orange[800],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _CollectionRequestSheet extends StatefulWidget {
  final SeerrCollectionViewModel vm;
  final void Function(SeerrCollectionRequestResult result) onResult;

  const _CollectionRequestSheet({required this.vm, required this.onResult});

  @override
  State<_CollectionRequestSheet> createState() =>
      _CollectionRequestSheetState();
}

class _CollectionRequestSheetState extends State<_CollectionRequestSheet> {
  bool _is4k = false;
  bool _submitting = false;
  final Set<int> _selected = {};
  late final SeerrAdvancedRequestController _advanced;
  final _seerrPrefs = GetIt.instance<SeerrPreferences>();

  @override
  void initState() {
    super.initState();
    _advanced = SeerrAdvancedRequestController(isTv: false, is4k: _is4k);
    _applySavedPreferences(resetSelection: false);
    if (widget.vm.canRequestAdvanced) {
      _advanced.load();
    }
    widget.vm.addListener(_onVmChanged);
    _selectAll();
  }

  @override
  void dispose() {
    widget.vm.removeListener(_onVmChanged);
    _advanced.dispose();
    super.dispose();
  }

  void _onVmChanged() {
    if (mounted) setState(() {});
  }

  void _applySavedPreferences({bool resetSelection = true}) {
    _advanced.applySavedPreferences(
      serverId: _is4k
          ? _seerrPrefs.fourKMovieServerId
          : _seerrPrefs.hdMovieServerId,
      profileId: _is4k
          ? _seerrPrefs.fourKMovieProfileId
          : _seerrPrefs.hdMovieProfileId,
      rootFolderId: _is4k
          ? _seerrPrefs.fourKMovieRootFolderId
          : _seerrPrefs.hdMovieRootFolderId,
      resetSelection: resetSelection,
      is4k: _is4k,
    );
  }

  List<SeerrDiscoverItem> get _requestable =>
      widget.vm.state.requestableParts(is4k: _is4k);

  SeerrQuotaDetail? get _movieQuota => widget.vm.state.quota?.movie;

  int get _selectionCap {
    final quota = _movieQuota;
    if (quota == null || quota.isUnlimited) return _requestable.length;
    final remaining = quota.remaining;
    if (remaining == null) return _requestable.length;
    return remaining.clamp(0, _requestable.length);
  }

  void _selectAll() {
    _selected
      ..clear()
      ..addAll(_requestable.take(_selectionCap).map((p) => p.id));
  }

  bool get _allSelected =>
      _selected.length >= _selectionCap && _selectionCap > 0;

  Future<void> _submit() async {
    if (_submitting || _selected.isEmpty) return;
    setState(() => _submitting = true);

    final result = await widget.vm.requestParts(
      _selected.toList(),
      is4k: _is4k,
      profileId: _advanced.effectiveProfileId,
      rootFolder: _advanced.effectiveRootFolderPath,
      serverId: _advanced.effectiveServerId,
    );

    if (!mounted) return;
    Navigator.of(context).pop();
    widget.onResult(result);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final vm = widget.vm;
    final s = vm.state;
    final parts = s.visibleParts;
    final requestableIds = _requestable.map((p) => p.id).toSet();
    final quota = _movieQuota;
    final overCap =
        quota != null && !quota.isUnlimited && _selected.length > _selectionCap;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SeerrToggleRow(
            title: '${l10n.selectAll} (${_requestable.length})',
            value: _allSelected,
            checkbox: true,
            autofocus: true,
            onChanged: (v) => setState(() {
              if (v) {
                _selectAll();
              } else {
                _selected.clear();
              }
            }),
          ),
          const Divider(color: Colors.white12, height: 1),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 280),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (final part in parts)
                    _buildPartTile(part, requestableIds, l10n),
                ],
              ),
            ),
          ),
          if (vm.canRequest4kMovies)
            SeerrToggleRow(
              title: l10n.uhd4k,
              value: _is4k,
              onChanged: _submitting
                  ? null
                  : (v) => setState(() {
                      _is4k = v;
                      _applySavedPreferences();
                      _selectAll();
                    }),
            ),
          if (vm.canRequestAdvanced) ...[
            const Divider(color: Colors.white12),
            SeerrAdvancedRequestOptions(controller: _advanced),
          ],
          if (quota != null && !quota.isUnlimited) ...[
            const SizedBox(height: 12),
            SeerrQuotaRow(
              label: l10n.movieQuotaRemaining(
                quota.remaining ?? 0,
                quota.limit ?? 0,
              ),
              blocked: overCap,
            ),
          ],
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SeerrDialogButton(
                  label: l10n.cancel,
                  onPressed: _submitting
                      ? null
                      : () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SeerrDialogButton(
                  label: l10n.requestMoviesCount(_selected.length),
                  primary: true,
                  primaryColor: const Color(0xFF6366F1),
                  busy: _submitting && s.isRequesting,
                  busyLabel: l10n.requestingProgress(
                    s.requestProgressCurrent,
                    s.requestProgressTotal,
                  ),
                  onPressed: _submitting || _selected.isEmpty || overCap
                      ? null
                      : _submit,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPartTile(
    SeerrDiscoverItem part,
    Set<int> requestableIds,
    AppLocalizations l10n,
  ) {
    final requestable = requestableIds.contains(part.id);
    final selected = _selected.contains(part.id);
    final year = _SeerrCollectionScreenState._yearOf(part);
    final info = part.mediaInfo;
    final status = (_is4k ? info?.status4k : info?.status) ?? 1;

    String? statusLabel;
    if (!requestable) {
      statusLabel = switch (status) {
        4 || 5 => l10n.seerrAvailableStatus,
        2 || 3 => l10n.seerrRequestedStatus,
        _ => null,
      };
    }

    return SeerrToggleRow(
      title: year != null
          ? '${part.displayTitle} ($year)'
          : part.displayTitle,
      value: requestable ? selected : false,
      checkbox: true,
      trailing: statusLabel != null
          ? Text(
              statusLabel,
              style: TextStyle(
                color: status >= 4 ? Colors.green[300] : Colors.blue[200],
                fontSize: 11.5,
              ),
            )
          : null,
      onChanged: requestable && !_submitting
          ? (v) => setState(() {
              if (v) {
                if (_selected.length < _selectionCap) {
                  _selected.add(part.id);
                }
              } else {
                _selected.remove(part.id);
              }
            })
          : null,
    );
  }
}
