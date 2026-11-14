import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:playback_core/playback_core.dart';

import '../../../data/models/aggregated_item.dart';
import '../../../l10n/app_localizations.dart';
import '../../navigation/app_router.dart';

/// Names the browser tab after what's playing, like "Hamilton - Moonfin", and
/// gives it back the app's name once nothing is.
class PlaybackTabTitle extends StatefulWidget {
  const PlaybackTabTitle({super.key, required this.child});

  final Widget child;

  @override
  State<PlaybackTabTitle> createState() => _PlaybackTabTitleState();
}

class _PlaybackTabTitleState extends State<PlaybackTabTitle> {
  final _manager = GetIt.instance<PlaybackManager>();
  final _subs = <StreamSubscription<void>>[];

  @override
  void initState() {
    super.initState();
    _subs.addAll([
      _manager.state.playingStream.listen((_) => _rebuild()),
      _manager.queueService.queueChangedStream.listen((_) => _rebuild()),
    ]);
    PlayerRouteObserver.instance.isPlayerActive.addListener(_rebuild);
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    for (final sub in _subs) {
      sub.cancel();
    }
    PlayerRouteObserver.instance.isPlayerActive.removeListener(_rebuild);
    super.dispose();
  }

  String? get _playingName {
    final item = _manager.queueService.currentItem;
    if (item is! AggregatedItem || item.name.isEmpty) return null;
    if (!_manager.state.isPlaying &&
        !PlayerRouteObserver.instance.isPlayerActive.value) {
      return null;
    }
    final series = item.seriesName;
    return item.type == 'Episode' && series != null && series.isNotEmpty
        ? '$series - ${item.name}'
        : item.name;
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = AppLocalizations.of(context).appTitle;
    final playing = _playingName;
    return Title(
      title: playing == null ? appTitle : '$playing - $appTitle',
      color: Theme.of(context).primaryColor,
      child: widget.child,
    );
  }
}
