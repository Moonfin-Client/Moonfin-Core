import 'package:flutter/material.dart';

import '../../widgets/settings/settings_panel.dart';
import 'downloads_home.dart';

/// Opens the saved media panel: what is downloaded to this device, grouped by
/// type, with a season and episode view for saved shows and a per-row action
/// menu. Storage limits and Clear All live in Download Settings, which the
/// panel's gear button opens.
///
/// The panel carries its own navigator, so opening a saved show pushes inside
/// it and Back returns to the list rather than closing the whole thing.
Future<void> showDownloadsDialog(BuildContext context) {
  // Wide, because this panel browses artwork, tabs and metadata rather than
  // listing settings. A phone gets the whole screen either way.
  return SettingsPanel.open(context, const DownloadsPanel(), wide: true);
}

class DownloadsPanel extends StatelessWidget {
  const DownloadsPanel({super.key});

  @override
  Widget build(BuildContext context) => const DownloadsHome();
}
