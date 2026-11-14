import 'dart:async';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart' show ImageApi;

import '../../../../data/models/aggregated_item.dart';
import '../../../../data/models/home_row.dart';
import '../../../../data/services/background_service.dart';
import '../../../../data/services/row_data_source.dart';
import '../../../../data/utils/media_type_badges.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../preference/home_section_config.dart';
import '../../../../preference/preference_constants.dart';
import '../../../../preference/user_preferences.dart';
import '../../../../util/platform_detection.dart';
import '../../../../util/tv_ui_scale.dart';
import '../../../util/home_row_title_localizer.dart';
import '../../../widgets/bounded_network_image.dart';
import '../../../widgets/carousel_panel.dart';
import '../../../widgets/home_row_spacing.dart';
import '../../../widgets/info_area.dart';
import '../../../widgets/media_card.dart';
import '../../../widgets/modern_row.dart';
import '../../../widgets/settings/settings_preview_scope.dart';
import '../../home/home_backdrop.dart';
import '../../home/home_row_card_image.dart';
import '../../home/home_view_model.dart';
import '../../setup/setup_wizard_previews.dart';
import 'preview_row_samples.dart';

/// The Row Options settings that change one group of Home rows.
enum RowOptionsGroup {
  audio({
    HomeSectionType.audioAlbums,
    HomeSectionType.audioArtists,
    HomeSectionType.audioPlaylists,
  }),
  collections({HomeSectionType.collections}),
  favorites({
    HomeSectionType.favoriteMovies,
    HomeSectionType.favoriteSeries,
    HomeSectionType.favoriteEpisodes,
    HomeSectionType.favoritePeople,
    HomeSectionType.favoriteArtists,
    HomeSectionType.favoriteMusicVideos,
    HomeSectionType.favoriteAlbums,
    HomeSectionType.favoriteSongs,
  }),
  genres({HomeSectionType.genres}),
  playlists({HomeSectionType.playlists}),
  studios({HomeSectionType.studios});

  const RowOptionsGroup(this.sections);

  /// The Home Rows sections the group's rows load from.
  final Set<HomeSectionType> sections;

  Preference<bool> get display => switch (this) {
    audio => UserPreferences.displayAudioRows,
    collections => UserPreferences.displayCollectionsRows,
    favorites => UserPreferences.displayFavoritesRows,
    genres => UserPreferences.displayGenresRows,
    playlists => UserPreferences.displayPlaylistsRows,
    studios => UserPreferences.displayStudiosRows,
  };

  Preference<LibrarySortBy> get sortBy => switch (this) {
    audio => UserPreferences.audioRowsSortBy,
    collections => UserPreferences.collectionsRowSortBy,
    favorites => UserPreferences.favoritesRowSortBy,
    genres => UserPreferences.genresRowSortBy,
    playlists => UserPreferences.playlistsRowSortBy,
    studios => UserPreferences.studiosRowSortBy,
  };

  Preference<SortDirection> get sortOrder => switch (this) {
    audio => UserPreferences.audioRowsSortOrder,
    collections => UserPreferences.collectionsRowSortOrder,
    favorites => UserPreferences.favoritesRowSortOrder,
    genres => UserPreferences.genresRowSortOrder,
    playlists => UserPreferences.playlistsRowSortOrder,
    studios => UserPreferences.studiosRowSortOrder,
  };

  /// The group a Row Options setting belongs to, or null for any other key.
  static RowOptionsGroup? forKey(String? key) => switch (key) {
    'pref_display_audio_rows' ||
    'pref_audio_rows_sort_by' ||
    'pref_audio_rows_sort_order' => audio,
    'pref_display_collections_rows' ||
    'pref_collections_row_sort_by' ||
    'pref_collections_row_sort_order' ||
    'pref_collections_row_show_episodes' => collections,
    'pref_display_favorites_rows' ||
    'pref_favorites_row_sort_by' ||
    'pref_favorites_row_sort_order' => favorites,
    'pref_display_genres_rows' ||
    'pref_genres_row_sort_by' ||
    'pref_genres_row_sort_order' => genres,
    'pref_display_playlists_rows' ||
    'pref_playlists_row_sort_by' ||
    'pref_playlists_row_sort_order' => playlists,
    'pref_display_studios_rows' ||
    'pref_studios_row_sort_by' ||
    'pref_studios_row_sort_order' => studios,
    _ => null,
  };

  static RowOptionsGroup? forSection(HomeSectionType type) =>
      values.firstWhereOrNull((group) => group.sections.contains(type));
}

/// Whether the preview draws the Home setting [key] on Home's own rows, since
/// the sample rows can't show it.
bool drawsHomeRows(String? key) =>
    key != null &&
    (key.startsWith('homeRowImageType_') || _homeRowsKeys.contains(key));

const _homeRowsKeys = {
  'home_sections_config',
  'pref_merge_continue_watching_next_up',
  'pref_merge_recent_rows_by_type',
  'pref_display_rewatch_row',
  'pref_display_since_you_watched_rows',
  'seasonal_row_enabled',
  'pref_hide_home_watch_progress',
  'pref_hide_home_unwatched_count',
  'pref_watched_indicator_behavior',
  'pref_media_type_badge_behavior',
  'pref_enable_series_thumbnails',
  'pref_card_focus_expansion',
  'pref_classic_home_rows_padding',
  'pref_modern_home_rows_padding',
  'pref_home_row_info_overlay',
};

/// Home's rows as the preview found them the first time a Row Options
/// setting showed with Home fully loaded, kept for the rest of the settings
/// visit. Every Row Options change reloads Home behind Settings, and a list
/// caught mid-reload is placeholders and fresh random artwork, so the rows
/// around the edited ones come from here and don't move. It's taken again
/// when the rows Home shows change (Rows, Kids Mode, Multi-Server, the
/// merges, the Display switches).
class _HomeSnapshot {
  final String layout;
  final List<HomeRow> rows;

  /// The sort each group's rows were loaded with, so only a request for that
  /// same sort is filled from [rows].
  final Map<RowOptionsGroup, (LibrarySortBy, SortDirection)> sorts;
  final bool multiServer;

  /// Whether Home had finished loading, so [rows] can stand in for it. A
  /// snapshot taken mid-load fills nothing.
  final bool complete;

  _HomeSnapshot._(
    this.layout,
    this.rows,
    this.sorts,
    this.multiServer,
    this.complete,
  );

  static final _byController = Expando<_HomeSnapshot>();

