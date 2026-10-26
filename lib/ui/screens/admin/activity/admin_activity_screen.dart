import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../navigation/destinations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../../../../data/services/socket_handler.dart';
import '../../../widgets/adaptive/adaptive_dialog.dart';
import '../../detail/modern/widgets/details_tab_bar.dart';
import '../admin_nav.dart';
import '../widgets/activity_log_ui.dart';
import '../widgets/admin_form_styles.dart';

enum _ActivityFilter { all, user, system }

class AdminActivityScreen extends StatefulWidget {
  /// The starting view: true for user entries, false for system entries, null
  /// for all.
  final bool? userActivity;

  const AdminActivityScreen({super.key, this.userActivity});

  @override
  State<AdminActivityScreen> createState() => _AdminActivityScreenState();
}

class _AdminActivityScreenState extends State<AdminActivityScreen> {
  final List<ActivityLogEntry> _entries = [];
  final ScrollController _scrollController = ScrollController();
  late _ActivityFilter _filter = switch (widget.userActivity) {
    null => _ActivityFilter.all,
    true => _ActivityFilter.user,
    false => _ActivityFilter.system,
  };
  DateTimeRange? _dateRange;
  String? _severityFilter;
  String? _userFilter;
  Map<String, String> _userNames = const {};
  final _lookedUp = <String>{};
  late final _isEmby = AdminServerScope.isEmby(context);
  bool _isLoading = false;
  bool _hasMore = true;
  int _totalCount = 0;
  String? _error;
  StreamSubscription<ServerWebSocketMessage>? _socketSubscription;
  final _tabFocusNodes = <int, FocusNode>{};

  static const _pageSize = 25;

  FocusNode _tabNode(int index) => _tabFocusNodes.putIfAbsent(
      index, () => FocusNode(debugLabel: 'admin_activity_tab_$index'));

