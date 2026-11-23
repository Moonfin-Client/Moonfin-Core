import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_iptv/server_iptv.dart';

import '../../../l10n/app_localizations.dart';
import '../../widgets/local_search_field.dart';
import '../../widgets/overlay_sheet.dart';
import 'widgets/iptv_login_widgets.dart';

/// Channel editor for one playlist: rename, renumber, or remove channels and
/// rename groups. Groups load their channels lazily so a huge playlist stays
/// responsive.
class IptvM3uEditorScreen extends StatefulWidget {
  final int playlistId;
  final String playlistName;

  const IptvM3uEditorScreen({
    super.key,
    required this.playlistId,
    required this.playlistName,
  });

  @override
  State<IptvM3uEditorScreen> createState() => _IptvM3uEditorScreenState();
}

class _IptvM3uEditorScreenState extends State<IptvM3uEditorScreen>
    with SingleTickerProviderStateMixin {
  AppLocalizations get _l10n => AppLocalizations.of(context);

  late final _channels = ChannelRepository(GetIt.instance<IptvDatabase>());
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  String _search = '';
  int _reloadToken = 0;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text != _search) {
        setState(() => _search = _searchController.text);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _reload() => setState(() => _reloadToken++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.playlistName),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: _l10n.channels),
            Tab(text: _l10n.iptvGroupsTab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildChannelsTab(), _buildGroupsTab()],
      ),
    );
  }

  Widget _buildChannelsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: LocalSearchField(
            controller: _searchController,
            focusNode: _searchFocus,
            hint: _l10n.iptvSearchChannels,
          ),
        ),
        Expanded(
          child: _search.trim().isEmpty
              ? _buildGroupedChannels()
              : _buildSearchResults(),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    return FutureBuilder<List<Channel>>(
      key: ValueKey('search_${_search}_$_reloadToken'),
      future: _channels.searchChannelsForPlaylist(
        widget.playlistId,
        _search.trim(),
      ),
      builder: (context, snapshot) => _loaded(snapshot, (results) {
        if (results.isEmpty) {
          return Center(child: Text(_l10n.iptvNoChannelsMatch));
        }
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) => _channelTile(results[index]),
        );
      }),
    );
  }

  Widget _buildGroupedChannels() {
    return FutureBuilder<List<ChannelGroup>>(
      key: ValueKey('groups_$_reloadToken'),
      future: _channels.getGroupsForPlaylist(widget.playlistId),
      builder: (context, snapshot) => _loaded(snapshot, (groups) {
        if (groups.isEmpty) {
          return Center(child: Text(_l10n.iptvNoGroupsInPlaylist));
        }
        return ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];
            return ExpansionTile(
              title: Text(
                group.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: _channelCount(group.id),
              children: [
                FutureBuilder<List<Channel>>(
                  future: _channels.getChannelsForGroup(group.id),
                  builder: (context, channels) => Padding(
                    padding: channels.hasData
                        ? EdgeInsets.zero
                        : const EdgeInsets.all(16),
                    child: _loaded(
                      channels,
                      (list) =>
                          Column(children: list.map(_channelTile).toList()),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }

  Widget _channelCount(int groupId) => FutureBuilder<int>(
    future: _channels.countChannelsInGroup(groupId),
    builder: (context, count) =>
        Text(count.hasData ? _l10n.iptvChannelCount(count.data!) : ''),
  );

  /// A spinner while [snapshot] loads, a message if it fails, and [build]
  /// once it's done.
  Widget _loaded<T>(AsyncSnapshot<T> snapshot, Widget Function(T) build) {
    if (snapshot.hasError) return Center(child: Text(_l10n.failedToLoad));
    final data = snapshot.data;
    if (data == null) return const Center(child: CircularProgressIndicator());
    return build(data);
  }

  Widget _channelTile(Channel channel) {
    return ListTile(
      dense: true,
      leading: channel.channelNumber != null
          ? Text(
              '${channel.channelNumber}',
              style: TextStyle(
                color: AppColorScheme.onSurface.withValues(alpha: 0.5),
              ),
            )
          : null,
      title: Text(channel.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: () => _showChannelActions(channel),
    );
  }

  void _showChannelActions(Channel channel) {
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(channel.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: Text(_l10n.rename),
              onTap: () {
                Navigator.of(dialogContext).pop();
                _showRenameChannelDialog(channel);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tag),
              title: Text(_l10n.iptvChangeNumber),
              onTap: () {
                Navigator.of(dialogContext).pop();
                _showNumberDialog(channel);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: Text(_l10n.iptvRemoveChannel),
              onTap: () {
                Navigator.of(dialogContext).pop();
                _confirmDeleteChannel(channel);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(_l10n.cancel),
          ),
        ],
      ),
    );
  }

  void _showRenameChannelDialog(Channel channel) {
    _showTextDialog(
      title: _l10n.iptvRenameChannel,
      label: _l10n.name,
      icon: Icons.live_tv,
      initial: channel.name,
      onSave: (value) async {
        if (value.trim().isEmpty) return;
        await _channels.renameChannel(channel.id, value.trim());
        if (!mounted) return;
        _reload();
      },
    );
  }

  void _showNumberDialog(Channel channel) {
    _showTextDialog(
      title: _l10n.iptvChannelNumber,
      label: _l10n.iptvNumber,
      icon: Icons.tag,
      initial: channel.channelNumber?.toString() ?? '',
      keyboardType: TextInputType.number,
      onSave: (value) async {
        await _channels.setChannelNumber(
          channel.id,
          int.tryParse(value.trim()),
        );
        if (!mounted) return;
        _reload();
      },
    );
  }

  void _confirmDeleteChannel(Channel channel) {
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(_l10n.iptvRemoveConfirmTitle(channel.name)),
        content: Text(_l10n.iptvRemoveChannelBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(_l10n.cancel),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await _channels.removeChannels([channel.id]);
              if (!mounted) return;
              _reload();
            },
            child: Text(_l10n.remove),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupsTab() {
    return FutureBuilder<List<ChannelGroup>>(
      key: ValueKey('grouptab_$_reloadToken'),
      future: _channels.getGroupsForPlaylist(widget.playlistId),
      builder: (context, snapshot) => _loaded(snapshot, (groups) {
        if (groups.isEmpty) {
          return Center(child: Text(_l10n.iptvNoGroupsInPlaylist));
        }
        return ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];
            return ListTile(
              leading: const Icon(Icons.folder_outlined),
              title: Text(group.name),
              subtitle: _channelCount(group.id),
              onTap: () => _showTextDialog(
                title: _l10n.iptvRenameGroup,
                label: _l10n.name,
                icon: Icons.folder_outlined,
                initial: group.name,
                onSave: (value) async {
                  if (value.trim().isEmpty) return;
                  await _channels.renameGroup(group.id, value.trim());
                  if (!mounted) return;
                  _reload();
                },
              ),
            );
          },
        );
      }),
    );
  }

  void _showTextDialog({
    required String title,
    required String label,
    required IconData icon,
    required String initial,
    required Future<void> Function(String value) onSave,
    TextInputType? keyboardType,
  }) {
    // The field still reads the controller while the dialog animates out, so
    // it's left to the garbage collector instead of being disposed on pop.
    final controller = TextEditingController(text: initial);
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: GlassField(
          controller: controller,
          label: label,
          icon: icon,
          keyboardType: keyboardType,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(_l10n.cancel),
          ),
          FilledButton(
            onPressed: () async {
              final value = controller.text;
              Navigator.of(dialogContext).pop();
              await onSave(value);
            },
            child: Text(_l10n.save),
          ),
        ],
      ),
    );
  }
}