  static String _layoutOf(UserPreferences prefs) => [
    prefs.get(UserPreferences.homeSectionsJson),
    prefs.get(UserPreferences.kidsModeEnabled),
    prefs.get(UserPreferences.enableMultiServerLibraries),
    prefs.get(UserPreferences.mergeContinueWatchingNextUp),
    prefs.get(UserPreferences.mergeRecentRowsByType),
    prefs.get(UserPreferences.hideWatchedInRecentRows),
    prefs.get(UserPreferences.displayRewatchRow),
    prefs.get(UserPreferences.displaySinceYouWatchedRows),
    for (final group in RowOptionsGroup.values) prefs.get(group.display),
  ].join('|');

  static _HomeSnapshot of(
    SettingsPreviewController controller,
    UserPreferences prefs,
  ) {
    final layout = _layoutOf(prefs);
    final taken = _byController[controller];
    if (taken != null && taken.layout == layout) return taken;
    final viewModel = GetIt.instance.isRegistered<HomeViewModel>()
        ? GetIt.instance<HomeViewModel>()
        : null;
    final home = viewModel?.rows ?? const <HomeRow>[];
    final loaded = [
      for (final row in home)
        if (!row.isLoading && row.items.isNotEmpty) row,
    ];
    // Rows far down Home stay placeholders until Home scrolls near them, so
    // Home counts as loaded once its own load is done, whatever they show.
    final complete =
        viewModel != null && !viewModel.isLoading && loaded.isNotEmpty;
    final snapshot = _HomeSnapshot._(
      layout,
      loaded,
      {
        for (final group in RowOptionsGroup.values)
          group: (prefs.get(group.sortBy), prefs.get(group.sortOrder)),
      },
      prefs.get(UserPreferences.enableMultiServerLibraries),
      complete,
    );
    // Home part way through loading is no picture of Home, so the next
    // build looks again.
    if (complete) _byController[controller] = snapshot;
    return snapshot;
  }
}

/// What the preview draws for a Row Options setting.
class _Plan {
  /// Home from the top of the edited row down, the edited row first. Null
  /// draws Home unchanged.
  final List<HomeRow>? rows;

  /// Why Home looks the same, or what the setting changes instead.
  final String? caption;

  /// Whether [caption] says why the setting can't change Home right now, so
  /// it's shown over a dimmed Home rather than as a note under it.
  final bool blocked;

  /// The group the plan was made for.
  final RowOptionsGroup? group;

  _Plan.home({this.caption, this.group, this.blocked = false}) : rows = null;
  _Plan.focused(List<HomeRow> this.rows, {this.caption, this.group})
    : blocked = false;

  /// Same rows, same items, same order: nothing to redraw.
  late final String signature = rows == null
      ? 'home'
      : [
          for (final row in rows!)
            '${row.id}:${row.items.map((i) => '${i.serverId}/${i.id}').join(',')}',
        ].join('|');
}

/// Home as it looks with the D-pad on the first row of the Row Options group
/// being edited: that row where Home brings a focused row to rest, its first
/// card focused the way Home draws it, the backdrop from that card, and
/// Home's rows below it in Home's order. The edited rows load with the sort
/// being looked at. A new sort swaps in once its artwork is ready. Without a
/// group it's Home's own rows, from the first one [focusedKey] changes.
class PreviewRowOptionsHome extends StatefulWidget {
  final RowOptionsGroup? group;
  final String? focusedKey;

  const PreviewRowOptionsHome({super.key, this.group, this.focusedKey});

  @override
  State<PreviewRowOptionsHome> createState() => _PreviewRowOptionsHomeState();
}

class _PreviewRowOptionsHomeState extends State<PreviewRowOptionsHome> {
  /// Longest a new sort waits on its artwork before it shows anyway.
  static const _artWait = Duration(milliseconds: 1500);

  _Plan? _shown;
  String? _pending;

  /// The rows on screen, kept while they stay the same so the settings
  /// list's every focus change doesn't rebuild their cards.
  _Rows? _rows;

  PreviewRowSamples? _samples;
  Set<PreviewRowQuery> _asked = const {};

  @override
  void dispose() {
    // Nothing is drawn any more, so a fetch still waiting to start needn't,
    // unless another preview has asked for something since.
    _samples?.forget(_asked);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = SettingsPreviewScope.maybeOf(context);
    if (controller == null) return settingsHomePreview();
    final samples = _samples = PreviewRowSamples.of(controller);
    return ListenableBuilder(
      listenable: samples,
      builder: (context, _) {
        final plan = _plan(context, controller, samples);
        if (plan != null) {
          _adopt(plan);
        } else if (_shown?.group != widget.group) {
          // Another group's rows and note mustn't stand in while this one's
          // rows load.
          _adopt(_Plan.home(group: widget.group));
        }
        final shown = _shown ?? _Plan.home();
        final rows = shown.rows;
        final caption = shown.caption;
        // The focused screen last drawn stays built behind Home.
        final focused = rows == null ? _rows : _rowsFor(context, shown);
        return Stack(
          fit: StackFit.expand,
          children: [
            // Both screens stay built and only the one shown paints, so
            // turning the rows on or off, or moving between the groups,
            // doesn't build a whole screen from nothing in one frame.
            _Shown(shown: rows == null, child: settingsHomePreview()),
            if (focused != null)
              _Shown(
                shown: rows != null,
                child: _FocusedHome(
                  focusedItem: focused.rows.first.items.first,
                  rows: focused,
                ),
              ),
            if (caption != null && shown.blocked) ...[
              // Home as it stays, dimmed so the reason reads first.
              const ColoredBox(color: Color(0x8C000000)),
              Center(child: _Notice(text: caption)),
            ] else if (caption != null)
              Positioned(
                left: 6,
                right: 6,
                bottom: 6,
                child: _Caption(text: caption),
              ),
          ],
        );
      },
    );
  }

  _Rows _rowsFor(BuildContext context, _Plan plan) {
    final frame = _HomeFrame.of(context);
    final key = ValueKey('${plan.signature}|${frame.look(plan.rows!)}');
    final kept = _rows;
    if (kept != null && kept.key == key) return kept;
    return _rows = _Rows(key: key, rows: plan.rows!, frame: frame);
  }

