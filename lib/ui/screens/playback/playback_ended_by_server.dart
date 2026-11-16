import 'package:flutter/material.dart';
import 'package:playback_silo/playback_silo.dart' show siloEndedOnServerMessage;

import '../../../l10n/app_localizations.dart';

/// Shows why the server ended playback, from
/// `PlaybackManager.endedByServerStream`. Silo's fixed English message is
/// translated; anything else is shown as the server put it. The snack bar
/// stays up on the screen the player closes to.
void showPlaybackEndedByServer(BuildContext context, String message) {
  final l10n = AppLocalizations.of(context);
  final text = message == siloEndedOnServerMessage
      ? l10n.siloPlaybackEndedOnServer
      : message;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
