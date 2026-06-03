import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/home_screen_sections_service.dart';
import '../../../data/services/kefin_tweaks_service.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/home_section_config.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/poster_size_settings_dialog.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../../l10n/app_localizations.dart';
import 'settings_app_bar.dart';

const double _kHomeSectionTileRadius = 16;
const EdgeInsets _kHomeSectionTileContentPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 8,
);
const EdgeInsets _kHomeSectionTileOuterPadding = EdgeInsets.fromLTRB(12, 4, 12, 4);

BoxDecoration _homeSectionTileDecoration(
  BuildContext context, {
  required bool focused,
}) {
  final colorScheme = Theme.of(context).colorScheme;
  final borderTokens = ThemeRegistry.active.borders;
  final baseBorder = borderTokens.cardBorder.color;
  final unfocusedBorderColor = baseBorder.a == 0
      ? AppColorScheme.onSurface.withValues(alpha: 0.16)
      : baseBorder.withValues(alpha: 0.55);

  return BoxDecoration(
    color: focused
        ? AppColorScheme.onSurface
        : colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
    borderRadius: BorderRadius.circular(_kHomeSectionTileRadius),
    border: Border.fromBorderSide(
      (focused ? borderTokens.focusBorder : borderTokens.cardBorder).copyWith(
        color: focused
            ? AppColorScheme.accent.withValues(alpha: 0.72)
            : unfocusedBorderColor,
        width: 1.0,
      ),
    ),
    boxShadow: focused
        ? (borderTokens.focusGlow.isNotEmpty
              ? borderTokens.focusGlow
              : [
                  BoxShadow(
                    color: AppColorScheme.accent.withValues(alpha: 0.22),
                    blurRadius: 14,
                    spreadRadius: 0.5,
                  ),
                ])
        : null,
  );
}

class HomeSectionsScreen extends StatefulWidget {
  final bool showGeneralOptions;

  const HomeSectionsScreen({
    super.key,
    this.showGeneralOptions = true,
  });

  @override
  State<HomeSectionsScreen> createState() => _HomeSectionsScreenState();
}

class _HomeSectionsScreenState extends State<HomeSectionsScreen> {
  final _prefs = GetIt.instance<UserPreferences>();
  static const _rowsTypeDescription =
      'Classic keeps per-row image type and info overlay. Modern uses portrait-to-backdrop rows.';
  late List<HomeSectionConfig> _sections;
  HomeSectionConfig? _mediaBarConfig;
  final _focusNodes = <FocusNode>[];

  bool _isFavoriteSectionType(HomeSectionType type) {
    return switch (type) {
      HomeSectionType.favoriteMovies ||
      HomeSectionType.favoriteSeries ||
      HomeSectionType.favoriteEpisodes ||
      HomeSectionType.favoritePeople ||
      HomeSectionType.favoriteArtists ||
      HomeSectionType.favoriteMusicVideos ||
      HomeSectionType.favoriteAlbums ||
      HomeSectionType.favoriteSongs => true,
      _ => false,
    };
  }

  bool _isCollectionsSectionType(HomeSectionType type) {
    return type == HomeSectionType.collections;
  }

  bool _isGenresSectionType(HomeSectionType type) {
    return type == HomeSectionType.genres;
  }

  bool _isHiddenByRowVisibilityGates(HomeSectionConfig section) {
    final showFavoritesRows = _prefs.get(UserPreferences.displayFavoritesRows);
    final showCollectionsRows =
        _prefs.get(UserPreferences.displayCollectionsRows);
    final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);

