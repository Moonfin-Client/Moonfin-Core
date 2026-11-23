import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_iptv/server_iptv.dart';

import '../../../auth/repositories/session_repository.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../widgets/local_search_field.dart';

/// Enabled-groups allowlist for the active IPTV profile. Huge providers ship
/// tens of thousands of channels, so narrowing to a few groups keeps the
/// channel list and guide fast and relevant.
class IptvGroupsScreen extends StatefulWidget {
  const IptvGroupsScreen({super.key});

  @override
  State<IptvGroupsScreen> createState() => _IptvGroupsScreenState();
}

class _IptvGroupsScreenState extends State<IptvGroupsScreen> {
  AppLocalizations get _l10n => AppLocalizations.of(context);

  late final PersonalizationRepository _personalization =
      PersonalizationRepository(GetIt.instance<IptvDatabase>());
  final String? _profileId = GetIt.instance<SessionRepository>().activeUserId;

  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  List<GroupWithCount> _groups = const [];
  Set<int> _selected = {};
  bool _loading = true;
  String _search = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _load();
    if (PlatformDetection.isTV) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _searchFocus.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text != _search) {
      setState(() => _search = _searchController.text);
    }
  }

  Future<void> _load() async {
    final groups = await _personalization.getLiveGroupsWithCounts();
    Set<int>? enabled;
    final profileId = _profileId;
    if (profileId != null) {
      enabled = await _personalization.getEnabledGroupIds(profileId);
    }
    if (!mounted) return;
    setState(() {
      _groups = groups;
      // No stored allowlist means every group is enabled.
      _selected = enabled ?? {for (final g in groups) g.group.id};
      _loading = false;
    });
  }

  Future<void> _persist() async {
    final profileId = _profileId;
    if (profileId == null) return;
    final allIds = {for (final g in _groups) g.group.id};
    await _personalization.setEnabledGroupIds(
      profileId,
      _selected.containsAll(allIds) ? null : _selected,
    );
  }

  void _toggle(int groupId, bool enabled) {
    setState(() {
      if (enabled) {
        _selected.add(groupId);
      } else {
        _selected.remove(groupId);
      }
    });
    _persist();
  }

  void _selectAll(bool all) {
    setState(() {
      _selected = all ? {for (final g in _groups) g.group.id} : {};
    });
    _persist();
  }

  @override
  Widget build(BuildContext context) {
    final query = _search.trim().toLowerCase();
    final visible = query.isEmpty
        ? _groups
        : [
            for (final g in _groups)
              if (g.group.name.toLowerCase().contains(query)) g,
          ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_l10n.iptvChannelGroups),
        actions: [
          TextButton(onPressed: () => _selectAll(true), child: Text(_l10n.all)),
          TextButton(
            onPressed: () => _selectAll(false),
            child: Text(_l10n.none),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: LocalSearchField(
                    controller: _searchController,
                    focusNode: _searchFocus,
                    hint: _l10n.iptvSearchGroups,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _l10n.iptvGroupsEnabledCount(
                        _selected.length,
                        _groups.length,
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: visible.length,
                    itemBuilder: (context, index) {
                      final entry = visible[index];
                      final id = entry.group.id;
                      return SwitchListTile(
                        dense: true,
                        title: Text(
                          entry.group.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          _l10n.iptvChannelCount(entry.channelCount),
                        ),
                        value: _selected.contains(id),
                        onChanged: (value) => _toggle(id, value),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
