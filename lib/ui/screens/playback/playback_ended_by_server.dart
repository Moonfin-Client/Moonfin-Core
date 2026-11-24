import 'package:flutter/material.dart';
import 'package:playback_silo/playback_silo.dart'
    show siloEndedOnServerMessage, siloStoppedOnServerMessage;

import '../../../l10n/app_localizations.dart';

/// The viewer's text for a message from
/// `PlaybackManager.endedByServerStream`: Silo's fixed English one is
/// translated (an administrator's reason follows it on its own line),
/// anything else is shown as the server put it.
String playbackEndedByServerText(BuildContext context, String message) {
  final l10n = AppLocalizations.of(context);
  for (final (english, translated) in [
    (siloEndedOnServerMessage, l10n.siloPlaybackEndedOnServer),
    (siloStoppedOnServerMessage, l10n.siloPlaybackStoppedOnServer),
  ]) {
    if (message.startsWith(english)) {
      return translated + message.substring(english.length);
    }
  }
  return message;
}

/// Shows why the server ended playback. The snack bar stays up on the
/// screen the player closes to.
void showPlaybackEndedByServer(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(playbackEndedByServerText(context, message))),
  );
}