  /// Takes [plan] on, at once when it draws Home unchanged or nothing new,
  /// and once the new cards' artwork is in memory otherwise, so cards and
  /// artwork change together.
  void _adopt(_Plan plan) {
    final signature = plan.signature;
    if (_shown?.signature == signature) {
      if (_shown?.caption != plan.caption || _shown?.blocked != plan.blocked) {
        _shown = plan;
      }
      _pending = null;
      return;
    }
    if (plan.rows == null) {
      _shown = plan;
      _pending = null;
      return;
    }
    if (_pending == signature) return;
    _pending = signature;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted || _pending != signature) return;
      await _precache(plan.rows!).timeout(_artWait, onTimeout: () {});
      if (!mounted || _pending != signature) return;
      setState(() {
        _shown = plan;
        _pending = null;
      });
    });
  }

  /// Loads the focused row's artwork and the backdrop at the sizes they're
  /// drawn at.
  Future<void> _precache(List<HomeRow> rows) async {
    final row = rows.first;
    final frame = _HomeFrame.of(context);
    final loads = <Future<void>>[];
    final backdrop = _backdropUrl(row.items.first);
    if (backdrop != null) {
      loads.add(
        BoundedNetworkImage.precache(
          context,
          backdrop,
          layoutWidth: frame.size.width,
          layoutHeight: frame.size.height,
        ),
      );
    }
    var x = 0.0;
    for (final (index, item) in row.items.indexed) {
      if (x > frame.size.width) break;
      final card = frame.card(row, item, focused: index == 0 && !frame.phone);
      x += card.width + frame.spacing(row);
      final url = card.url;
      if (url == null) continue;
      loads.add(
        BoundedNetworkImage.precache(
          context,
          url,
          layoutWidth: card.width,
          layoutHeight: card.width / card.aspectRatio,
          maxWidth: MediaCard.decodeMaxWidthFor(card.aspectRatio),
        ),
      );
    }
    await Future.wait(loads.map((load) => load.catchError((_) {})));
  }

  /// What the group's settings, with the values being looked at, do to
  /// Home. Null while the edited rows are still loading, which keeps what's
  /// on screen.
  _Plan? _plan(
    BuildContext context,
    SettingsPreviewController controller,
    PreviewRowSamples samples,
  ) {
    if (!GetIt.instance.isRegistered<UserPreferences>()) {
      return _Plan.home();
    }
    final l10n = AppLocalizations.of(context);
    final prefs = GetIt.instance<UserPreferences>();
    final group = widget.group;
    final configs = prefs.activeHomeSectionConfigs;
    final showEpisodes =
        widget.focusedKey == UserPreferences.collectionsRowShowEpisodes.key
        ? l10n.settingsPreviewShowEpisodesNote
        : null;

    if (group != null &&
        !configs.any((c) => c.isBuiltin && group.sections.contains(c.type))) {
      final on = previewValue(context, group.display);
      final setting = _displaySwitchName(l10n, group);
      // The Rows screen lists turned-off rows in groups under Disabled, and
      // only lists these once the Display switch is on, so the notice gives
      // the steps in that order and names the group to open.
      final rowsGroup = group == RowOptionsGroup.collections
          ? l10n.collections
          : l10n.general;
      return _Plan.home(
        group: group,
        blocked: true,
        caption: switch ((_offReason(prefs, group), group, on)) {
          (_OffReason.kidsMode, _, _) => l10n.settingsPreviewRowsOffInKidsMode,
          (_, RowOptionsGroup.audio, true) =>
            l10n.settingsPreviewAudioRowsOffInHomeRows(
              rowsGroup,
              l10n.disabled,
            ),
          (_, RowOptionsGroup.audio, false) =>
            l10n.settingsPreviewAudioRowsOffInHomeRowsSwitchOff(
              setting,
              rowsGroup,
              l10n.disabled,
            ),
          (_, RowOptionsGroup.collections, true) =>
            l10n.settingsPreviewCollectionsOffInHomeRows(
              rowsGroup,
              l10n.disabled,
            ),
          (_, RowOptionsGroup.collections, false) =>
            l10n.settingsPreviewCollectionsOffInHomeRowsSwitchOff(
              setting,
              rowsGroup,
              l10n.disabled,
            ),
          (_, _, true) => l10n.settingsPreviewNeedsRowInRows(l10n.disabled),
          (_, _, false) => l10n.settingsPreviewNeedsSwitchAndRow(setting),
        },
      );
    }
    if (group != null && !previewValue(context, group.display)) {
      return _Plan.home(group: group, caption: showEpisodes);
    }

    // Every Row Options row loads here, so a group switched on during this
    // visit is drawn where Home puts it even though Home hadn't loaded it
    // when the snapshot was taken.
    final snapshot = _HomeSnapshot.of(controller, prefs);
    // With nothing being edited, the rows are Home's own, which have to have
    // finished loading.
    if (group == null && !snapshot.complete) return null;
    final multiServer = prefs.get(UserPreferences.enableMultiServerLibraries);
    final serverId = PreviewRowSamples.activeServerId;
    final queries = <HomeSectionType, PreviewRowQuery>{};
    for (final config in configs) {
      final owner = config.isBuiltin
          ? RowOptionsGroup.forSection(config.type)
          : null;
      if (owner == null || !previewValue(context, owner.display)) continue;
      final query = PreviewRowQuery(
        section: config.type,
        sortBy: previewValue(context, owner.sortBy),
        sortOrder: previewValue(context, owner.sortOrder),
        multiServer: multiServer,
        serverId: serverId,
      );
      queries[config.type] = query;
      // Home's rows are only good for the sort Home loaded them with.
      if (snapshot.complete &&
          (query.sortBy, query.sortOrder) == snapshot.sorts[owner] &&
          multiServer == snapshot.multiServer) {
        final loaded = snapshot.rows.firstWhereOrNull(
          (row) =>
              HomeViewModel.sectionConfigForRow(row, configs)?.type ==
              config.type,
        );
        if (loaded != null) samples.seed(query, loaded);
      }
    }
    samples.want(_asked = queries.values.toSet());

    final rows = <HomeRow>[];
    var focusedAt = -1;
    var groupLoading = false;
    var groupFailed = false;
    for (final config in configs) {
      final query = config.isBuiltin ? queries[config.type] : null;
      if (query != null) {
        final sample = samples.sampleFor(query);
        final inGroup = group?.sections.contains(config.type) ?? false;
        if (sample == null || sample.status == PreviewRowStatus.loading) {
          if (inGroup) groupLoading = true;
          continue;
        }
        if (sample.status == PreviewRowStatus.failed) {
          if (inGroup) groupFailed = true;
          continue;
        }
        final row = sample.row!;
        // Home leaves an empty row out.
        if (row.items.isEmpty) continue;
        if (inGroup && focusedAt < 0) focusedAt = rows.length;
        rows.add(row);
        continue;
      }
      if (config.isBuiltin && RowOptionsGroup.forSection(config.type) != null) {
        continue;
      }
      rows.addAll(
        snapshot.rows.where(
          (row) =>
              HomeViewModel.sectionConfigForRow(row, configs)?.stableId ==
              config.stableId,
        ),
      );
    }

    // Wait for every row of the group, or the focused row would jump from
    // one to the next as each arrives.
    if (groupLoading) return null;
    if (group == null) {
      if (rows.isEmpty) return _Plan.home();
      final target = _rowShowing(widget.focusedKey, configs);
      focusedAt = target == null ? 0 : math.max(0, rows.indexWhere(target));
    } else if (focusedAt < 0) {
      return _Plan.home(
        group: group,
        blocked: !groupFailed,
        caption: groupFailed
            ? showEpisodes
            : switch (group) {
                RowOptionsGroup.audio => l10n.settingsPreviewAudioRowsEmpty,
                RowOptionsGroup.collections =>
                  l10n.settingsPreviewCollectionsEmpty,
                _ => l10n.settingsPreviewRowsEmpty,
              },
      );
    }
    final shownRows = rows.sublist(focusedAt);
    return _Plan.focused(
      // Expanded Rows gives each row the whole screen, so nothing shows
      // below the focused one.
      prefs.get(UserPreferences.fullScreenRows) &&
              !PlatformDetection.useMobileUi
          ? shownRows.sublist(0, 1)
          : shownRows,
      group: group,
      caption: showEpisodes,
    );
  }
}

