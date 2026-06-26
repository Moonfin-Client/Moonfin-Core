import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:jellyfin_preference/jellyfin_preference.dart';
import 'package:server_core/server_core.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../../../l10n/app_localizations.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import 'settings_app_bar.dart';
import '../../widgets/focus/request_initial_focus.dart';

const _allSources = [
  'tomatoes',
  'tomatoes_audience',
  'imdb',
  'tmdb',
  'metacritic',
  'metacriticuser',
  'trakt',
  'letterboxd',
  'myanimelist',
  'anilist',
  'stars',
];

class _RatingItem {
  final String key;
  bool enabled;

  _RatingItem({required this.key, required this.enabled});
}

class RatingsConfigScreen extends StatefulWidget {
  const RatingsConfigScreen({super.key});

  @override
  State<RatingsConfigScreen> createState() => _RatingsConfigScreenState();
}

class _RatingsConfigScreenState extends State<RatingsConfigScreen> {
  String _sourceLabel(String key, AppLocalizations l10n) => switch (key) {
    'tomatoes' => l10n.rottenTomatoesCritics,
    'tomatoes_audience' => l10n.rottenTomatoesAudience,
    'imdb' => l10n.imdb,
    'tmdb' => l10n.tmdb,
    'metacritic' => l10n.metacritic,
    'metacriticuser' => l10n.metacriticUser,
    'trakt' => l10n.trakt,
    'letterboxd' => l10n.letterboxd,
    'myanimelist' => l10n.myAnimeList,
    'anilist' => l10n.aniList,
    'stars' => l10n.communityRating,
    _ => key,
  };

  final _store = GetIt.instance<PreferenceStore>();
  final _prefs = GetIt.instance<UserPreferences>();
  String _lastEnabledRatingsCsv = '';
  late List<_RatingItem> _items;
  final _focusNodes = <FocusNode>[];
  final _restoreFocusNode = FocusNode(debugLabel: 'ratings_restore');

