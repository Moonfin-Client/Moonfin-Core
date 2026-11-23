import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_iptv/server_iptv.dart';

import '../../../l10n/app_localizations.dart';

/// Probes a playlist's live streams and lists them, dead ones first.
/// Capped because probing tens of thousands of streams would take forever and
/// can get the account rate limited by the provider.
class IptvHealthCheckScreen extends StatefulWidget {
  static const checkCap = 500;

  final int playlistId;
  final String playlistName;

  const IptvHealthCheckScreen({
    super.key,
    required this.playlistId,
    required this.playlistName,
  });

  @override
  State<IptvHealthCheckScreen> createState() => _IptvHealthCheckScreenState();
}

class _IptvHealthCheckScreenState extends State<IptvHealthCheckScreen> {
  AppLocalizations get _l10n => AppLocalizations.of(context);

  late final _service = PlaylistHealthCheckService(
    GetIt.instance<IptvDatabase>(),
    GetIt.instance<IptvCredentialStore>(),
  );

  final List<HealthCheckResult> _results = [];
  int _totalChannels = 0;
  int _plannedChecks = 0;
  bool _running = false;
  bool _stopRequested = false;

  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  Future<void> _loadCount() async {
    final count = await _service.countLiveChannels(widget.playlistId);
    if (!mounted) return;
    setState(() => _totalChannels = count);
  }

  Future<void> _start() async {
    setState(() {
      _results.clear();
      _running = true;
      _stopRequested = false;
      _plannedChecks = _totalChannels > IptvHealthCheckScreen.checkCap
          ? IptvHealthCheckScreen.checkCap
          : _totalChannels;
    });

    try {
      final channels = await _service.loadChannelsForCheck(
        widget.playlistId,
        limit: IptvHealthCheckScreen.checkCap,
      );
      await _service.checkChannels(
        channels,
        shouldContinue: () => !_stopRequested && mounted,
        onResult: (result) {
          if (!mounted) return;
          setState(() => _results.add(result));
        },
      );
    } finally {
      if (mounted) setState(() => _running = false);
    }
  }

  Future<void> _retest(HealthCheckResult old) async {
    final fresh = await _service.checkChannelById(old.channelId);
    if (fresh == null || !mounted) return;
    setState(() {
      final index = _results.indexOf(old);
      if (index >= 0) _results[index] = fresh;
    });
  }

  @override
  Widget build(BuildContext context) {
    final offline = _results.where((r) => !r.isOnline).toList();
    final online = _results.length - offline.length;
    final dim = AppColorScheme.onSurface.withValues(alpha: 0.6);

    return Scaffold(
      appBar: AppBar(
        title: Text(_l10n.iptvHealthCheckTitle(widget.playlistName)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _totalChannels > IptvHealthCheckScreen.checkCap
                      ? _l10n.iptvLiveChannelsCapped(
                          _totalChannels,
                          IptvHealthCheckScreen.checkCap,
                        )
                      : _l10n.iptvLiveChannelsCount(_totalChannels),
                  style: TextStyle(color: dim, fontSize: 13),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    FilledButton.icon(
                      // A new key once the count loads lets autofocus run
                      // again, now that the button is enabled.
                      key: ValueKey(_totalChannels > 0),
                      autofocus: true,
                      onPressed: _running
                          ? () => setState(() => _stopRequested = true)
                          : (_totalChannels == 0 ? null : _start),
                      icon: Icon(
                        _running ? Icons.stop : Icons.network_check,
                        size: 18,
                      ),
                      label: Text(_running ? _l10n.stop : _l10n.iptvStartCheck),
                    ),
                    const SizedBox(width: 16),
                    if (_running || _results.isNotEmpty)
                      Text(
                        _l10n.iptvTestedProgress(
                          _results.length,
                          _plannedChecks,
                          online,
                          offline.length,
                        ),
                        style: TextStyle(color: dim, fontSize: 13),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (_running) const LinearProgressIndicator(),
          Expanded(
            child: _results.isEmpty
                ? Center(
                    child: Text(
                      _running
                          ? _l10n.iptvTestingStreams
                          : _l10n.iptvNoResultsYet,
                      style: TextStyle(color: dim),
                    ),
                  )
                : Builder(
                    builder: (context) {
                      // Dead streams first since those are what the user came
                      // to find.
                      final sorted = [..._results]
                        ..sort((a, b) {
                          if (a.isOnline == b.isOnline) {
                            return a.channelName.compareTo(b.channelName);
                          }
                          return a.isOnline ? 1 : -1;
                        });
                      return ListView.builder(
                        itemCount: sorted.length,
                        itemBuilder: (context, index) {
                          final result = sorted[index];
                          return ListTile(
                            dense: true,
                            leading: Icon(
                              result.isOnline
                                  ? Icons.check_circle_outline
                                  : Icons.error_outline,
                              color: result.isOnline
                                  ? AppColorScheme.statusAvailable
                                  : AppColorScheme.statusError,
                              size: 20,
                            ),
                            title: Text(
                              result.channelName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              result.isOnline
                                  ? (result.httpStatus != null
                                        ? _l10n.iptvOnlineWithStatus(
                                            result.httpStatus!,
                                          )
                                        : _l10n.iptvOnline)
                                  : (result.httpStatus != null
                                        ? _l10n.iptvOfflineWithStatus(
                                            result.httpStatus!,
                                          )
                                        : _l10n.iptvOffline),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.refresh, size: 20),
                              tooltip: _l10n.iptvRetest,
                              onPressed: _running
                                  ? null
                                  : () => _retest(result),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