/// What the Home setting [key] changes on a row, so the preview brings the
/// first such row into focus. Null for a setting that shows on any row.
bool Function(HomeRow row)? _rowShowing(
  String? key,
  List<HomeSectionConfig> configs,
) {
  if (key != null && key.startsWith('homeRowImageType_')) {
    return (row) {
      final section = HomeViewModel.sectionConfigForRow(row, configs)?.type;
      return section != null &&
          UserPreferences.homeRowImageType(section).key == key;
    };
  }
  final bool Function(AggregatedItem item)? shows = switch (key) {
    'pref_hide_home_watch_progress' => (i) => (i.playedPercentage ?? 0) > 0,
    'pref_hide_home_unwatched_count' => (i) => (i.unplayedItemCount ?? 0) > 0,
    'pref_watched_indicator_behavior' =>
      (i) => i.isPlayed || (i.unplayedItemCount ?? 0) > 0,
    'pref_media_type_badge_behavior' => (i) => i.seerrMediaType != null,
    'pref_enable_series_thumbnails' => (i) => i.type == 'Episode',
    _ => null,
  };
  return shows == null ? null : (row) => row.items.any(shows);
}

enum _OffReason { rows, kidsMode }

/// Why none of [group]'s rows can be on Home, or null when one can.
_OffReason? _offReason(UserPreferences prefs, RowOptionsGroup group) {
  bool inGroup(HomeSectionConfig c) =>
      c.isBuiltin && group.sections.contains(c.type);
  if (prefs.activeHomeSectionConfigs.any(inGroup)) return null;
  return prefs.homeSectionsConfig.any((c) => c.enabled && inGroup(c))
      ? _OffReason.kidsMode
      : _OffReason.rows;
}

String _displaySwitchName(AppLocalizations l10n, RowOptionsGroup group) =>
    switch (group) {
      RowOptionsGroup.audio => l10n.displayAudioRows,
      RowOptionsGroup.collections => l10n.displayCollectionsRows,
      RowOptionsGroup.favorites => l10n.displayFavoritesRows,
      RowOptionsGroup.genres => l10n.displayGenresRows,
      RowOptionsGroup.playlists => l10n.displayPlaylistsRows,
      RowOptionsGroup.studios => l10n.displayStudiosRows,
    };

/// For the inspector: why the Row Options setting [key] can't change Home
/// with the rows set up as they are, or null when it can or isn't one. With
/// the Display switch off, the Rows screen doesn't list the rows yet, so the
/// switch comes first.
String? rowOptionsBlockedReason(BuildContext context, String? key) {
  final group = RowOptionsGroup.forKey(key);
  if (group == null || !GetIt.instance.isRegistered<UserPreferences>()) {
    return null;
  }
  final l10n = AppLocalizations.of(context);
  return switch (_offReason(GetIt.instance<UserPreferences>(), group)) {
    _OffReason.rows when !previewValue(context, group.display) =>
      l10n.settingsPreviewNeedsSwitchAndRow(_displaySwitchName(l10n, group)),
    _OffReason.rows => l10n.settingsPreviewNeedsRowInRows(l10n.disabled),
    _OffReason.kidsMode => l10n.settingsPreviewKeptOffByKidsMode,
    null => null,
  };
}

Duration _fade(BuildContext context) => MediaQuery.disableAnimationsOf(context)
    ? Duration.zero
    : const Duration(milliseconds: 200);

/// The backdrop Home shows behind [item]. An item without one leaves the
/// backdrop Home already had, which here is the one the preview showed. A
/// phone has no focus to follow, so it keeps that one throughout.
String? _backdropUrl(AggregatedItem item) =>
    (PlatformDetection.useMobileUi ? null : _ownBackdropUrl(item)) ??
    SetupPreviewData.items.firstOrNull?.backdropUrl;

String? _ownBackdropUrl(AggregatedItem item) {
  if (!GetIt.instance.isRegistered<BackgroundService>()) return null;
  try {
    return GetIt.instance<BackgroundService>()
        .backdropUrlsFor(item)
        .firstOrNull;
  } catch (_) {
    return null;
  }
}

/// A note under the preview, drawn at the size of the text around it rather
/// than the scaled-down screen's.
class _Caption extends StatelessWidget {
  final String text;

  const _Caption({required this.text});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // A phone's portrait preview is only a thumb wide, so the note wraps
        // further there instead of being cut short.
        final narrow = constraints.maxWidth < 200;
        return Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: narrow ? 6 : 10,
              vertical: narrow ? 4 : 6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.72),
              borderRadius: AppRadius.circular(narrow ? 8 : 10),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: narrow ? 8 : 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: narrow ? 10.5 : 12.5,
                height: 1.3,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Why a setting can't change Home right now, centred over the dimmed
/// preview at the size of the text around it.
class _Notice extends StatelessWidget {
  final String text;

