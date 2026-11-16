import 'package:flutter/material.dart';
import 'package:playback_silo/playback_silo.dart' show siloEndedOnServerMessage;

import '../../../l10n/app_localizations.dart';

/// The viewer's text for a message from
/// `PlaybackManager.endedByServerStream`: Silo's fixed English one is
/// translated, anything else is shown as the server put it.
String playbackEndedByServerText(BuildContext context, String message) =>
    message == siloEndedOnServerMessage
    ? AppLocalizations.of(context).siloPlaybackEndedOnServer
    : message;

/// Shows why the server ended playback. The snack bar stays up on the
/// screen the player closes to.
void showPlaybackEndedByServer(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(playbackEndedByServerText(context, message))),
  );
}