  @override
  void initState() {
    super.initState();
    _loadFromPrefs();
    _prefs.addListener(_onPrefsChanged);
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPrefsChanged);
    for (final n in _focusNodes) {
      n.dispose();
    }
    _restoreFocusNode.dispose();
    super.dispose();
  }

  void _onPrefsChanged() {
    if (!mounted) return;
    final currentCsv = _store.get(UserPreferences.enabledRatings);
    if (currentCsv == _lastEnabledRatingsCsv) return;
    setState(_loadFromPrefs);
  }

  void _loadFromPrefs() {
    final csv = _store.get(UserPreferences.enabledRatings);
    _lastEnabledRatingsCsv = csv;
    final enabled = csv.split(',').where((s) => s.isNotEmpty).toList();

    final items = <_RatingItem>[];
    for (final key in enabled) {
      if (_allSources.contains(key)) {
        items.add(_RatingItem(key: key, enabled: true));
      }
    }
    final addedKeys = items.map((i) => i.key).toSet();
    for (final key in _allSources) {
      if (!addedKeys.contains(key)) {
        items.add(_RatingItem(key: key, enabled: false));
      }
    }
    _items = items;
    _rebuildFocusNodes();
  }

  void _rebuildFocusNodes() {
    for (final n in _focusNodes) {
      n.dispose();
    }
    _focusNodes.clear();
    for (var i = 0; i < _items.length; i++) {
      _focusNodes.add(FocusNode(debugLabel: 'rating_$i'));
    }
  }

  void _save() {
    final csv = _items.where((i) => i.enabled).map((i) => i.key).join(',');
    // Keep local ordering/focus stable for in-screen edits; external updates
    // still refresh via _onPrefsChanged when the stored CSV differs.
    _lastEnabledRatingsCsv = csv;
    _store.set(UserPreferences.enabledRatings, csv);

    final syncService = GetIt.instance<PluginSyncService>();
    if (syncService.pluginAvailable) {
      final client = GetIt.instance<MediaServerClient>();
      syncService.pushSettings(client);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return withCleanSettingsTypography(
      context,
      RequestInitialFocus(
        targetNode: PlatformDetection.isTV
            ? (_items.isNotEmpty ? _focusNodes[0] : _restoreFocusNode)
            : null,
        child: Scaffold(
          appBar: buildSettingsAppBar(
            context,
            Text(l10n.ratings),
            actions: [
              IconButton(
                focusNode: _restoreFocusNode,
                style: IconButton.styleFrom(
                  focusColor: AppColorScheme.accent.withValues(alpha: 0.18),
                ),
                icon: const Icon(Icons.restore),
                tooltip: l10n.resetToDefaults,
                onPressed: () {
                  setState(() {
                    _store.set(
                      UserPreferences.enabledRatings,
                      UserPreferences.enabledRatings.defaultValue,
                    );
                    _loadFromPrefs();
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
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return ListTile(
      leading: const Icon(Icons.reorder),
      title: Text(l10n.ratingSources),
      subtitle: Text(l10n.ratingSourcesDescription),
    );
  }

  Widget _buildReorderableList(AppLocalizations l10n) {
    return ListView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      children: [
        _buildHeader(l10n),
        ReorderableListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) newIndex--;
            _moveItemTo(oldIndex, newIndex);
          },
          itemBuilder: (context, index) {
            final item = _items[index];
            return _ReorderableTile(
              key: ValueKey(item.key),
              focusNode: _focusNodes[index],
              label: _sourceLabel(item.key, l10n),
              enabled: item.enabled,
              isFirst: index == 0,
              isLast: index == _items.length - 1,
              trailing: ReorderableDragStartListener(
                index: index,
                child: Icon(
                  Icons.drag_handle,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              onToggle: (enabled) {
                setState(() => item.enabled = enabled);
                _save();
              },
              onMoveUp: () => _moveItemTo(index, index - 1),
              onMoveDown: () => _moveItemTo(index, index + 1),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTvList(AppLocalizations l10n) {
    return ListView.builder(
      itemCount: _items.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildHeader(l10n);
        }
        final itemIndex = index - 1;
        final item = _items[itemIndex];
        return _ReorderableTile(
          key: ValueKey(item.key),
          focusNode: _focusNodes[itemIndex],
          label: _sourceLabel(item.key, l10n),
          enabled: item.enabled,
          isFirst: itemIndex == 0,
          isLast: itemIndex == _items.length - 1,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (itemIndex != 0) const Icon(Icons.arrow_left, size: 18),
              if (itemIndex != _items.length - 1)
                const Icon(Icons.arrow_right, size: 18),
            ],
          ),
          onToggle: (enabled) {
            setState(() => item.enabled = enabled);
            _save();
          },
          onMoveUp: () => _moveItemTo(itemIndex, itemIndex - 1),
          onMoveDown: () => _moveItemTo(itemIndex, itemIndex + 1),
        );
      },
    );
  }

  void _moveItemTo(int index, int newIndex) {
    if (newIndex < 0 || newIndex >= _items.length || index == newIndex) return;
    setState(() {
      final item = _items.removeAt(index);
      _items.insert(newIndex, item);
      final node = _focusNodes.removeAt(index);
      _focusNodes.insert(newIndex, node);
    });
    _save();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNodes[newIndex].requestFocus();
      }
    });
  }
}

class _ReorderableTile extends StatefulWidget {
  final FocusNode focusNode;
  final String label;
  final bool enabled;
  final bool isFirst;
  final bool isLast;
  final Widget? trailing;
  final ValueChanged<bool> onToggle;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  const _ReorderableTile({
    super.key,
    required this.focusNode,
    required this.label,
    required this.enabled,
    required this.isFirst,
    required this.isLast,
    this.trailing,
    required this.onToggle,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  @override
  State<_ReorderableTile> createState() => _ReorderableTileState();
}

class _ReorderableTileState extends State<_ReorderableTile> {
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focused = widget.focusNode.hasFocus;
  }

  @override
  void didUpdateWidget(covariant _ReorderableTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final hasFocus = widget.focusNode.hasFocus;
    if (_focused != hasFocus) {
      _focused = hasFocus;
    }
  }

  void _ensureFocusedTileVisible() {
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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bg = _focused
        ? colorScheme.primary.withValues(alpha: 0.18)
        : Colors.transparent;

    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (f) {
        if (_focused != f && mounted) {
          setState(() => _focused = f);
        }
        if (f) {
          _ensureFocusedTileVisible();
        }
      },
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) return KeyEventResult.ignored;
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
            !widget.isFirst) {
          widget.onMoveUp();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
            !widget.isLast) {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        color: bg,
        child: ListTile(
          onTap: () => widget.onToggle(!widget.enabled),
          leading: Icon(
            widget.enabled ? Icons.check_box : Icons.check_box_outline_blank,
            color: widget.enabled ? colorScheme.primary : null,
          ),
          title: Text(widget.label),
          trailing: widget.trailing,
        ),
      ),
    );
  }
}
