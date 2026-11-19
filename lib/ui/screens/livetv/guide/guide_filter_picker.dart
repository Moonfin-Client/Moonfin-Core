import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart' show ChannelGroupSource;

import '../../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../util/focus/dpad_keys.dart';
import '../../../../util/platform_detection.dart';
import '../../../../util/focus/key_event_utils.dart';
import '../../../widgets/local_search_field.dart';
import '../../../widgets/overlay_sheet.dart';

export '../../../../data/viewmodels/live_tv_guide_view_model.dart'
    show GuideFilterChoice;

typedef _RowId = (GuideFilterChoice, bool);

String guideGroupLabel(
  LiveTvGuideViewModel vm,
  String group,
  AppLocalizations l10n,
) => switch (vm.sourceForGroup(group)) {
  ChannelGroupSource.dvr => l10n.guideDvrChannels,
  ChannelGroupSource.plexFreeTv => l10n.guidePlexFreeTv,
  null => group,
};

class GuideFilterPicker extends StatefulWidget {
  const GuideFilterPicker({
    super.key,
    required this.vm,
    required this.includeCategories,
    required this.filterLabel,
    required this.sidePanel,
    this.onRightClose,
  });

  final LiveTvGuideViewModel vm;
  final bool includeCategories;
  final String Function(GuideFilter) filterLabel;
  final bool sidePanel;
  final VoidCallback? onRightClose;

  @override
  State<GuideFilterPicker> createState() => _GuideFilterPickerState();
}

typedef _Row = ({String label, _RowId? id, IconData? icon, int? count});

class _GuideFilterPickerState extends State<GuideFilterPicker> {
  final _searchFieldKey = GlobalKey();
  final _search = TextEditingController();
  final _searchFocus = FocusNode();
  final _nodes = <_RowId, FocusNode>{};
  final _focusedRow = ValueNotifier<_RowId?>(null);
  final _hold = FocusedKeyHold();
  ScrollController? _scroll;
  String _query = '';
  List<_Row> _visibleRows = const [];

  GuideFilterChoice get _selected =>
      (widget.vm.filter, widget.vm.selectedGroup);

