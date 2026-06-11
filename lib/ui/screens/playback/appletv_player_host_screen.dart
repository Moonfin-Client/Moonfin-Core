import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:playback_core/playback_core.dart';

import '../../../playback/appletv_mpv_backend.dart';

class AppleTvPlayerHostScreen extends StatefulWidget {
  const AppleTvPlayerHostScreen({super.key});

  @override
  State<AppleTvPlayerHostScreen> createState() =>
      _AppleTvPlayerHostScreenState();
}

class _AppleTvPlayerHostScreenState extends State<AppleTvPlayerHostScreen> {
  StreamSubscription<void>? _exitSub;
  bool _exiting = false;

  @override
  void initState() {
    super.initState();
    try {
      _exitSub = GetIt.instance<AppleTvMpvBackend>().userExitStream.listen(
        (_) => _handleExit(),
      );
    } catch (_) {}
  }

  void _handleExit() {
    if (_exiting || !mounted) return;
    _exiting = true;
    if (context.canPop()) {
      context.pop();
    }
  }

  @override
  void dispose() {
    _exitSub?.cancel();
    try {
      GetIt.instance<PlaybackManager>().stop(userInitiated: true);
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(),
    );
  }
}
