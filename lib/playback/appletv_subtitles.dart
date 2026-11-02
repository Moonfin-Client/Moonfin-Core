import 'package:playback_core/playback_core.dart';

import '../l10n/app_localizations.dart';
import '../preference/user_preferences.dart';
import '../util/secondary_subtitle_track_selection.dart';
import '../util/subtitle_track_logic.dart';
import 'subtitle_style.dart';

/// Builds native tvOS subtitle menu data from the same track rules and saved appearance
/// used by the Flutter picker. Used by video and Live TV. Live TV uses a single
/// subtitle menu.
Map<String, dynamic> appleTvSubtitleMetadata({
  required PlaybackManager manager,
  required UserPreferences prefs,
  required AppLocalizations l10n,
  required List<Map<String, dynamic>> tracks,
  List<Map<String, dynamic>>? sourceStreams,
}) {
  final style = SubtitleStyle.forResolution(prefs, manager.currentResolution);
  // With no secondary tracks offered the native menu stays a single list. One
  // that's already showing keeps the step so it can still be turned off.
  final offerSecondary =
      prefs.get(UserPreferences.secondarySubtitlesEnabled) ||
      manager.secondarySubtitleStreamIndex != null;
  final eligible = tracks.where((track) {
    final index = track['index'];
    return offerSecondary &&
        index is int &&
        index != manager.subtitleStreamIndex &&
        manager.canUseAsSecondarySubtitle(index);
  });
  // Native menu entries have labels but no language codes. Use their original
  // stream indexes to rank them without changing the selected track.
  final languages = {
    for (final stream in sourceStreams ?? const <Map<String, dynamic>>[])
      if (stream['Index'] is int)
        stream['Index'] as int: stream['Language'],
  };
  final ranked = rankSecondarySubtitleStreams(
    [
      for (final track in eligible)
        {'Language': languages[track['index']], 'track': track},
    ],
    prefs.get(UserPreferences.preferredSecondarySubtitleLanguage),
  );
  return {
    'tracks': [for (final entry in ranked) entry['track']],
    'title': l10n.secondarySubtitleSlot,
    'menuTitle': l10n.subtitles,
    'primaryTitle': l10n.primarySubtitleSlot,
    'secondaryTitle': l10n.secondarySubtitleTrack,
    'secondaryDelayLabel': l10n.secondaryDelayAdjustment,
    'off': l10n.off,
    'cancel': l10n.cancel,
    'done': l10n.done,
    'reset': l10n.reset,
    'defaultLabel': l10n.defaultLabel,
    'delayLabel': l10n.subtitleDelay,
    'sizeLabel': l10n.subtitleSize,
    'positionLabel': l10n.verticalOffset,
    'colorLabel': l10n.textFillColor,
    // Live TV omits source streams because captions can come from the player.
    'showPrimaryAppearance': sourceStreams?.any(isTextSubtitleStream) ?? true,
    'primaryFontSize': style.fontSize,
    'sizeAdjustment': prefs.get(UserPreferences.secondarySubtitleSizeAdjustment),
    'primaryVerticalOffset': style.verticalOffset,
    'primaryStoredVerticalOffset': storedPrimarySubtitleOffset(
      prefs,
      manager.currentResolution,
    ),
    'primaryOffsetMin': 0.0,
    'primaryOffsetMax': primarySubtitleMaxOffset,
    'primaryOffsetStep': 0.02,
    'verticalOffset': manager.secondarySubtitleOffset,
    'secondaryStoredVerticalOffset': prefs.get(
      UserPreferences.secondarySubtitleOffsetPosition,
    ),
    'secondaryOffsetMin': secondarySubtitleMinOffset,
    'secondaryOffsetMax': secondarySubtitleMaxOffset,
    'secondaryOffsetStep': 0.02,
    'textColor': prefs.get(UserPreferences.secondarySubtitleTextColor),
    'colors': [
      {'label': l10n.defaultLabel, 'value': -1},
      {'label': l10n.white, 'value': 0xFFFFFFFF},
      {'label': l10n.yellow, 'value': 0xFFFFFF00},
      {'label': l10n.green, 'value': 0xFF00FF00},
      {'label': l10n.cyan, 'value': 0xFF00FFFF},
      {'label': l10n.blue, 'value': 0xFF0000FF},
      {'label': l10n.magenta, 'value': 0xFFFF00FF},
      {'label': l10n.red, 'value': 0xFFFF0000},
    ],
  };
}

/// Returns null when this handler doesn't recognize the event.
Future<void>? handleAppleTvSubtitleAction(
  Map<String, dynamic> action,
  PlaybackManager manager,
  UserPreferences prefs,
) {
  switch (action['event']) {
    case 'setSubtitleSize':
      final size = (action['fontSize'] as num?)?.toDouble();
      if (size == null) return Future<void>.value();
      return setPrimarySubtitleSize(manager, prefs, size);
    case 'setSubtitlePosition':
      final offset = (action['verticalOffset'] as num?)?.toDouble();
      if (offset == null) return Future<void>.value();
      return setPrimarySubtitleAppearance(
        manager,
        prefs,
        verticalOffset: offset,
      );
    case 'selectSecondarySubtitle':
      final index = (action['index'] as num?)?.toInt();
      if (index == null) return Future<void>.value();
      return manager.changeSecondarySubtitleTrack(index < 0 ? null : index);
    case 'setSecondarySubtitleDelay':
      final delay = (action['delayMs'] as num?)?.toDouble();
      if (delay == null || !delay.isFinite) return Future<void>.value();
      return manager.setSecondarySubtitleDelay(delay / 1000);
    case 'configureSecondarySubtitleStyle':
      return _saveAppearance(action, manager, prefs);
    default:
      return null;
  }
}

Future<void> _saveAppearance(
  Map<String, dynamic> action,
  PlaybackManager manager,
  UserPreferences prefs,
) async {
  final size = (action['sizeAdjustment'] as num?)?.toDouble();
  final offset = (action['verticalOffset'] as num?)?.toDouble();
  final color = (action['textColor'] as num?)?.toInt();
  if (size != null && size.isFinite) {
    await prefs.set(
      UserPreferences.secondarySubtitleSizeAdjustment,
      size.clamp(-50.0, 50.0).toDouble(),
    );
  }
  if (offset != null && offset.isFinite) {
    await prefs.set(
      UserPreferences.secondarySubtitleOffsetPosition,
      PlaybackManager.clampSecondarySubtitleOffset(offset),
    );
  }
  if (color != null) {
    await prefs.set(UserPreferences.secondarySubtitleTextColor, color);
  }
  await syncSecondarySubtitleStyle(manager, prefs);
}