  @override
  void initState() {
    super.initState();
    if (!PlatformDetection.isTV || !widget.sidePanel) return;
    // The TV route observer can give Search focus before the list lays out.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || ModalRoute.isCurrentOf(context) != true) return;
      final active = _visibleRows
          .where((row) => row.id?.$1 == _selected)
          .firstOrNull
          ?.id;
      if (active != null) _focusRow(active);
    });
  }

  List<GuideFilterChoice> get _saved => widget.vm.availableSavedFilters(
    includeCategories: widget.includeCategories,
  );

  void _focusRow(_RowId id) {
    final index = _visibleRows.indexWhere((row) => row.id == id);
    final scroll = _scroll;
    if (index < 0 || scroll == null || !scroll.hasClients) return;
    final height = _rowHeight;
    final top = index * height;
    final position = scroll.position;
    final visibleRoom = (position.viewportDimension - height).clamp(
      0.0,
      double.infinity,
    );
    final offset = position.pixels
        .clamp(top - visibleRoom, top)
        .clamp(0.0, position.maxScrollExtent);
    if (position.pixels != offset) scroll.jumpTo(offset);
    // Lazy rows beyond the old viewport attach during the next layout.
    final node = _nodes.putIfAbsent(id, FocusNode.new);
    node.requestFocus();
  }

  double get _rowHeight => MediaQuery.textScalerOf(context).scale(20) + 36;

  Future<void> _toggle(_RowId id) async {
    final (choice, savedCopy) = id;
    final restore = PlatformDetection.isTV && _nodes[id]?.hasFocus == true;
    var target = id;
    if (restore && savedCopy) {
      final saved = _saved;
      final index = saved.indexOf(choice);
      if (index < 0) return;
      if (saved.length == 1) {
        target = (choice, false);
      } else {
        final neighbor = index == saved.length - 1 ? index - 1 : index + 1;
        target = (saved[neighbor], true);
      }
    }
    try {
      await widget.vm.toggleSavedFilter(choice);
    } catch (error) {
      debugPrint('Could not save guide favorites (${error.runtimeType})');
      return;
    }
    if (!mounted || !restore || _query.isNotEmpty) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || ModalRoute.isCurrentOf(context) != true) return;
      final focused = _focusedRow.value;
      if (_searchFocus.hasFocus || (focused != null && focused != id)) return;
      _focusRow(target);
    });
    WidgetsBinding.instance.scheduleFrame();
  }

  List<_Row> _rows(AppLocalizations l10n, Set<GuideFilterChoice> saved) {
    final rows = <_Row>[];
    void section(String label) =>
        rows.add((label: label, id: null, icon: null, count: null));

    void add(GuideFilterChoice choice, {bool savedCopy = false}) {
      final (filter, group) = choice;
      final label = group != null
          ? guideGroupLabel(widget.vm, group, l10n)
          : (filter == GuideFilter.all
                ? l10n.guideAllChannels
                : widget.filterLabel(filter));
      if (!label.toLowerCase().contains(_query)) return;
      rows.add((
        id: (choice, savedCopy),
        label: label,
        icon: group != null
            ? Icons.folder_outlined
            : switch (filter) {
                GuideFilter.movies => Icons.movie_outlined,
                GuideFilter.series => Icons.tv,
                GuideFilter.sports => Icons.sports_soccer,
                GuideFilter.news => Icons.newspaper,
                GuideFilter.kids => Icons.child_care,
                GuideFilter.premiere => Icons.new_releases_outlined,
                GuideFilter.favorites => Icons.favorite_border,
                GuideFilter.all => Icons.live_tv,
              },
        count: group == null ? null : widget.vm.channelCountForGroup(group),
      ));
    }

    add((GuideFilter.all, null));
    add((GuideFilter.favorites, null));
    if (_query.isEmpty && saved.isNotEmpty) {
      section(l10n.guideFavoriteGroupsAndCategories);
      for (final choice in saved) {
        add(choice, savedCopy: true);
      }
    }
    void addSection(String title, Iterable<GuideFilterChoice> choices) {
      final start = rows.length;
      section(title);
      for (final choice in choices) {
        add(choice);
      }
      if (rows.length == start + 1) rows.removeLast();
    }

    addSection(
      l10n.liveTvChannelGroups,
      widget.vm.availableGroups.map((g) => (GuideFilter.all, g)),
    );
    if (widget.includeCategories) {
      addSection(
        l10n.liveTvProgrammeCategories,
        widget.vm.availableProgrammeCategories.map((f) => (f, null)),
      );
    }
    return rows;
  }

  Widget _remoteHint(String key, String action) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      DecoratedBox(
        decoration: BoxDecoration(
          color: AppColorScheme.onSurface.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: Text(key),
        ),
      ),
      const SizedBox(width: 6),
      Text(action),
    ],
  );

  @override
  void dispose() {
    _scroll?.dispose();
    _search.dispose();
    _searchFocus.dispose();
    _hold.dispose();
    _focusedRow.dispose();
    for (final node in _nodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final keyboard = MediaQuery.viewInsetsOf(context).bottom;
    final compact =
        !widget.sidePanel &&
        keyboard > 0 &&
        MediaQuery.sizeOf(context).height - keyboard < 240;
    final search = LocalSearchField(
      key: _searchFieldKey,
      controller: _search,
      focusNode: _searchFocus,
      hint: widget.includeCategories
          ? l10n.guideSearchGroupsAndCategories
          : l10n.guideSearchGroups,
      onChanged: (value) {
        setState(() => _query = value.trim().toLowerCase());
        if (_scroll?.hasClients == true) _scroll!.jumpTo(0);
      },
    );
    final closeOnBack = createDialogBackCloseHandler(context);
    return Focus(
      canRequestFocus: false,
      onKeyEvent: (_, event) {
        final id = _focusedRow.value;
        if (PlatformDetection.isTV &&
            id != null &&
            _nodes[id]?.hasFocus == true) {
          bool stillFocused(_RowId? row) =>
              mounted &&
              ModalRoute.isCurrentOf(context) == true &&
              _nodes[row]?.hasFocus == true;
          if (event.isActionable && event.logicalKey.isUpKey) {
            final previous = _visibleRows
                .takeWhile((row) => row.id != id)
                .map((row) => row.id)
                .nonNulls
                .lastOrNull;
            if (previous == null) {
              _searchFocus.requestFocus();
            } else {
              _focusRow(previous);
            }
            return KeyEventResult.handled;
          }
          if (event.logicalKey.isSelectKey && id.$1.canFavorite) {
            return _hold.start(
              event,
              stillFocused: () => stillFocused(id),
              onTap: () => Navigator.of(context).pop(id.$1),
              onHold: () => unawaited(_toggle(id)),
            );
          }
        }
        if (event.isActionable &&
            event.logicalKey.isBackKey &&
            !(event.logicalKey == LogicalKeyboardKey.backspace &&
                _searchFocus.hasFocus)) {
          closeOnBack();
          return KeyEventResult.handled;
        }
        if (widget.sidePanel &&
            (PlatformDetection.isTV || !_searchFocus.hasFocus) &&
            event is KeyDownEvent &&
            event.logicalKey.isRightKey) {
          widget.onRightClose?.call();
          Navigator.of(context).pop();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Material(
        color: AppColorScheme.surface,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              12,
              8,
              12,
              (compact ? 0 : 8) + keyboard,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    if (!widget.sidePanel) const BackButton(),
                    Expanded(
                      child: compact
                          ? search
                          : Text(
                              l10n.filters,
                              style: Theme.of(context).textTheme.titleLarge,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                  ],
                ),
                if (!compact) ...[
                  const SizedBox(height: 8),
                  search,
                  const SizedBox(height: 8),
                ],
                Expanded(
                  child: ListenableBuilder(
                    listenable: widget.vm,
                    builder: (context, _) {
                      final saved = _saved.toSet();
                      final rows = _visibleRows = _rows(l10n, saved);
                      final rowHeight = _rowHeight;
                      final indices = {
                        for (var i = 0; i < rows.length; i++)
                          if (rows[i].id != null) rows[i].id!: i,
                      };
                      final selected = rows.indexWhere(
                        (row) => row.id?.$1 == _selected,
                      );
                      _scroll ??= ScrollController(
                        initialScrollOffset: selected > 2
                            ? (selected - 2) * rowHeight
                            : 0,
                      );
                      if (rows.isEmpty) {
                        return Center(child: Text(l10n.noResults));
                      }
                      return ListView.builder(
                        controller: _scroll,
                        findChildIndexCallback: (key) =>
                            key is ValueKey<_RowId> ? indices[key.value] : null,
                        itemCount: rows.length,
                        itemExtent: rowHeight,
                        itemBuilder: (context, index) {
                          final row = rows[index];
                          final id = row.id;
                          if (id == null) {
                            return Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                row.label,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            );
                          }
                          final choice = id.$1;
                          final active = choice == _selected;
                          return ListTile(
                            key: ValueKey(id),
                            focusNode: _nodes.putIfAbsent(id, FocusNode.new),
                            onFocusChange: (focused) {
                              if (focused) {
                                _focusedRow.value = id;
                              } else if (_focusedRow.value == id) {
                                _focusedRow.value = null;
                              }
                            },
                            autofocus:
                                widget.sidePanel &&
                                index == selected &&
                                _query.isEmpty,
                            selected: active,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusColor: AppColorScheme.accent.withValues(
                              alpha: 0.32,
                            ),
                            selectedColor: widget.sidePanel
                                ? AppColorScheme.accent
                                : Colors.black,
                            selectedTileColor: widget.sidePanel
                                ? null
                                : AppColorScheme.accent,
                            leading: Icon(
                              row.icon,
                              color: choice.$1 == GuideFilter.favorites
                                  ? AppColorScheme.onSurface
                                  : null,
                            ),
                            title: Text(
                              row.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (saved.contains(choice))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(end: 4),
                                    child: Icon(
                                      Icons.favorite,
                                      semanticLabel: l10n.favorited,
                                      size: 12,
                                      color: AppColors.red500,
                                    ),
                                  ),
                                if (row.count != null) Text('${row.count}'),
                                if (active) const Icon(Icons.check),
                              ],
                            ),
                            onTap: () => Navigator.of(context).pop(choice),
                            onLongPress: choice.canFavorite
                                ? () => _toggle(id)
                                : null,
                          );
                        },
                      );
                    },
                  ),
                ),
                if (PlatformDetection.isTV)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Wrap(
                      spacing: 16,
                      children: [
                        _remoteHint(l10n.ok, l10n.select),
                        if (widget.sidePanel) _remoteHint('→', l10n.close),
                        ListenableBuilder(
                          listenable: Listenable.merge([
                            _focusedRow,
                            widget.vm,
                          ]),
                          builder: (context, _) {
                            final choice = _focusedRow.value?.$1;
                            if (choice == null || !choice.canFavorite) {
                              return const SizedBox.shrink();
                            }
                            return _remoteHint(
                              l10n.guideHoldOk,
                              _saved.contains(choice)
                                  ? l10n.guideUnfavorite
                                  : l10n.favorite,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