  MediaServerClient get _client => GetIt.instance<MediaServerClient>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    final socket = GetIt.instance<SocketHandler>();
    // The server only pushes ActivityLogEntry to sockets that asked for it.
    socket.subscribe('ActivityLogEntry');
    // Jellyfin's first push repeats what _loadPage fetches, so only later ones
    // reload. Every Emby push is a new entry.
    var primed = false;
    _socketSubscription = socket.events.listen((event) {
      switch (event) {
        case ServerEventMessage(:final type) when type == 'ActivityLogEntry':
          if (primed || _isEmby) _refresh();
          primed = true;
        default:
          break;
      }
    });
    // On Emby, _resolveUserNames names the users instead.
    if (!_isEmby) _loadUsers();
    _loadPage();
  }

  @override
  void dispose() {
    _socketSubscription?.cancel();
    GetIt.instance<SocketHandler>().unsubscribe('ActivityLogEntry');
    _scrollController.dispose();
    for (final node in _tabFocusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  /// Names for the user column and filter.
  Future<void> _loadUsers() async {
    try {
      final users = await _client.adminUsersApi.getUsers();
      if (!mounted) return;
      setState(() => _userNames = {
            for (final user in users)
              if (user.name != null) user.id: user.name!,
          });
    } catch (_) {
      // The list still works without names.
    }
  }

  /// Emby's entries carry its internal user number, which the user list
  /// doesn't have, but the user endpoint accepts. Each is looked up once.
  Future<void> _resolveUserNames(List<ActivityLogEntry> entries) async {
    for (final id in {for (final e in entries) ?e.userId}) {
      if (!_lookedUp.add(id)) continue;
      try {
        final user = await _client.adminUsersApi.getUserById(id);
        if (!mounted) return;
        final name = user.name;
        if (name != null) {
          setState(() => _userNames = {..._userNames, id: name});
        }
      } catch (_) {
        // The entry just shows without a name.
      }
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMore) {
      _loadPage();
    }
  }

  Future<void> _loadPage() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final range = _dateRange;
    try {
      // Every filter goes to the server, so paging walks the filtered rows.
      final result = await _client.adminSystemApi.getActivityLog(
        startIndex: _entries.length,
        limit: _pageSize,
        hasUserId: _filter == _ActivityFilter.all
            ? null
            : _filter == _ActivityFilter.user,
        minDate: range == null
            ? null
            : DateTime(range.start.year, range.start.month, range.start.day),
        maxDate: range == null
            ? null
            : DateTime(range.end.year, range.end.month, range.end.day, 23, 59, 59),
        severity: _severityFilter,
        username: _filter == _ActivityFilter.system ? null : _userFilter,
      );
      if (!mounted) return;
      setState(() {
        _entries.addAll(result.items);
        _totalCount = result.totalRecordCount;
        _hasMore = _entries.length < _totalCount;
        _isLoading = false;
      });
      if (_isEmby) _resolveUserNames(result.items);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = describeError(e, AppLocalizations.of(context));
        _isLoading = false;
      });
    }
  }

  /// Applies a filter change and loads again from the first row.
  void _reload(VoidCallback change) {
    setState(() {
      change();
      _entries.clear();
      _hasMore = true;
      _totalCount = 0;
    });
    _loadPage();
  }

  void _changeFilter(_ActivityFilter filter) {
    if (filter == _filter) return;
    _reload(() => _filter = filter);
  }

  Future<void> _refresh() async {
    setState(() {
      _entries.clear();
      _hasMore = true;
      _totalCount = 0;
    });
    await _loadPage();
  }

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 1),
      initialDateRange: _dateRange,
    );
    if (picked == null) {
      return;
    }
    _reload(() => _dateRange = picked);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: adminScreenHeader(
            context,
            title: l10n.adminDrawerActivity,
            icon: Icons.history,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DetailsTabBar(
            segmented: true,
            wrap: true,
            labels: _ActivityFilter.values.map(_filterLabel).toList(),
            selectedIndex: _filter.index,
            onSelect: (i) => _changeFilter(_ActivityFilter.values[i]),
            focusNodeFor: _tabNode,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // Emby filters by start date only, with no end date, severity or
              // user, so these would mislead.
              if (!_isEmby) ...[
                FilterChip(
                  selected: _dateRange != null,
                  label: Text(
                    _dateRange == null
                        ? l10n.adminActivityDateRange
                        : '${_dateRange!.start.month}/${_dateRange!.start.day} - ${_dateRange!.end.month}/${_dateRange!.end.day}',
                  ),
                  onSelected: (_) => _pickDateRange(),
                ),
                if (_dateRange != null)
                  ActionChip(
                    label: Text(l10n.adminClearDates),
                    onPressed: () => _reload(() => _dateRange = null),
                  ),
                _buildSeverityFilter(l10n),
                // System entries have no user, so that view has no user
                // filter.
                if (_filter != _ActivityFilter.system) _buildUserFilter(l10n),
              ],
              if (_totalCount > 0)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    l10n.adminActivityCount('${_entries.length}', '$_totalCount'),
                    style: theme.textTheme.bodySmall,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(child: _buildBody(theme, l10n)),
      ],
    );
  }

  Widget _buildBody(ThemeData theme, AppLocalizations l10n) {
    if (_entries.isEmpty && _isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_entries.isEmpty && _error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminActivityLoadFailed(_error ?? '')),
            const SizedBox(height: 8),
            FilledButton.tonal(
              onPressed: _refresh,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_entries.isEmpty) {
      return Center(child: Text(l10n.adminNoActivityEntries));
    }

    final showUser = _filter != _ActivityFilter.system;
    final listItems = buildActivityListItems(_entries, l10n);
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: 16),
        itemCount: listItems.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= listItems.length) {
            // A tall window shows the loader without any scrolling, so the
            // scroll listener alone never asks for the next page.
            if (!_isLoading && _hasMore && _error == null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) _loadPage();
              });
            }
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final item = listItems[index];
          if (item is String) {
            return _DateHeader(label: item);
          }
          final entry = item as ActivityLogEntry;
          final isFirst = index == 0 || listItems[index - 1] is String;
          final isLast = index + 1 >= listItems.length ||
              listItems[index + 1] is String;
          return _ActivityTile(
            entry: entry,
            userName: showUser ? _userNames[entry.userId] : null,
            isFirst: isFirst,
            isLast: isLast,
          );
        },
      ),
    );
  }

  String _filterLabel(_ActivityFilter f) {
    final l10n = AppLocalizations.of(context);
    switch (f) {
      case _ActivityFilter.all:
        return l10n.all;
      case _ActivityFilter.user:
        return l10n.userActivity;
      case _ActivityFilter.system:
        return l10n.systemEvents;
    }
  }

  /// Offers every LogLevel, not only the ones in the loaded rows.
  Widget _buildSeverityFilter(AppLocalizations l10n) {
    final theme = Theme.of(context);
    return PopupMenuButton<String?>(
      initialValue: _severityFilter,
      onSelected: (value) => _reload(() => _severityFilter = value),
      itemBuilder: (context) => [
        PopupMenuItem<String?>(
          value: null,
          onTap: () => _reload(() => _severityFilter = null),
          child: Text(l10n.adminActivitySeverityAll),
        ),
        for (final s in activitySeverities)
          PopupMenuItem<String?>(
            value: s,
            child: Text(activitySeverityLabel(s, l10n)),
          ),
      ],
      child: Chip(
        avatar: const Icon(Icons.filter_list, size: 18),
        label: Text(_severityFilter == null
            ? l10n.adminActivitySeverityAll
            : activitySeverityLabel(_severityFilter!, l10n)),
        backgroundColor:
            _severityFilter == null ? null : theme.colorScheme.secondaryContainer,
      ),
    );
  }

  Widget _buildUserFilter(AppLocalizations l10n) {
    final theme = Theme.of(context);
    final names = _userNames.values.toSet().toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return PopupMenuButton<String?>(
      initialValue: _userFilter,
      onSelected: (value) => _reload(() => _userFilter = value),
      itemBuilder: (context) => [
        PopupMenuItem<String?>(
          value: null,
          onTap: () => _reload(() => _userFilter = null),
          child: Text(l10n.adminActivityAllUsers),
        ),
        for (final name in names)
          PopupMenuItem<String?>(value: name, child: Text(name)),
      ],
      child: Chip(
        avatar: const Icon(Icons.person_outline, size: 18),
        label: Text(_userFilter ?? l10n.adminActivityAllUsers),
        backgroundColor:
            _userFilter == null ? null : theme.colorScheme.secondaryContainer,
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final ActivityLogEntry entry;
  final String? userName;
  final bool isFirst;
  final bool isLast;
  const _ActivityTile({
    required this.entry,
    required this.userName,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final (_, icon) = activitySeverityIndicator(entry.severity, theme);

    final radius = BorderRadius.vertical(
      top: Radius.circular(isFirst ? 16 : 0),
      bottom: Radius.circular(isLast ? 16 : 0),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceMd),
      child: ClipRRect(
        borderRadius: radius,
        child: ColoredBox(
          color: AppColorScheme.onSurface.withValues(alpha: 0.04),
          child: Column(
            children: [
              if (!isFirst)
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  indent: 44,
                  color: AppColorScheme.onSurface.withValues(alpha: 0.08),
                ),
              InkWell(
                onTap: () => _showDetail(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.spaceLg, vertical: 11),
                  child: Row(
                    children: [
                      icon,
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              entry.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            if ((entry.shortOverview ?? '').trim().isNotEmpty)
                              Text(
                                entry.shortOverview!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            if (userName != null)
                              Text(
                                userName!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        activityTimeAgo(entry.date, l10n, compact: false),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    // The dialog's own context is gone once it pops, so push from the page's.
    final page = context;
    showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text(entry.name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  _SeverityBadge(severity: entry.severity),
                  const Spacer(),
                  Text(
                    _formatDateTime(entry.date),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              if (entry.overview != null) ...[
                const SizedBox(height: 12),
                Text(entry.overview!),
              ],
              if (entry.shortOverview != null &&
                  entry.shortOverview != entry.overview) ...[
                const SizedBox(height: 8),
                Text(entry.shortOverview!, style: theme.textTheme.bodySmall),
              ],
              const SizedBox(height: 8),
              Text(
                '${l10n.type}: ${entry.type}',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
        actions: [
          if (entry.itemId != null)
            adaptiveDialogAction(
              onPressed: () {
                Navigator.pop(context);
                page.push(Destinations.item(entry.itemId!));
              },
              child: Text(l10n.adminActivityMediaDetails),
            ),
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dt) {
    final local = dt.toLocal();
    return '${local.year}-${_p(local.month)}-${_p(local.day)} '
        '${_p(local.hour)}:${_p(local.minute)}';
  }

  String _p(int n) => n.toString().padLeft(2, '0');
}

class _DateHeader extends StatelessWidget {
  final String label;
  const _DateHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 8),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
          color: AppColorScheme.accent.withValues(alpha: 0.9),
        ),
      ),
    );
  }
}

class _SeverityBadge extends StatelessWidget {
  final String severity;
  const _SeverityBadge({required this.severity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (color, icon) = activitySeverityIndicator(severity, theme);
    // The quiet levels get a faint rail color, too light for text.
    final textColor = color == theme.colorScheme.outlineVariant
        ? theme.colorScheme.onSurfaceVariant
        : color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: AppRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            activitySeverityLabel(severity, AppLocalizations.of(context)),
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