  const _Notice({required this.text});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth < 200;
        return Container(
          constraints: BoxConstraints(
            maxWidth: narrow ? constraints.maxWidth - 12 : 340,
          ),
          padding: EdgeInsets.all(narrow ? 8 : 14),
          decoration: BoxDecoration(
            color: AppColorScheme.surface.withValues(alpha: 0.94),
            borderRadius: AppRadius.circular(narrow ? 8 : 12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.info_outline,
                size: narrow ? 16 : 22,
                color: Colors.amber,
              ),
              SizedBox(height: narrow ? 4 : 8),
              Text(
                text,
                textAlign: TextAlign.center,
                maxLines: narrow ? 9 : 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: narrow ? 10.5 : 13,
                  height: 1.35,
                  color: AppColorScheme.onSurface,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Home's measurements on the canvas the preview lays its screen out on.
/// Each number is the one HomeScreen uses for the same thing.
class _HomeFrame {
  final Size size;
  final UserPreferences prefs;
  final SettingsPreviewController? controller;
  final bool phone;
  final bool tv;
  final bool modern;
  final double desktopScale;
  final double platformScale;
  final PosterSize posterSize;
  final bool cardExpansion;
  final bool infoArea;
  final double rowLeftInset;
  final double infoTop;
  final double focusTop;

  _HomeFrame._({
    required this.size,
    required this.prefs,
    required this.controller,
    required this.phone,
    required this.tv,
    required this.modern,
    required this.desktopScale,
    required this.platformScale,
    required this.posterSize,
    required this.cardExpansion,
    required this.infoArea,
    required this.rowLeftInset,
    required this.infoTop,
    required this.focusTop,
  });

  factory _HomeFrame.of(BuildContext context) {
    final prefs = GetIt.instance<UserPreferences>();
    final phone = PlatformDetection.useMobileUi;
    final tv = PlatformDetection.useLeanbackUi;
    // Read straight from the saved settings, since none of these is tried in
    // a picker.
    final modern = prefs.get(UserPreferences.homeRowsStyle).usesModernCards;
    final desktopScale = prefs.get(UserPreferences.desktopUiScale).scaleFactor;
    final navbarTop =
        prefs.get(UserPreferences.navbarPosition) == NavbarPosition.top;
    final infoArea =
        !phone && !modern && prefs.get(UserPreferences.homeRowInfoOverlay);
    // _ContentRows' rowLeftInset.
    final rowLeftInset =
        (!navbarTop && !phone ? 56.0 : (navbarTop && tv ? tvTopNavbarRowInset : 0.0)) +
        (phone ? 0.0 : 16.0);
    // The band the InfoArea sits in, from _ContentRows' layout pass.
    final infoNavbar = tv ? (navbarTop ? 45.0 : 15.0) : (phone ? 60.0 : 80.0);
    final infoTop = infoNavbar + (!phone && infoNavbar == 0 ? 14.0 : 8.0);
    // _desktopRowFocusTargetTop, plus the room a TV opens around the
    // focused row when there's no InfoArea.
    final double focusTop;
    if (phone) {
      // The top of Home's list, where the row lands with Home scrolled to it.
      focusTop = modern ? (navbarTop ? 60.0 : 80.0) + 8.0 : 56.0;
    } else if (infoArea) {
      focusTop =
          infoTop +
          InfoArea.fixedHeight(isMobile: false, desktopScale: desktopScale);
    } else {
      final navbar = navbarTop ? (tv ? 45.0 : 80.0) : 0.0;
      focusTop =
          navbar +
          (tv ? 32.0 * desktopScale : 8.0) +
          (tv && !prefs.get(UserPreferences.fullScreenRows) ? 20.0 : 0.0);
    }
    return _HomeFrame._(
      size: setupPreviewSize(),
      prefs: prefs,
      controller: SettingsPreviewScope.maybeOf(context),
      phone: phone,
      tv: tv,
      modern: modern,
      desktopScale: desktopScale,
      platformScale: (tv ? 0.8 : 1.0) * desktopScale,
      posterSize: prefs.get(UserPreferences.posterSize),
      cardExpansion: prefs.get(UserPreferences.cardFocusExpansion),
      infoArea: infoArea,
      rowLeftInset: rowLeftInset,
      infoTop: infoTop,
      focusTop: focusTop,
    );
  }

  /// [preference] as the preview draws it: the value a picker is trying, else
  /// the saved one.
  T value<T>(Preference<T> preference) {
    final tried = controller;
    if (tried != null && tried.isTrying(preference.key)) {
      final value = tried.tryingValue(preference.key);
      if (value is T) return value;
    }
    return prefs.get(preference);
  }

  ImageType _perRowImageType(HomeSectionType section) =>
      value(UserPreferences.homeRowImageType(section));

  ImageType _imageType(HomeRow row) =>
      homeRowImageTypeForRow(row, prefs, perRow: _perRowImageType);

  /// Everything the cards are drawn from, so rows kept between builds are
  /// built again once one of them changes.
  String look(List<HomeRow> rows) => [
    prefs.get(UserPreferences.homeRowsStyle),
    prefs.get(UserPreferences.hideHomeMediaDescription),
    desktopScale,
    posterSize,
    cardExpansion,
    infoArea,
    focusTop,
    _useSeriesThumbs,
    prefs.get(UserPreferences.fullScreenRows),
    prefs.get(UserPreferences.classicHomeRowsPadding),
    prefs.get(UserPreferences.modernHomeRowsPadding),
    prefs.get(UserPreferences.hideHomeWatchProgress),
    prefs.get(UserPreferences.hideHomeUnwatchedCount),
    value(UserPreferences.watchedIndicatorBehavior),
    value(UserPreferences.mediaTypeBadgeBehavior),
    for (final row in rows) _imageType(row),
  ].join('|');

  /// The server's artwork for [item], the way Home asks for it.
  ImageApi? _apiFor(AggregatedItem item) {
    try {
      if (GetIt.instance.isRegistered<HomeViewModel>()) {
        return GetIt.instance<HomeViewModel>().imageApiForServer(item.serverId);
      }
      if (GetIt.instance.isRegistered<RowDataSource>()) {
        return GetIt.instance<RowDataSource>().imageApi;
      }
    } catch (_) {}
    return null;
  }

  bool isModern(HomeRow row) => isHomeRowModern(row, prefs);

  bool isCarousel(HomeRow row) => isHomeRowCarousel(row, prefs);

  /// The Carousel panel for [row]'s first card, which is the one Home shows
  /// before the row is focused.
  Widget carouselPanel(HomeRow row) {
    final item = row.items.first;
    final api = _apiFor(item);
    return CarouselPanel(
      item: item,
      desktopScale: desktopScale,
      backdropUrl: api == null ? null : carouselBackdropUrl(item, api),
      ratings: CarouselPanel.homeRatings(item, prefs),
      showOverview: !prefs.get(UserPreferences.hideHomeMediaDescription),
    );
  }

  /// Live TV, Watch Parties and the small library tiles, which Home draws
  /// as squares under a fixed label band.
  static bool isSquareRow(HomeRow row) =>
      row.rowType == HomeRowType.liveTv ||
      row.rowType == HomeRowType.watchParties ||
      row.rowType == HomeRowType.libraryTilesSmall;

  static bool _isLibraryRow(HomeRow row) =>
      row.rowType == HomeRowType.libraryTilesSmall ||
      row.rowType == HomeRowType.libraryTiles;

  double get _squareSide => posterSize.portraitHeight * platformScale;

  double get _metadataScale => desktopScale;

  /// Modern's poster height, which every card in a Modern row shares.
  double get modernHeight => modernImageHeight(posterSize, platformScale);

  /// The card [item] draws as in [row], grown to Modern's wide focused card
  /// when [focused].
  HomeRowCardImage card(
    HomeRow row,
    AggregatedItem item, {
    bool focused = false,
  }) {
    final api = _apiFor(item);
    if (isSquareRow(row)) {
      final url = api == null
          ? null
          : resolvePrimaryImageUrl(item, api, maxWidth: 400);
      return (url: url, width: _squareSide, aspectRatio: 1.0);
    }
    final rowModern = isModern(row);
    if (rowModern && focused && !row.isAudio) {
      final height = modernHeight;
      final poster = api == null
          ? null
          : resolveRowImageUrl(
              item,
              api,
              height,
              ImageType.poster,
              _useSeriesThumbs,
              1.0,
            );
      // Home's grown card asks for the item's wide artwork first.
      final wide = api == null
          ? null
          : resolveRowImageUrl(
              item,
              api,
              height,
              ImageType.thumb,
              _useSeriesThumbs,
              1.0,
            );
      return (url: wide ?? poster, width: height * 16 / 9, aspectRatio: 16 / 9);
    }
    if (api == null) {
      final ar = rowModern
          ? (row.isAudio ? 1.0 : 2 / 3)
          : aspectRatioForRowItem(item, row, _imageType(row));
      final height = rowModern
          ? modernHeight
          : (ar > 1 ? posterSize.landscapeHeight : posterSize.portraitHeight) *
                platformScale;
      return (url: null, width: height * ar, aspectRatio: ar);
    }
    return homeRowCardImage(
      row,
      item,
      prefs: prefs,
      posterSize: posterSize,
      useSeriesThumbs: _useSeriesThumbs,
      requestScale: 1.0,
      platformScale: platformScale,
      imageApi: api,
      perRowImageType: _perRowImageType,
    );
  }

  bool get _useSeriesThumbs =>
      prefs.get(UserPreferences.seriesThumbnailsEnabled);

  /// The gap between two cards, from the first card's width like Home.
  double spacing(HomeRow row) {
    final first = row.items.isEmpty ? null : card(row, row.items.first);
    final extent = first?.width ?? 0;
    return cardExpansion && !phone ? MediaCard.focusGap(extent) : 12.0;
  }

  final _tallest = <HomeRow, double>{};

  /// The tallest artwork in [row], which the focus growth is measured from,
  /// worked out from the cards' shapes the way _staticRowHeight does.
  double maxImageHeight(HomeRow row) => _tallest[row] ??= () {
    if (isSquareRow(row)) return _squareSide;
    if (isModern(row)) return modernHeight;
    final type = isSeerrFilterRow(row) ? ImageType.thumb : _imageType(row);
    var tallest = 0.0;
    for (final item in row.items) {
      final ar = aspectRatioForRowItem(item, row, type);
      final height =
          (ar > 1 ? posterSize.landscapeHeight : posterSize.portraitHeight) *
          platformScale;
      if (height > tallest) tallest = height;
    }
    return tallest == 0 ? posterSize.portraitHeight * platformScale : tallest;
  }();

  double headroom(HomeRow row) => cardExpansion && !phone
      ? maxImageHeight(row) * (MediaCard.focusScale - 1)
      : 0.0;

  /// The room under the artwork for the labels, or Modern's details.
  double metadataHeight(HomeRow row) {
    if (isSquareRow(row)) return 56.0 * _metadataScale;
    if (!isModern(row)) return 50.0 * _metadataScale;
    if (isCarousel(row)) {
      return carouselPanelGap(desktopScale) + carouselPanelHeight(desktopScale);
    }
    final budget = row.rowType == HomeRowType.libraryTiles
        ? 38.0
        : modernMetadataBudget(prefs, UserPreferences.homeRowsRatings);
    return budget * _metadataScale;
  }

  /// Extra room the Classic padding setting asks for.
  double classicPadding(HomeRow row) {
    if (isModern(row) ||
        _isLibraryRow(row) ||
        (!phone && prefs.get(UserPreferences.fullScreenRows))) {
      return 0;
    }
    final padding = prefs
        .get(UserPreferences.classicHomeRowsPadding)
        .toDouble();
    return phone ? padding : (padding - 10).clamp(0.0, double.infinity);
  }

  /// Extra room after a row, from the Modern padding setting, or for a
  /// Classic library row from the Classic one.
  double modernTrailing(HomeRow row) {
    if (!phone && prefs.get(UserPreferences.fullScreenRows)) return 0;
    if (isCarousel(row)) return carouselRowPadding(prefs, desktopScale);
    if (!isModern(row)) {
      if (!_isLibraryRow(row)) return 0;
      final padding = prefs
          .get(UserPreferences.classicHomeRowsPadding)
          .toDouble();
      return (padding - 10.0).clamp(0.0, 120.0);
    }
    final custom = prefs.get(UserPreferences.modernHomeRowsPadding).toDouble();
    final offset = (custom - 400.0).clamp(-40.0, 200.0);
    if (phone) return 20.0 + offset / 2;
    return offset + (_isLibraryRow(row) ? 100.0 : 0.0);
  }
}

/// [child] while [shown]; built but neither painted nor animating
/// otherwise.
class _Shown extends StatelessWidget {
  final bool shown;
  final Widget child;

  const _Shown({required this.shown, required this.child});

  @override
  // The screen is a picture of Home that takes no focus or touch, so a
  // screen reader has nothing to find in it. Swapping which screen shows
  // would otherwise rebuild the accessibility tree for a whole screen in
  // one frame, which cost a TV about 11 ms.
  Widget build(BuildContext context) => Offstage(
    offstage: !shown,
    child: TickerMode(
      enabled: shown,
      child: ExcludeSemantics(child: child),
    ),
  );
}

/// The focused-row view of Home. Its navbar and backdrop stay put while the
/// rows cross-fade to new ones.
class _FocusedHome extends StatelessWidget {
  final AggregatedItem focusedItem;
  final _Rows rows;

  const _FocusedHome({required this.focusedItem, required this.rows});

  @override
  Widget build(BuildContext context) {
    return settingsNavbarPreviewOver(
      Builder(
        builder: (context) {
          final backdrop = settingsHomeBackdropStyle(context);
          return Stack(
            fit: StackFit.expand,
            children: [
              if (backdrop != UserPreferences.homeBackdropOff)
                HomeBackdrop(
                  url: _backdropUrl(focusedItem),
                  blurAmount: previewValue(
                    context,
                    UserPreferences.browsingBackgroundBlurAmount,
                  ).toDouble(),
                  style: backdrop,
                ),
              const HomeGradientScrim(),
              AnimatedSwitcher(
                duration: _fade(context),
                layoutBuilder: (current, previous) => Stack(
                  fit: StackFit.expand,
                  children: [...previous, ?current],
                ),
                child: rows,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Rows extends StatelessWidget {
  final List<HomeRow> rows;
  final _HomeFrame frame;

  const _Rows({super.key, required this.rows, required this.frame});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final prefs = frame.prefs;
    final merge = prefs.effectiveMergeContinueWatchingNextUp;
    final children = <Widget>[];
    var top = frame.focusTop;
    for (final (index, row) in rows.indexed) {
      if (top > frame.size.height) break;
      final focused = index == 0 && !frame.phone;
      final rowWidget = _Row(
        row: row,
        title: localizeHomeRowTitle(
          row: row,
          l10n: l10n,
          mergeContinueWatchingAndNextUp: merge,
        ),
        frame: frame,
        focused: focused,
      );
      final extent = _Row.extent(frame, row);
      // A TV moves the focused row's content down 20 when there's no
      // InfoArea, inside the room laid out for the row, so the row after it
      // doesn't move.
      final shifted = index == 0 && frame.tv && !frame.infoArea;
      children.add(
        shifted
            ? SizedBox(
                height: extent - 20,
                child: OverflowBox(
                  alignment: AlignmentDirectional.topStart,
                  maxHeight: extent,
                  child: rowWidget,
                ),
              )
            : rowWidget,
      );
      top += shifted ? extent - 20 : extent;
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        if (frame.infoArea)
          PositionedDirectional(
            top: frame.infoTop,
            start: frame.rowLeftInset + 16,
            end: 16,
            child: InfoArea(item: rows.first.items.first),
          ),
        Positioned.fill(
          child: ClipRect(
            child: OverflowBox(
              alignment: AlignmentDirectional.topStart,
              maxHeight: double.infinity,
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  // Home's last row can only scroll to just under the
                  // InfoArea, 8 lower than the others come to rest.
                  top:
                      frame.focusTop +
                      (frame.infoArea && rows.length == 1 ? 8.0 : 0.0),
                  start: frame.rowLeftInset,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// One Home row: its title, then its cards. The focused row draws real
/// cards with the first one focused; the rest are drawn light, artwork and
/// labels only, which is all they show from here.
class _Row extends StatelessWidget {
  final HomeRow row;
  final String title;
  final _HomeFrame frame;
  final bool focused;

  const _Row({
    required this.row,
    required this.title,
    required this.frame,
    required this.focused,
  });

  static double _headerTop(_HomeFrame frame, HomeRow row) =>
      frame.isModern(row) || !frame.phone ? 6.0 : 16.0;

  static double _headerBottom(_HomeFrame frame, HomeRow row) =>
      frame.isModern(row) ? 1.0 : 8.0;

  static double _rowPadding(_HomeFrame frame) => 5.0 * frame.desktopScale;

  /// The line under a row's title. Home words a few rows' own; the rest
  /// carry theirs with them.
  static String? _subtitle(HomeRow row) =>
      _HomeFrame.isSquareRow(row) || (row.subtitle?.isEmpty ?? true)
      ? null
      : row.subtitle;

  /// How tall Home lays [row] out, from _staticRowHeight.
  static double extent(_HomeFrame frame, HomeRow row) {
    final cards = _HomeFrame.isSquareRow(row)
        ? frame.maxImageHeight(row) +
              frame.metadataHeight(row) +
              frame.headroom(row)
        : frame.maxImageHeight(row) +
              frame.metadataHeight(row) +
              frame.classicPadding(row) +
              10 * frame.desktopScale +
              frame.headroom(row);
    return cards +
        _headerTop(frame, row) +
        _headerBottom(frame, row) +
        20.0 * frame.desktopScale +
        (_subtitle(row) == null ? 0.0 : 18.0 * frame.desktopScale) +
        frame.modernTrailing(row);
  }

  /// Where the first card starts. A Modern row whose cards don't widen as
  /// focus glides along scrolls its leading inset out of view on TV and
  /// desktop.
  static double _leading(_HomeFrame frame, HomeRow row) =>
      !frame.phone &&
          frame.isModern(row) &&
          (row.isAudio || isHomeRowModernMyMediaStatic(row, frame.prefs))
      ? 0.0
      : 16.0;

  /// Home centres a Classic row's content in the room laid out for it, and
  /// sits a Modern one near the top of it.
  static double _extraTop(_HomeFrame frame, HomeRow row) {
    final content =
        frame.maxImageHeight(row) +
        frame.metadataHeight(row) +
        frame.classicPadding(row) +
        frame.headroom(row) +
        34 * frame.desktopScale;
    final spare = (extent(frame, row) - content).clamp(0.0, double.infinity);
    return frame.isModern(row) ? spare * 0.1 : spare / 2;
  }

  @override
  Widget build(BuildContext context) {
    final modern = frame.isModern(row);
    final carousel = frame.isCarousel(row) && row.items.isNotEmpty;
    final rowPadding = _rowPadding(frame);
    final topPadding = rowPadding + frame.headroom(row);
    final spacing = frame.spacing(row);
    final cards = <Widget>[];
    final leading = _leading(frame, row);
    var x = leading;
    final rightEdge = frame.size.width - frame.rowLeftInset;
    for (final (index, item) in row.items.indexed) {
      if (x > rightEdge) break;
      final isFocused = focused && index == 0;
      final image = frame.card(row, item, focused: isFocused);
      cards.add(
        Padding(
          padding: EdgeInsetsDirectional.only(end: spacing),
          child: focused
              ? _focusedRowCard(context, item, image, isFocused, x, rightEdge)
              : _LightCard(
                  item: item,
                  image: image,
                  classicLabel: !modern,
                  showLabel: !carousel,
                ),
        ),
      );
      x += image.width + spacing;
    }
    return SizedBox(
      height: extent(frame, row),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _extraTop(frame, row)),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              16,
              _headerTop(frame, row),
              8,
              _headerBottom(frame, row),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_subtitle(row) case final subtitle?) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.95),
                      fontWeight: FontWeight.w600,
                      shadows: const [
                        Shadow(blurRadius: 4, color: Colors.black54),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          // The cards run past the screen's edge and a focused card grows
          // past its row, as on Home.
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                leading,
                topPadding,
                0,
                rowPadding,
              ),
              child: OverflowBox(
                alignment: AlignmentDirectional.topStart,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: cards,
                ),
              ),
            ),
          ),
          if (carousel) ...[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 20),
              child: SizedBox(
                height: carouselPanelHeight(frame.desktopScale),
                child: frame.carouselPanel(row),
              ),
            ),
            SizedBox(height: frame.modernTrailing(row)),
          ],
        ],
      ),
    );
  }

  Widget _focusedRowCard(
    BuildContext context,
    AggregatedItem item,
    HomeRowCardImage image,
    bool isFocused,
    double left,
    double rightEdge,
  ) {
    final prefs = frame.prefs;
    final modern = frame.isModern(row);
    final subtitle = modern && isFocused && !row.isAudio
        ? homeRowModernMetadataLine(item)
        : item.subtitle;
    final carousel = frame.isCarousel(row);
    final card = MediaCard(
      title: carousel ? null : item.name,
      subtitle: subtitle,
      imageUrl: image.url,
      width: image.width,
      aspectRatio: image.aspectRatio,
      isBanner: image.aspectRatio == kBannerAspectRatio,
      classicHomeLabel: !modern,
      showLabel: !carousel,
      isFavorite: item.isFavorite,
      isPlayed: item.isPlayed,
      unplayedCount: prefs.get(UserPreferences.hideHomeUnwatchedCount)
          ? null
          : item.unplayedItemCount,
      playedPercentage: prefs.get(UserPreferences.hideHomeWatchProgress)
          ? null
          : item.playedPercentage,
      watchedBehavior: frame.value(UserPreferences.watchedIndicatorBehavior),
      itemType: item.type,
      seerrMediaType:
          showsMediaTypeBadges(
            frame.value(UserPreferences.mediaTypeBadgeBehavior),
            row.items,
          )
          ? item.seerrMediaType
          : null,
      seerrStatus: item.seerrStatus,
      focusColor: Color(
        previewValue(context, UserPreferences.focusColor).colorValue,
      ),
      cardFocusExpansion: modern ? false : frame.cardExpansion,
      externalIsFocused: isFocused,
      suppressFocusGlow: ThemeRegistry.active.borders.focusGlow.isNotEmpty,
    );
    // A focused title too long for its card scrolls on Home. Here it would
    // scroll for as long as the setting has focus, redrawing the preview
    // every frame, so it holds still.
    final still = TickerMode(enabled: false, child: card);
    if (!modern || !isFocused || carousel) return still;
    return ModernExpandingCard(
      card: still,
      prefs: prefs,
      details: ModernCardDetails(
        prefs: prefs,
        ratingSettings: UserPreferences.homeRowsRatings,
        cardWidth: image.width,
        detailsWidth: rightEdge - left - 16 - 20,
        overview: row.isAudio ? null : item.overview,
        communityRating: item.communityRating,
        criticRating: item.criticRating,
        personalRating: item.personalRating,
      ),
    );
  }
}

/// A card in a row below the focused one: artwork and labels at the size
/// Home draws them, without the badges, focus states and image layers of a
/// real card, which the preview would otherwise redraw on every frame of the
/// settings list's focus animation.
class _LightCard extends StatelessWidget {
  final AggregatedItem item;
  final HomeRowCardImage image;
  final bool classicLabel;
  final bool showLabel;

  const _LightCard({
    required this.item,
    required this.image,
    required this.classicLabel,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    final base =
        Theme.of(context).textTheme.bodySmall ?? const TextStyle(fontSize: 12);
    const shadows = [Shadow(blurRadius: 4, color: Colors.black54)];
    final titleStyle = base.copyWith(
      color: AppColorScheme.onSurface,
      fontWeight: classicLabel ? FontWeight.w600 : FontWeight.bold,
      fontSize: classicLabel ? tvPx(22) : (base.fontSize ?? 12) + 1,
      height: classicLabel ? 30 / 22 : null,
      shadows: shadows,
    );
    final subtitleStyle = base.copyWith(
      color: Theme.of(context).colorScheme.onSurface
          .withValues(alpha: classicLabel ? 0.65 : 0.6),
      fontSize: classicLabel ? tvPx(20) : null,
      fontWeight: classicLabel ? FontWeight.w400 : null,
      height: classicLabel ? 28 / 20 : null,
      shadows: shadows,
    );
    final url = image.url;
    final height = image.width / image.aspectRatio;
    final contain = item.type == 'Studio' || item.type == 'Network';
    return SizedBox(
      width: image.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: AppRadius.circular(8),
            child: SizedBox(
              width: image.width,
              height: height,
              child: url == null
                  ? ColoredBox(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.1),
                    )
                  : BoundedNetworkImage(
                      imageUrl: url,
                      fit: contain ? BoxFit.contain : BoxFit.cover,
                      fadeInDuration: Duration.zero,
                      maxWidth: MediaCard.decodeMaxWidthFor(image.aspectRatio),
                    ),
            ),
          ),
          if (showLabel) ...[
            SizedBox(height: classicLabel ? tvPx(16) : 6),
            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: titleStyle,
            ),
            if (item.subtitle case final subtitle? when subtitle.isNotEmpty)
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: subtitleStyle,
              ),
          ],
        ],
      ),
    );
  }
}
