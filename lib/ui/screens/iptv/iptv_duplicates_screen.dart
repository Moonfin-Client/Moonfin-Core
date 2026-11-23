import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_iptv/server_iptv.dart';

import '../../widgets/overlay_sheet.dart';
import '../../../l10n/app_localizations.dart';

/// Finds channels listed more than once in a playlist and merges each group
/// down to a single keeper.
class IptvDuplicatesScreen extends StatefulWidget {
  final int playlistId;
  final String playlistName;

  const IptvDuplicatesScreen({
    super.key,
    required this.playlistId,
    required this.playlistName,
  });

  @override
  State<IptvDuplicatesScreen> createState() => _IptvDuplicatesScreenState();
}

class _IptvDuplicatesScreenState extends State<IptvDuplicatesScreen> {
  AppLocalizations get _l10n => AppLocalizations.of(context);

  late final _service = DuplicateDetectionService(
    GetIt.instance<IptvDatabase>(),
  );

  List<DuplicateChannelGroup>? _groups;
  bool _byTvgId = true;
  bool _byStreamUrl = true;
  bool _byName = false;
  bool _running = false;

  Future<void> _scan() async {
    setState(() {
      _running = true;
      _groups = null;
    });
    List<DuplicateChannelGroup>? groups;
    try {
      groups = await _service.detectDuplicates(
        widget.playlistId,
        byTvgId: _byTvgId,
        byStreamUrl: _byStreamUrl,
        byName: _byName,
      );
    } finally {
      if (mounted) {
        setState(() {
          _groups = groups;
          _running = false;
        });
      }
    }
  }

  Future<void> _merge(DuplicateChannelGroup group, Channel keep) async {
    await _service.mergeChannels(keep.id, [
      for (final c in group.channels) c.id,
    ]);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _l10n.iptvKeptRemoved(keep.name, group.channels.length - 1),
        ),
      ),
    );
    await _scan();
  }

  void _showMergeDialog(DuplicateChannelGroup group) {
    showFocusRestoringDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(_l10n.iptvKeepWhichChannel),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final channel in group.channels)
              ListTile(
                dense: true,
                leading: const Icon(Icons.live_tv, size: 20),
                title: Text(
                  channel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: channel.channelNumber != null
                    ? Text(_l10n.iptvChannelNumberValue(channel.channelNumber!))
                    : null,
                onTap: () {
                  Navigator.of(dialogContext).pop();
                  _merge(group, channel);
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

  @override
  Widget build(BuildContext context) {
    final dim = AppColorScheme.onSurface.withValues(alpha: 0.6);
    final groups = _groups;

    return Scaffold(
      appBar: AppBar(
        title: Text(_l10n.iptvDuplicatesTitle(widget.playlistName)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text(_l10n.iptvTvgId),
                  selected: _byTvgId,
                  onSelected: (v) => setState(() => _byTvgId = v),
                ),
                FilterChip(
                  label: Text(_l10n.iptvStreamUrl),
                  selected: _byStreamUrl,
                  onSelected: (v) => setState(() => _byStreamUrl = v),
                ),
                FilterChip(
                  label: Text(_l10n.name),
                  selected: _byName,
                  onSelected: (v) => setState(() => _byName = v),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton.icon(
              autofocus: true,
              onPressed: _running || !(_byTvgId || _byStreamUrl || _byName)
                  ? null
                  : _scan,
              icon: const Icon(Icons.search, size: 18),
              label: Text(_l10n.iptvScanForDuplicates),
            ),
          ),
          if (_running) const LinearProgressIndicator(),
          Expanded(
            child: groups == null
                ? Center(
                    child: Text(
                      _running ? _l10n.iptvScanning : _l10n.iptvChooseCriteria,
                      style: TextStyle(color: dim),
                    ),
                  )
                : groups.isEmpty
                ? Center(
                    child: Text(
                      _l10n.iptvNoDuplicatesFound,
                      style: TextStyle(color: dim),
                    ),
                  )
                : ListView.builder(
                    itemCount: groups.length,
                    itemBuilder: (context, index) {
                      final group = groups[index];
                      return ListTile(
                        leading: const Icon(Icons.content_copy_outlined),
                        title: Text(
                          group.channels.first.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          _l10n.iptvCopiesReason(
                            group.channels.length,
                            switch (group.reason) {
                              DuplicateReason.tvgId => _l10n.iptvSameTvgId(
                                group.match,
                              ),
                              DuplicateReason.streamUrl =>
                                _l10n.iptvSameStreamUrl,
                              DuplicateReason.name => _l10n.iptvSameName(
                                group.match,
                              ),
                            },
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(Icons.merge, size: 20),
                        onTap: () => _showMergeDialog(group),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
