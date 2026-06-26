import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart' hide ImageType;

import '../../../data/models/aggregated_library.dart';
import '../../../data/repositories/user_views_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../navigation/home_refresh_bus.dart';
import '../../widgets/adaptive/adaptive_list_section.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';
import '../../../util/platform_detection.dart';

class LibraryVisibilityScreen extends StatefulWidget {
  const LibraryVisibilityScreen({super.key});

  @override
  State<LibraryVisibilityScreen> createState() =>
      _LibraryVisibilityScreenState();
}

class _LibraryVisibilityScreenState extends State<LibraryVisibilityScreen> {
  final _viewsRepo = GetIt.instance<UserViewsRepository>();

  List<AggregatedLibrary>? _libraries;
  UserConfiguration? _config;
  bool _isLoading = true;
  Future<void> _saveQueue = Future.value();
  int _lastQueuedOpId = 0;

  FocusNode? _firstLibraryFocusNode;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _firstLibraryFocusNode?.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final results = await Future.wait([
        _viewsRepo.getAllViewsIncludingHidden(),
        _viewsRepo.getUserConfiguration(),
      ]);
      if (!mounted) return;
      setState(() {
        _libraries = results[0] as List<AggregatedLibrary>;
        _config = results[1] as UserConfiguration;
        _isLoading = false;

        _firstLibraryFocusNode?.dispose();
        if (_libraries != null && _libraries!.isNotEmpty) {
          _firstLibraryFocusNode = FocusNode(debugLabel: 'first_library_tile');
        }
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleExclude(
    String libraryId,
    bool hidden, {
    required bool isLatest,
  }) {
    final config = _config;
    if (config == null) return Future.value();

    final source = isLatest
        ? config.latestItemsExcludes
        : config.myMediaExcludes;
    final excludes = List<String>.from(source);
    if (hidden) {
      if (!excludes.contains(libraryId)) excludes.add(libraryId);
    } else {
      excludes.remove(libraryId);
    }

    final updated = isLatest
        ? config.copyWith(latestItemsExcludes: excludes)
        : config.copyWith(myMediaExcludes: excludes);
    final opId = ++_lastQueuedOpId;
    setState(() => _config = updated);

    // Queue writes to preserve toggle order and prevent stale responses
    // from undoing a later user action.
    _saveQueue = _saveQueue.then((_) async {
      try {
        await _viewsRepo.updateUserConfiguration(updated);
        requestHomeRefreshAfterNavigation();
      } catch (_) {
        if (!mounted || opId != _lastQueuedOpId) return;
        setState(() => _config = config);
      }
    });
    return _saveQueue;
  }

  @override
  Widget build(BuildContext context) => RequestInitialFocus(
    targetNode: PlatformDetection.isTV ? _firstLibraryFocusNode : null,
    child: _buildContent(context),
  );

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.libraryVisibility)),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(l10n.libraryVisibilityDescription),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_libraries != null && _config != null)
              ..._buildLibraryVisibilityTiles(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLibraryVisibilityTiles() {
    final l10n = AppLocalizations.of(context);
    final config = _config!;
    final libraries = _libraries!;
    final firstLibId = libraries.isNotEmpty ? libraries.first.id : null;

    return [
      for (final lib in libraries) ...[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Text(lib.name, style: Theme.of(context).textTheme.titleMedium),
        ),
        adaptiveListSection(
          children: [
            TvFocusHighlight(
              builder: (_, focused) => SwitchListTile.adaptive(
                focusNode: lib.id == firstLibId ? _firstLibraryFocusNode : null,
                secondary: Icon(
                  Icons.visibility,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.54)
                      : null,
                ),
                title: Text(
                  l10n.showInNavigation,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: focused
                        ? AppColors.black.withValues(alpha: 0.87)
                        : AppColorScheme.onSurface,
                  ),
                ),
                value: !config.myMediaExcludes.contains(lib.id),
                onChanged: (v) => _toggleExclude(lib.id, !v, isLatest: false),
              ),
            ),
            // Playlists and boxsets use a different API path for their row content
            // (getItems with type filtering rather than getLatestItems on a parent).
            // Until a dedicated Latest row type exists for these, hide the toggle
            // to avoid surfacing a setting that has no effect.
            if (!_noLatestMediaSupport.contains(
              lib.collectionType.toLowerCase(),
            ))
              TvFocusHighlight(
                builder: (_, focused) => SwitchListTile.adaptive(
                  secondary: Icon(
                    Icons.new_releases,
                    color: focused
                        ? AppColors.black.withValues(alpha: 0.54)
                        : null,
                  ),
                  title: Text(
                    l10n.showInLatestMedia,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: focused
                          ? AppColors.black.withValues(alpha: 0.87)
                          : AppColorScheme.onSurface,
                    ),
                  ),
                  value: !config.latestItemsExcludes.contains(lib.id),
                  onChanged: (v) => _toggleExclude(lib.id, !v, isLatest: true),
                ),
              ),
          ],
        ),
      ],
    ];
  }

  /// Collection types whose 'Show in Latest Media' toggle is not yet functional.
  /// getLatestItems on these parents returns container contents (movies, episodes)
  /// rather than the container items themselves, which causes duplicate rows.
  static const _noLatestMediaSupport = {'playlists', 'boxsets'};
}
