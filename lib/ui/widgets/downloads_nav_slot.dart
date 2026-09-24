import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/services/saved_media_presence.dart';
import '../../preference/user_preferences.dart';
import '../../util/platform_detection.dart';

/// Wraps the downloads button for a nav bar.
///
/// Renders nothing where downloads make no sense, where the user turned the
/// button off, or where there is nothing saved, so the menu never offers a way
/// into an empty screen.
class DownloadsNavSlot extends StatelessWidget {
  const DownloadsNavSlot({super.key, required this.builder});

  final WidgetBuilder builder;

  /// Whether the entry could ever show here, which is the question a nav bar
  /// asks when it hands out its colours. The runtime half is deliberately not
  /// part of this: a slot given up when the last download goes would recolour
  /// every entry below it.
  static bool isOffered() =>
      GetIt.instance<UserPreferences>().get(
        UserPreferences.showDownloadsButton,
      ) &&
      PlatformDetection.supportsOfflineDownloads &&
      !PlatformDetection.isWeb;

  /// Whether there is anything saved to show right now.
  static bool hasSavedMedia() {
    if (!GetIt.instance.isRegistered<SavedMediaPresence>()) return false;
    return GetIt.instance<SavedMediaPresence>().hasSavedMedia;
  }

  @override
  Widget build(BuildContext context) {
    if (!isOffered() || !GetIt.instance.isRegistered<SavedMediaPresence>()) {
      return const SizedBox.shrink();
    }
    final presence = GetIt.instance<SavedMediaPresence>();
    return ListenableBuilder(
      listenable: presence,
      builder: (context, _) =>
          presence.hasSavedMedia ? builder(context) : const SizedBox.shrink(),
    );
  }
}
