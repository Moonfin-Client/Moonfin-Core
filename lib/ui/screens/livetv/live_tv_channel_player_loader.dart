import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../data/viewmodels/live_tv_guide_view_model.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/platform_detection.dart';
import '../playback/appletv_livetv_player_host_screen.dart';
import 'live_tv_player_screen.dart';

/// Resolves a bare channel id into the full channel lineup before showing the
/// live TV player, so entries that only know an item id (favorites, search,
/// deep links) still get channel zapping in guide order.
class LiveTvChannelPlayerLoader extends StatefulWidget {
  final String channelId;

  const LiveTvChannelPlayerLoader({super.key, required this.channelId});

  @override
  State<LiveTvChannelPlayerLoader> createState() =>
      _LiveTvChannelPlayerLoaderState();
}

class _LiveTvChannelPlayerLoaderState extends State<LiveTvChannelPlayerLoader> {
  List<GuideChannel>? _channels;
  int _startIndex = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final client = GetIt.instance<MediaServerClient>();

    var channels = const <GuideChannel>[];
    try {
      final response = await client.liveTvApi.getChannels(
        fields: 'ImageTags,UserData',
        enableTotalRecordCount: false,
        userId: client.userId,
      );
      final items = (response['Items'] as List?) ?? const [];
      final sortBy =
          GetIt.instance<UserPreferences>().get(UserPreferences.liveTvChannelSortBy);
      channels = items
          .cast<Map<String, dynamic>>()
          .map(GuideChannel.fromRawItem)
          .toList()
        ..sort(LiveTvGuideViewModel.comparatorFor(sortBy));
    } catch (_) {}

    var index = channels.indexWhere((c) => c.id == widget.channelId);
    if (index < 0) {
      // Not in the lineup (hidden tuner, stale favorite). Fall back to playing
      // just this channel without zapping.
      try {
        final raw = await client.userLibraryApi.getItem(widget.channelId);
        channels = [GuideChannel.fromRawItem(raw)];
        index = 0;
      } catch (_) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to open channel')),
        );
        Navigator.of(context).pop();
        return;
      }
    }

    if (!mounted) return;
    setState(() {
      _channels = channels;
      _startIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final channels = _channels;
    if (channels == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return PlatformDetection.isAppleTV
        ? AppleTvLiveTvPlayerHostScreen(
            channels: channels,
            startIndex: _startIndex,
          )
        : LiveTvPlayerScreen(
            channels: channels,
            startIndex: _startIndex,
          );
  }
}
