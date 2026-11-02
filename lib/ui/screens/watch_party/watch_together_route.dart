import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../watch_party/silo_watch_party_manager.dart';
import '../syncplay/syncplay_screen.dart';
import 'silo_watch_party_screen.dart';

/// The Watch Together screen for the active server: Silo's Watch Party on
/// Silo, SyncPlay everywhere else.
Widget watchTogetherScreen() =>
    GetIt.instance<SiloWatchPartyManager>().activeSiloClient != null
    ? const SiloWatchPartyScreen()
    : const SyncPlayScreen();
