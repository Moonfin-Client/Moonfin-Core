import 'package:server_iptv/server_iptv.dart';

import '../../../l10n/app_localizations.dart';

String iptvPlaylistErrorMessage(AppLocalizations l10n, PlaylistError error) {
  final detail = error.detail ?? '';
  return switch (error.kind) {
    PlaylistErrorKind.authenticationFailed =>
      l10n.iptvErrorAuthenticationFailed,
    PlaylistErrorKind.connectionFailed => l10n.iptvErrorConnectionFailed(
      detail,
    ),
    PlaylistErrorKind.noChannelsInPlaylist =>
      l10n.iptvErrorNoChannelsInPlaylist,
    PlaylistErrorKind.noChannelsInFile => l10n.iptvErrorNoChannelsInFile,
    PlaylistErrorKind.importFailed => l10n.iptvErrorImportFailed(detail),
    PlaylistErrorKind.fileImportFailed => l10n.iptvErrorFileImportFailed(
      detail,
    ),
    PlaylistErrorKind.fileNotFound => l10n.iptvErrorFileNotFound,
    PlaylistErrorKind.fileNoLongerExists => l10n.iptvErrorFileNoLongerExists,
    PlaylistErrorKind.playlistNotFound => l10n.iptvErrorPlaylistNotFound,
    PlaylistErrorKind.noUrl => l10n.iptvErrorNoUrl,
    PlaylistErrorKind.noFilePath => l10n.iptvErrorNoFilePath,
    PlaylistErrorKind.credentialsNotFound => l10n.iptvErrorCredentialsNotFound,
    PlaylistErrorKind.connectionTimeout => l10n.iptvErrorConnectionTimeout,
    PlaylistErrorKind.receiveTimeout => l10n.iptvErrorReceiveTimeout,
    PlaylistErrorKind.unreachable => l10n.iptvErrorUnreachable,
    PlaylistErrorKind.badResponse => l10n.iptvErrorBadResponse(detail),
    PlaylistErrorKind.network => l10n.iptvErrorNetwork(detail),
    // The raw exception text, which has no translation.
    PlaylistErrorKind.unexpected => detail,
  };
}
