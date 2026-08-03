part of '../settings_side_panel.dart';

/// User can decide what to show in the six slots or none.
class _PlaybackTimeLayoutScreen extends StatefulWidget {
  const _PlaybackTimeLayoutScreen();

  @override
  State<_PlaybackTimeLayoutScreen> createState() =>
      _PlaybackTimeLayoutScreenState();
}

class _PlaybackTimeLayoutScreenState extends State<_PlaybackTimeLayoutScreen> {
  // Preview values for the progress bar and time slots. These are not real playback values, just a demonstration.
  static const _previewPosition = Duration(hours: 0, minutes: 42, seconds: 10);
  static const _previewDuration = Duration(hours: 1, minutes: 58, seconds: 33);

  late final UserPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = GetIt.instance<UserPreferences>();
    _prefs.addListener(_onPreferencesChanged);
  }

  @override
  void dispose() {
    _prefs.removeListener(_onPreferencesChanged);
    super.dispose();
  }

  void _onPreferencesChanged() {
    if (!mounted) return;
    setState(() {});
  }

  String _slotLabel(AppLocalizations l10n, PlaybackTimeSlot value) {
    return switch (value) {
      PlaybackTimeSlot.none => l10n.none,
      PlaybackTimeSlot.elapsed => l10n.playbackTimeElapsed,
      PlaybackTimeSlot.totalDuration => l10n.playbackTimeTotal,
      PlaybackTimeSlot.timeRemaining => l10n.playbackTimeRemaining,
      PlaybackTimeSlot.endsAt => l10n.playbackTimeEndsAt,
    };
  }

  String _preview(EnumPreference<PlaybackTimeSlot> preference) {
    return formatPlaybackTimeSlot(
      context,
      slot: _prefs.get(preference),
      position: _previewPosition,
      duration: _previewDuration,
      use24Hour: _prefs.get(UserPreferences.use24HourClock),
    );
  }

  Widget _previewRow(String left, String center, String right, bool bold) {
    final style = TextStyle(
      color: Colors.white70,
      fontSize: AppTypography.fontSizeXs,
      fontWeight: bold ? FontWeight.w600 : null,
    );
    Widget cell(String text, TextAlign align) => Expanded(
      child: Text(
        text,
        style: style,
        textAlign: align,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
    return Row(
      children: [
        cell(left, TextAlign.left),
        cell(center, TextAlign.center),
        cell(right, TextAlign.right),
      ],
    );
  }

  Widget _buildPreview() {
    final above = _previewRow(
      _preview(UserPreferences.playbackTimeAboveLeft),
      _preview(UserPreferences.playbackTimeAboveCenter),
      _preview(UserPreferences.playbackTimeAboveRight),
      true,
    );
    final below = _previewRow(
      _preview(UserPreferences.playbackTimeBelowLeft),
      _preview(UserPreferences.playbackTimeBelowCenter),
      _preview(UserPreferences.playbackTimeBelowRight),
      false,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceLg,
        vertical: AppSpacing.spaceSm,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.spaceMd),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.65),
          borderRadius: AppRadius.circular(AppSpacing.spaceSm),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            above,
            const SizedBox(height: AppSpacing.spaceXs),
            ClipRRect(
              borderRadius: AppRadius.circular(2),
              child: LinearProgressIndicator(
                value:
                    _previewPosition.inMilliseconds /
                    _previewDuration.inMilliseconds,
                backgroundColor: AppColorScheme.rangeTrack,
                valueColor: AlwaysStoppedAnimation(
                  AppColorScheme.rangeProgress,
                ),
                minHeight: 4,
              ),
            ),
            const SizedBox(height: AppSpacing.spaceXs),
            below,
          ],
        ),
      ),
    );
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
          _buildPreview(),
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
