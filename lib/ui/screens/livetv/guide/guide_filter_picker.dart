import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../util/focus/dpad_keys.dart';
import '../../../../util/platform_detection.dart';
import '../../../widgets/local_search_field.dart';

typedef GuideFilterChoice = (GuideFilter, String?);

class GuideFilterPicker extends StatefulWidget {
  const GuideFilterPicker({
    super.key,
    required this.vm,
    required this.includeCategories,
    required this.filterLabel,
    required this.sidePanel,
  });

  final LiveTvGuideViewModel vm;
  final bool includeCategories;
  final String Function(GuideFilter) filterLabel;
  final bool sidePanel;

  @override
  State<GuideFilterPicker> createState() => _GuideFilterPickerState();
}

typedef _Row = ({
  String label,
  GuideFilterChoice? choice,
  IconData? icon,
  int? count,
});

class _GuideFilterPickerState extends State<GuideFilterPicker> {
  final _searchFieldKey = GlobalKey();
  final _search = TextEditingController();
  final _searchFocus = FocusNode();
  ScrollController? _scroll;
  String _query = '';

  GuideFilterChoice get _selected =>
      (widget.vm.filter, widget.vm.selectedGroup);

  List<_Row> _rows(AppLocalizations l10n) {
    final rows = <_Row>[];
    bool matches(String label) => label.toLowerCase().contains(_query);
    void addFilter(GuideFilter filter, String label, IconData icon) {
      if (matches(label)) {
        rows.add((
          label: label,
          choice: (filter, null),
          icon: icon,
          count: null,
        ));
      }
    }

    void header(String label) =>
        rows.add((label: label, choice: null, icon: null, count: null));

    addFilter(GuideFilter.all, l10n.guideAllChannels, Icons.live_tv);
    addFilter(GuideFilter.favorites, l10n.favorites, Icons.star_outline);
    final groups = widget.vm.availableGroups.where(matches);
    if (groups.isNotEmpty) header(l10n.liveTvChannelGroups);
    for (final group in groups) {
      rows.add((
        label: group,
        choice: (GuideFilter.all, group),
        icon: Icons.folder_outlined,
        count: widget.vm.channelCountForGroup(group),
      ));
    }
    if (widget.includeCategories) {
      final filters = widget.vm.availableProgrammeCategories.where(
        (filter) => matches(widget.filterLabel(filter)),
      );
      if (filters.isNotEmpty) header(l10n.liveTvProgrammeCategories);
      for (final filter in filters) {
        addFilter(filter, widget.filterLabel(filter), switch (filter) {
          GuideFilter.movies => Icons.movie_outlined,
          GuideFilter.series => Icons.tv,
          GuideFilter.sports => Icons.sports_soccer,
          GuideFilter.news => Icons.newspaper,
          GuideFilter.kids => Icons.child_care,
          GuideFilter.premiere => Icons.new_releases_outlined,
          _ => Icons.live_tv,
        });
      }
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
    return Focus(
      canRequestFocus: false,
      onKeyEvent: (_, event) {
        if (event.isActionable &&
            event.logicalKey.isBackKey &&
            !(event.logicalKey == LogicalKeyboardKey.backspace &&
                _searchFocus.hasFocus)) {
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
                              l10n.guideBrowse,
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
                      final rows = _rows(l10n);
                      final rowHeight =
                          MediaQuery.textScalerOf(context).scale(20) + 36;
                      final selected = rows.indexWhere(
                        (row) => row.choice == _selected,
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
                        itemCount: rows.length,
                        itemExtent: rowHeight,
                        itemBuilder: (context, index) {
                          final row = rows[index];
                          final choice = row.choice;
                          if (choice == null) {
                            return Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                row.label,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            );
                          }
                          final active = choice == _selected;
                          return ListTile(
                            key: ValueKey(choice),
                            autofocus:
                                widget.sidePanel && active && _query.isEmpty,
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
                            leading: Icon(row.icon),
                            title: Text(
                              row.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (row.count != null) Text('${row.count}'),
                                if (active) const Icon(Icons.check),
                              ],
                            ),
                            onTap: () => Navigator.of(context).pop(choice),
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
                        _remoteHint(l10n.back, l10n.close),
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
