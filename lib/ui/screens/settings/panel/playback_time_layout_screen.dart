part of '../settings_side_panel.dart';

/// Lets the user pick what each of the six video time slots shows, or hide it.
class _PlaybackTimeLayoutScreen extends StatelessWidget {
  const _PlaybackTimeLayoutScreen();

  String _slotLabel(AppLocalizations l10n, PlaybackTimeSlot value) {
    return switch (value) {
      PlaybackTimeSlot.none => l10n.none,
      PlaybackTimeSlot.elapsed => l10n.playbackTimeElapsed,
      PlaybackTimeSlot.totalDuration => l10n.playbackTimeTotal,
      PlaybackTimeSlot.timeRemaining => l10n.playbackTimeRemaining,
      PlaybackTimeSlot.endsAt => l10n.playbackTimeEndsAt,
      PlaybackTimeSlot.time => l10n.currentTime,
    };
  }

  EnumPreferenceTile<PlaybackTimeSlot> _slotTile(
    AppLocalizations l10n,
    EnumPreference<PlaybackTimeSlot> preference,
    String title,
    IconData icon, {
    bool autofocus = false,
  }) {
    return EnumPreferenceTile<PlaybackTimeSlot>(
      preference: preference,
      title: title,
      description: l10n.playbackTimeSlotDescription,
      icon: icon,
      autofocus: autofocus,
      labelOf: (v) => _slotLabel(l10n, v),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: buildSettingsAppBar(context, Text(l10n.playbackTimeDisplay)),
      body: ListView(
        children: [
          _SectionHeader(l10n.playbackTimeVideoSection),
          adaptiveListSection(
            children: [
              _slotTile(
                l10n,
                UserPreferences.playbackTimeAboveLeft,
                l10n.playbackTimeAboveBarLeft,
                Icons.align_horizontal_left,
                autofocus: true,
              ),
              _slotTile(
                l10n,
                UserPreferences.playbackTimeAboveCenter,
                l10n.playbackTimeAboveBarCenter,
                Icons.align_horizontal_center,
              ),
              _slotTile(
                l10n,
                UserPreferences.playbackTimeAboveRight,
                l10n.playbackTimeAboveBarRight,
                Icons.align_horizontal_right,
              ),
              _slotTile(
                l10n,
                UserPreferences.playbackTimeBelowLeft,
                l10n.playbackTimeBelowBarLeft,
                Icons.align_horizontal_left,
              ),
              _slotTile(
                l10n,
                UserPreferences.playbackTimeBelowCenter,
                l10n.playbackTimeBelowBarCenter,
                Icons.align_horizontal_center,
              ),
              _slotTile(
                l10n,
                UserPreferences.playbackTimeBelowRight,
                l10n.playbackTimeBelowBarRight,
                Icons.align_horizontal_right,
              ),
            ],
          ),
          _SectionHeader(l10n.playbackTimeMusicSection),
          adaptiveListSection(
            children: [
              EnumPreferenceTile<PlaybackTimeDisplay>(
                preference: UserPreferences.musicPlaybackTimeDisplay,
                title: l10n.playbackTimeDisplay,
                description: l10n.settingsMusicPlaybackTimeDescription,
                icon: Icons.music_note,
                labelOf: (v) => switch (v) {
                  PlaybackTimeDisplay.totalDuration => l10n.playbackTimeTotal,
                  PlaybackTimeDisplay.timeRemaining =>
                    l10n.playbackTimeRemaining,
                  PlaybackTimeDisplay.endsAt => l10n.playbackTimeEndsAt,
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