    final hiddenByFavorites =
      !showFavoritesRows && _isFavoriteSectionType(section.type);
    final hiddenByCollections = !showCollectionsRows &&
      ((section.isBuiltin && _isCollectionsSectionType(section.type)) ||
        (section.isPluginDynamic &&
          section.pluginSource == HomeSectionPluginSource.collections));
    final hiddenByGenres = !showGenresRows &&
      ((section.isBuiltin && _isGenresSectionType(section.type)) ||
        (section.isPluginDynamic &&
          section.pluginSource == HomeSectionPluginSource.genres));
    return hiddenByFavorites || hiddenByCollections || hiddenByGenres;
  }

  List<int> _visibleSectionIndices() {
    final visible = <int>[];
    for (var i = 0; i < _sections.length; i++) {
      if (_isHiddenByRowVisibilityGates(_sections[i])) continue;
      visible.add(i);
    }
    return visible;
  }

  @override
  void initState() {
    super.initState();
    final all = _prefs.homeSectionsConfig;
    _mediaBarConfig = all.where((s) => s.type == HomeSectionType.mediaBar).firstOrNull;
    _sections = all.where((s) => s.type != HomeSectionType.mediaBar).toList();
    final addedBuiltins = _ensureBuiltinSectionsPresent();
    _mergeDiscoveredPluginSections();
    _rebuildFocusNodes();
    if (addedBuiltins) {
      _persistSections(pushSync: false);
    }
    _refreshPluginSections();
  }

  bool _ensureBuiltinSectionsPresent() {
    final existingTypes = _sections
        .where((s) => s.isBuiltin)
        .map((s) => s.type)
        .toSet();
    var insertIndex = _sections.indexWhere((s) => s.isPluginDynamic);
    if (insertIndex < 0) {
      insertIndex = _sections.length;
    }
    var nextOrder = _sections.length;
    var changed = false;

    for (final type in HomeSectionType.values) {
      if (type == HomeSectionType.none || type == HomeSectionType.mediaBar) {
        continue;
      }
      if (existingTypes.contains(type)) continue;
      _sections.insert(
        insertIndex,
        HomeSectionConfig(
          type: type,
          enabled: false,
          order: nextOrder++,
        ),
      );
      insertIndex++;
      changed = true;
    }

    return changed;
  }

  /// Probes for newly discovered plugin sections in the background and
  /// re-merges the result into the visible list.
  Future<void> _refreshPluginSections() async {
    final futures = <Future<void>>[];
    if (GetIt.instance.isRegistered<HomeScreenSectionsService>()) {
      futures.add(GetIt.instance<HomeScreenSectionsService>().refreshAll());
    }
    if (GetIt.instance.isRegistered<KefinTweaksService>()) {
      futures.add(GetIt.instance<KefinTweaksService>().refreshAll());
    }
    if (futures.isNotEmpty) {
      await Future.wait(futures);
    }
    final collectionsFuture = _fetchCollectionsForHomeSections();
    final genresFuture = _fetchGenresForHomeSections();
    final discoveredCollections = await collectionsFuture;
    final discoveredGenres = await genresFuture;
    if (!mounted) return;
    var changed = false;
    setState(() {
      final mergedPluginSections = _mergeDiscoveredPluginSections();
      final mergedCollectionSections = _mergeCollectionSections(discoveredCollections);
      final mergedGenreSections = _mergeGenreSections(discoveredGenres);
      changed =
          mergedPluginSections ||
          mergedCollectionSections ||
          mergedGenreSections;
      _rebuildFocusNodes();
    });
    if (changed) {
      _persistSections(pushSync: false);
    }
  }

  /// Adds plugin-dynamic sections discovered by the Home Screen Sections
  /// plugin and KefinTweaks into the in-memory list (disabled by default)
  /// and prunes stale entries whose section is no longer reported.
  bool _mergeDiscoveredPluginSections() {
    final hssChanged = _mergeHssSections();
    final kefinChanged = _mergeKefinSections();
    return hssChanged || kefinChanged;
  }

  Future<List<_DiscoveredCollectionRow>> _fetchCollectionsForHomeSections() async {
    final showCollectionsRows = _prefs.get(UserPreferences.displayCollectionsRows);
    if (!showCollectionsRows) return const <_DiscoveredCollectionRow>[];

    try {
      final client = GetIt.instance<MediaServerClient>();
      const pageSize = 250;
      var startIndex = 0;
      int? total;
      final all = <_DiscoveredCollectionRow>[];

      while (true) {
        final response = await client.itemsApi.getItems(
          includeItemTypes: const ['BoxSet'],
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          recursive: true,
          startIndex: startIndex,
          limit: pageSize,
        );

        total ??= response['TotalRecordCount'] as int?;
        final items = (response['Items'] as List?) ?? const [];
        if (items.isEmpty) break;

        all.addAll(
          items
              .whereType<Map<String, dynamic>>()
              .where((item) =>
                  (item['Id']?.toString() ?? '').isNotEmpty &&
                  (item['Name']?.toString() ?? '').isNotEmpty)
              .map(
                (item) => _DiscoveredCollectionRow(
                  id: item['Id'].toString(),
                  name: item['Name'].toString(),
                ),
              ),
        );

        startIndex += items.length;
        if (items.length < pageSize) break;
        if (total != null && startIndex >= total) break;
      }

      return all;
    } catch (_) {
      return const <_DiscoveredCollectionRow>[];
    }
  }

  bool _mergeCollectionSections(List<_DiscoveredCollectionRow> discovered) {
    final client = GetIt.instance<MediaServerClient>();
    final serverId = client.baseUrl;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.collections &&
          c.serverId == serverId))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final collection in discovered) {
      final cfg = HomeSectionConfig.pluginDynamic(
        serverId: serverId,
        pluginSection: 'collection',
        pluginAdditionalData: collection.id,
        pluginDisplayText: collection.name,
        pluginSource: HomeSectionPluginSource.collections,
        enabled: existing[
                'pluginDynamic:collections:$serverId:collection:${collection.id}']
                ?.enabled ??
            false,
        order: nextOrder++,
      );
      freshIds.add(cfg.stableId);
      final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
      if (idx >= 0) {
        final updated = _sections[idx].copyWith(
          pluginDisplayText: cfg.pluginDisplayText,
        );
        if (_sections[idx].pluginDisplayText != updated.pluginDisplayText) {
          _sections[idx] = updated;
          changed = true;
        }
      } else {
        _sections.add(cfg);
        changed = true;
      }
    }

    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.collections &&
        s.serverId == serverId &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;

    return changed;
  }

  Future<List<_DiscoveredGenreRow>> _fetchGenresForHomeSections() async {
    final showGenresRows = _prefs.get(UserPreferences.displayGenresRows);
    if (!showGenresRows) return const <_DiscoveredGenreRow>[];

    try {
      final client = GetIt.instance<MediaServerClient>();
      final includeItemTypes =
          _prefs.get(UserPreferences.genresRowItemFilter).includeItemTypes;
      const pageSize = 250;
      var startIndex = 0;
      int? total;
      final all = <_DiscoveredGenreRow>[];

      while (true) {
        final response = await client.itemsApi.getGenres(
          sortBy: 'SortName',
          sortOrder: 'Ascending',
          recursive: true,
          startIndex: startIndex,
          limit: pageSize,
          fields: 'ItemCounts',
          includeItemTypes: includeItemTypes,
        );
        total ??= response['TotalRecordCount'] as int?;
        final items = (response['Items'] as List?) ?? const [];
        if (items.isEmpty) break;

        all.addAll(
          items
              .whereType<Map<String, dynamic>>()
              .where((item) =>
                  (item['Id']?.toString() ?? '').isNotEmpty &&
                  (item['Name']?.toString() ?? '').isNotEmpty)
              .map(
                (item) => _DiscoveredGenreRow(
                  id: item['Id'].toString(),
                  name: item['Name'].toString(),
                ),
              ),
        );

        startIndex += items.length;
        if (items.length < pageSize) break;
        if (total != null && startIndex >= total) break;
      }

      return all;
    } catch (_) {
      return const <_DiscoveredGenreRow>[];
    }
  }

  bool _mergeGenreSections(List<_DiscoveredGenreRow> discovered) {
    final client = GetIt.instance<MediaServerClient>();
    final serverId = client.baseUrl;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.genres &&
          c.serverId == serverId))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final genre in discovered) {
      final cfg = HomeSectionConfig.pluginDynamic(
        serverId: serverId,
        pluginSection: 'genre',
        pluginAdditionalData: genre.id,
        pluginDisplayText: genre.name,
        pluginSource: HomeSectionPluginSource.genres,
        enabled:
            existing['pluginDynamic:genres:$serverId:genre:${genre.id}']
                ?.enabled ??
            false,
        order: nextOrder++,
      );
      freshIds.add(cfg.stableId);
      final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
      if (idx >= 0) {
        final updated = _sections[idx].copyWith(
          pluginDisplayText: cfg.pluginDisplayText,
        );
        if (_sections[idx].pluginDisplayText != updated.pluginDisplayText) {
          _sections[idx] = updated;
          changed = true;
        }
      } else {
        _sections.add(cfg);
        changed = true;
      }
    }

    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.genres &&
        s.serverId == serverId &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;

    return changed;
  }

  bool _mergeHssSections() {
    if (!GetIt.instance.isRegistered<HomeScreenSectionsService>()) return false;
    final service = GetIt.instance<HomeScreenSectionsService>();
    final discovered = service.availableServers.toList();
    final allProbed = service.allCapabilities.toList();
    if (allProbed.isEmpty) return false;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.hss))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final cap in discovered) {
      for (final section in cap.sections) {
        final cfg = HomeSectionConfig.pluginDynamic(
          serverId: cap.serverId,
          pluginSection: section.section,
          pluginAdditionalData: section.additionalData,
          pluginDisplayText: section.displayText,
          pluginSource: HomeSectionPluginSource.hss,
          enabled: existing[
                  'pluginDynamic:hss:${cap.serverId}:${section.section}:${section.additionalData ?? ''}']
                  ?.enabled ??
              false,
          order: nextOrder++,
        );
        freshIds.add(cfg.stableId);
        final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
        if (idx >= 0) {
          final updated = _sections[idx].copyWith(
            pluginDisplayText: cfg.pluginDisplayText,
          );
          if (_sections[idx].pluginDisplayText != updated.pluginDisplayText) {
            _sections[idx] = updated;
            changed = true;
          }
        } else {
          _sections.add(cfg);
          changed = true;
        }
      }
    }

    final probedServers = allProbed.map((c) => c.serverId).toSet();
    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.hss &&
        s.serverId != null &&
        probedServers.contains(s.serverId) &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;
    return changed;
  }

  bool _mergeKefinSections() {
    if (!GetIt.instance.isRegistered<KefinTweaksService>()) return false;
    final service = GetIt.instance<KefinTweaksService>();
    final discovered = service.availableServers.toList();
    final allProbed = service.allCapabilities.toList();
    if (allProbed.isEmpty) return false;
    var changed = false;

    final existing = <String, HomeSectionConfig>{
      for (final cfg in _sections.where((c) =>
          c.isPluginDynamic &&
          c.pluginSource == HomeSectionPluginSource.kefinTweaks))
        cfg.stableId: cfg,
    };

    final freshIds = <String>{};
    var nextOrder = _sections.length;
    for (final cap in discovered) {
      for (final section in cap.sections) {
        final base = kefinSectionToConfig(
          section,
          cap.serverId,
          enabled: false,
          order: nextOrder++,
        );
        final cfg = base.copyWith(
          enabled: existing[base.stableId]?.enabled ?? false,
        );
        freshIds.add(cfg.stableId);
        final idx = _sections.indexWhere((s) => s.stableId == cfg.stableId);
        if (idx >= 0) {
          final updated = _sections[idx].copyWith(
            pluginDisplayText: cfg.pluginDisplayText,
            pluginAdditionalData: cfg.pluginAdditionalData,
          );
          if (_sections[idx].pluginDisplayText != updated.pluginDisplayText ||
              _sections[idx].pluginAdditionalData != updated.pluginAdditionalData) {
            _sections[idx] = updated;
            changed = true;
          }
        } else {
          _sections.add(cfg);
          changed = true;
        }
      }
    }

    final probedServers = allProbed.map((c) => c.serverId).toSet();
    final before = _sections.length;
    _sections.removeWhere((s) =>
        s.isPluginDynamic &&
        s.pluginSource == HomeSectionPluginSource.kefinTweaks &&
        s.serverId != null &&
        probedServers.contains(s.serverId) &&
        !freshIds.contains(s.stableId));
    if (_sections.length != before) changed = true;
    return changed;
  }

  void _rebuildFocusNodes() {
    for (final n in _focusNodes) {
      n.dispose();
    }
    _focusNodes.clear();
    for (var i = 0; i < _sections.length; i++) {
      _focusNodes.add(FocusNode(debugLabel: 'section_$i'));
    }
  }

  @override
  void dispose() {
    for (final n in _focusNodes) {
      n.dispose();
    }
    super.dispose();
  }

  void _pushSyncSettings() {
    final syncService = GetIt.instance<PluginSyncService>();
    if (syncService.pluginAvailable) {
      final client = GetIt.instance<MediaServerClient>();
      syncService.pushSettings(client);
    }
  }

  void _setMergeContinueWatchingNextUp(bool value, {bool pushSync = true}) {
    _prefs.set(UserPreferences.mergeContinueWatchingNextUp, value);
    if (pushSync) {
      _pushSyncSettings();
    }
  }

  void _persistSections({required bool pushSync}) {
    for (var i = 0; i < _sections.length; i++) {
      _sections[i] = _sections[i].copyWith(order: i);
    }
    final toSave = [..._sections];
    if (_mediaBarConfig != null) toSave.add(_mediaBarConfig!);
    _prefs.setHomeSectionsConfig(toSave);
    if (pushSync) {
      _pushSyncSettings();
    }
  }

  void _save() {
    _persistSections(pushSync: true);
  }

  void _focusSectionAndEnsureVisible(int index, {int attempt = 0}) {
    if (!mounted || index < 0 || index >= _focusNodes.length) return;
    final node = _focusNodes[index];
    if (!node.hasFocus) {
      node.requestFocus();
    }

    final targetContext = _focusNodes[index].context;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        alignment: 0.2,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );
      return;
    }

    if (attempt >= 3) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusSectionAndEnsureVisible(index, attempt: attempt + 1);
    });
  }

  void _moveSectionByActualIndex(int fromIndex, int toIndex) {
    if (fromIndex < 0 || fromIndex >= _sections.length) return;
    if (toIndex < 0 || toIndex >= _sections.length) return;
    if (fromIndex == toIndex) return;
    setState(() {
      final item = _sections.removeAt(fromIndex);
      _sections.insert(toIndex, item);
      final node = _focusNodes.removeAt(fromIndex);
      _focusNodes.insert(toIndex, node);
    });
    _save();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (toIndex < _focusNodes.length) {
        _focusSectionAndEnsureVisible(toIndex);
      }
    });
  }

  String _labelFor(HomeSectionConfig cfg, AppLocalizations l10n) {
    if (cfg.isPluginDynamic) {
      return cfg.pluginDisplayText?.isNotEmpty == true
          ? cfg.pluginDisplayText!
          : (cfg.pluginSection ?? l10n.none);
    }
    return _labelForType(cfg.type, l10n);
  }

  String _labelForType(HomeSectionType type, AppLocalizations l10n) => switch (type) {
    HomeSectionType.mediaBar => l10n.mediaBar,
    HomeSectionType.latestMedia => l10n.latestMedia,
    HomeSectionType.recentlyReleased => l10n.recentlyReleased,
    HomeSectionType.libraryTilesSmall => l10n.myMedia,
    HomeSectionType.libraryButtons => l10n.myMediaSmall,
    HomeSectionType.resume => l10n.continueWatching,
    HomeSectionType.resumeAudio => l10n.resumeAudio,
    HomeSectionType.resumeBook => l10n.resumeBooks,
    HomeSectionType.activeRecordings => l10n.activeRecordings,
    HomeSectionType.nextUp => l10n.nextUp,
    HomeSectionType.playlists => l10n.playlists,
    HomeSectionType.favoriteMovies => 'Favorite ${FavoriteTypeFilter.movie.displayName}',
    HomeSectionType.favoriteSeries => 'Favorite ${FavoriteTypeFilter.series.displayName}',
    HomeSectionType.favoriteEpisodes => 'Favorite ${FavoriteTypeFilter.episode.displayName}',
    HomeSectionType.favoritePeople => 'Favorite ${FavoriteTypeFilter.person.displayName}',
    HomeSectionType.favoriteArtists => 'Favorite ${FavoriteTypeFilter.musicArtist.displayName}',
    HomeSectionType.favoriteMusicVideos => 'Favorite ${FavoriteTypeFilter.musicVideo.displayName}',
    HomeSectionType.favoriteAlbums => 'Favorite ${FavoriteTypeFilter.musicAlbum.displayName}',
    HomeSectionType.favoriteSongs => 'Favorite ${FavoriteTypeFilter.audio.displayName}',
    HomeSectionType.collections => l10n.collections,
    HomeSectionType.genres => l10n.genres,
    HomeSectionType.liveTv => l10n.liveTV,
    HomeSectionType.none => l10n.none,
  };

  String _posterSizeLabel(PosterSize size, AppLocalizations l10n) => switch (size) {
    PosterSize.small => l10n.small,
    PosterSize.medium => l10n.medium,
    PosterSize.large => l10n.large,
    PosterSize.extraLarge => l10n.extraLarge,
  };

  String _rowsStyleLabel(HomeRowsStyle style) => switch (style) {
    HomeRowsStyle.v1 => 'Classic',
    HomeRowsStyle.v2 => 'Modern',
  };

  Future<void> _showPosterSizeDialog() async {
    await showFocusRestoringDialog<void>(
      context: context,
      builder: (ctx) => withCleanSettingsTypography(
        ctx,
        PosterSizeSettingsDialog(
          prefs: _prefs,
          onChanged: () => setState(() {}),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(
          context,
          Text(l10n.homeSections),
          actions: [
            IconButton(
              icon: const Icon(Icons.restore),
              tooltip: l10n.resetToDefaults,
              onPressed: () {
                setState(() {
                  _sections = HomeSectionConfig.defaults();
                  _rebuildFocusNodes();
                  _setMergeContinueWatchingNextUp(
                    UserPreferences.mergeContinueWatchingNextUp.defaultValue,
                    pushSync: false,
                  );
                });
                _save();
              },
            ),
          ],
        ),
        body: PlatformDetection.isTV
            ? _buildTvList(l10n)
            : _buildReorderableList(l10n),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.photo_size_select_large),
          title: Text(l10n.cardSize),
          subtitle: Text(_posterSizeLabel(_prefs.get(UserPreferences.posterSize), l10n)),
          trailing: const Icon(Icons.chevron_right),
          onTap: _showPosterSizeDialog,
        ),
        const Divider(),
        EnumPreferenceTile<HomeRowsStyle>(
          preference: UserPreferences.homeRowsStyle,
          title: l10n.rowsType,
          icon: Icons.view_carousel,
          description: _rowsTypeDescription,
          labelOf: _rowsStyleLabel,
          onChanged: () {
            setState(() {});
            _pushSyncSettings();
          },
        ),
        const Divider(),
        SwitchListTile(
          secondary: const Icon(Icons.merge_type),
          title: Text(l10n.mergeContinueWatchingAndNextUp),
          subtitle: Text(l10n.combineBothRows),
          value: _prefs.get(UserPreferences.mergeContinueWatchingNextUp),
          onChanged: (value) {
            _setMergeContinueWatchingNextUp(value);
            setState(() {});
          },
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildReorderableList(AppLocalizations l10n) {
    final visibleIndices = _visibleSectionIndices();
    return ReorderableListView.builder(
      header: widget.showGeneralOptions ? _buildHeader(l10n) : null,
      itemCount: visibleIndices.length,
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex--;
        if (oldIndex < 0 || oldIndex >= visibleIndices.length) return;
        if (newIndex < 0 || newIndex > visibleIndices.length) return;

        final fromActual = visibleIndices[oldIndex];
        var toActual =
            newIndex >= visibleIndices.length ? _sections.length : visibleIndices[newIndex];

        if (toActual > fromActual) {
          toActual--;
        }

        if (toActual == fromActual) return;

        setState(() {
          final item = _sections.removeAt(fromActual);
          _sections.insert(toActual, item);
          final node = _focusNodes.removeAt(fromActual);
          _focusNodes.insert(toActual, node);
        });
        _save();
      },
      itemBuilder: (context, index) {
        final sectionIndex = visibleIndices[index];
        final section = _sections[sectionIndex];
        return Padding(
          key: ValueKey(section.stableId),
          padding: _kHomeSectionTileOuterPadding,
          child: Container(
            decoration: _homeSectionTileDecoration(context, focused: false),
            child: ListTile(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              contentPadding: _kHomeSectionTileContentPadding,
              minLeadingWidth: 44,
              horizontalTitleGap: 14,
              leading: buildSettingsLeadingIconShell(
                context,
                icon: Icon(
                  section.enabled ? Icons.check_box : Icons.check_box_outline_blank,
                ),
                focused: false,
                iconColor: AppColorScheme.onSurface.withValues(alpha: 0.78),
              ),
              title: Text(
                _labelFor(section, l10n),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: kCleanSettingsFontFamily,
                ),
              ),
              subtitle: section.isPluginDynamic
                  ? Text(
                      _pluginSubtitle(section),
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: kCleanSettingsFontFamily,
                        color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    )
                  : null,
              onTap: () {
                setState(() {
                  _sections[sectionIndex] =
                      section.copyWith(enabled: !section.enabled);
                });
                _save();
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ReorderableDragStartListener(
                    index: index,
                    child: Icon(
                      Icons.drag_handle,
                      color: AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTvList(AppLocalizations l10n) {
    final visibleIndices = _visibleSectionIndices();
    return ListView.builder(
      itemCount: visibleIndices.length + (widget.showGeneralOptions ? 1 : 0),
      itemBuilder: (context, index) {
        if (widget.showGeneralOptions && index == 0) {
          return _buildHeader(l10n);
        }
        final visibleIndex = index - (widget.showGeneralOptions ? 1 : 0);
        final sectionIndex = visibleIndices[visibleIndex];
        final section = _sections[sectionIndex];
        return _HomeSectionTile(
          key: ValueKey(section.stableId),
          focusNode: _focusNodes[sectionIndex],
          autofocus: visibleIndex == 0,
          label: _labelFor(section, l10n),
          subtitle: section.isPluginDynamic
              ? _pluginSubtitle(section)
              : null,
          enabled: section.enabled,
          isFirst: visibleIndex == 0,
          isLast: visibleIndex == visibleIndices.length - 1,
          onToggle: (enabled) {
            setState(() {
              _sections[sectionIndex] = section.copyWith(enabled: enabled);
            });
            _save();
          },
          onMoveUp: () {
            if (visibleIndex == 0) return;
            _moveSectionByActualIndex(sectionIndex, visibleIndices[visibleIndex - 1]);
          },
          onMoveDown: () {
            if (visibleIndex >= visibleIndices.length - 1) return;
            _moveSectionByActualIndex(sectionIndex, visibleIndices[visibleIndex + 1]);
          },
        );
      },
    );
  }

  String _pluginSubtitle(HomeSectionConfig section) {
    return switch (section.pluginSource) {
      HomeSectionPluginSource.collections => 'Collections row',
      HomeSectionPluginSource.genres => 'Genres row',
      HomeSectionPluginSource.kefinTweaks => 'KefinTweaks plugin',
      HomeSectionPluginSource.hss => 'Home Screen Sections plugin',
    };
  }
}

class _DiscoveredCollectionRow {
  final String id;
  final String name;

  const _DiscoveredCollectionRow({
    required this.id,
    required this.name,
  });
}

class _DiscoveredGenreRow {
  final String id;
  final String name;

  const _DiscoveredGenreRow({
    required this.id,
    required this.name,
  });
}

class _HomeSectionTile extends StatefulWidget {
  final FocusNode focusNode;
  final String label;
  final String? subtitle;
  final bool enabled;
  final bool isFirst;
  final bool isLast;
  final bool autofocus;
  final ValueChanged<bool> onToggle;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  const _HomeSectionTile({
    super.key,
    required this.focusNode,
    required this.label,
    this.subtitle,
    required this.enabled,
    required this.isFirst,
    required this.isLast,
    this.autofocus = false,
    required this.onToggle,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  @override
  State<_HomeSectionTile> createState() => _HomeSectionTileState();
}

class _HomeSectionTileState extends State<_HomeSectionTile> {
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focused = widget.focusNode.hasFocus;
  }

  @override
  void didUpdateWidget(covariant _HomeSectionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final hasFocus = widget.focusNode.hasFocus;
    if (_focused != hasFocus) {
      _focused = hasFocus;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      onFocusChange: (f) {
        if (_focused != f && mounted) {
          setState(() => _focused = f);
        }
        if (f) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || !_focused) return;
            Scrollable.ensureVisible(
              context,
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOut,
              alignment: 0.2,
              alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
            );
          });
        }
      },
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) return KeyEventResult.ignored;
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft && !widget.isFirst) {
          widget.onMoveUp();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight && !widget.isLast) {
          widget.onMoveDown();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter) {
          widget.onToggle(!widget.enabled);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Padding(
        padding: _kHomeSectionTileOuterPadding,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          curve: Curves.easeOut,
          decoration: _homeSectionTileDecoration(context, focused: _focused),
          child: ListTile(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            contentPadding: _kHomeSectionTileContentPadding,
            minLeadingWidth: 44,
            horizontalTitleGap: 14,
            leading: buildSettingsLeadingIconShell(
              context,
              icon: Icon(
                widget.enabled ? Icons.check_box : Icons.check_box_outline_blank,
              ),
              focused: _focused,
              iconColor: _focused
                  ? AppColors.black.withValues(alpha: 0.54)
                  : AppColorScheme.onSurface.withValues(alpha: 0.78),
            ),
            title: Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: kCleanSettingsFontFamily,
                color: _focused
                    ? AppColors.black.withValues(alpha: 0.87)
                    : AppColorScheme.onSurface,
              ),
            ),
            subtitle: widget.subtitle != null
                ? Text(
                    widget.subtitle!,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: kCleanSettingsFontFamily,
                      color: _focused
                          ? AppColors.black.withValues(alpha: 0.54)
                          : AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  )
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.isFirst)
                  Icon(
                    Icons.arrow_left,
                    size: 18,
                    color: _focused
                        ? AppColors.black.withValues(alpha: 0.54)
                        : AppColorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                if (!widget.isLast)
                  Icon(
                    Icons.arrow_right,
                    size: 18,
                    color: _focused
                        ? AppColors.black.withValues(alpha: 0.54)
                        : AppColorScheme.onSurface.withValues(alpha: 0.7),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
