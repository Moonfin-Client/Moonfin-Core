import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../data/services/plugin_sync_service.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/input_mode_tracker.dart';
import '../../widgets/adaptive/adaptive_dialog.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import '../../widgets/settings/settings_section_header.dart';
import '../../../l10n/app_localizations.dart';

class PluginSettingsSection extends StatefulWidget {
  const PluginSettingsSection({super.key});

  @override
  State<PluginSettingsSection> createState() => _PluginSettingsSectionState();
}

class _PluginSettingsSectionState extends State<PluginSettingsSection> {
  late final PluginSyncService _syncService;
  late final UserPreferences _prefs;
  bool _profileSyncBusy = false;

  @override
  void initState() {
    super.initState();
    _syncService = GetIt.instance<PluginSyncService>();
    _prefs = GetIt.instance<UserPreferences>();
    _syncService.addListener(_onSyncStateChanged);
    _refreshPluginStatus();
  }

  @override
  void dispose() {
    _syncService.removeListener(_onSyncStateChanged);
    super.dispose();
  }

  void _onSyncStateChanged() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _refreshPluginStatus() async {
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return;
    final client = GetIt.instance<MediaServerClient>();
    await _syncService.refreshAvailability(client);
  }

  Future<void> _selectProfile(String profile) async {
    if (_profileSyncBusy) return;
    await _syncService.setSyncProfile(profile);
  }

  String _profileLabel(String profile, AppLocalizations l10n) {
    switch (profile) {
      case 'global':
        return l10n.global;
      case 'desktop':
        return l10n.desktop;
      case 'mobile':
        return l10n.mobile;
      case 'tv':
        return l10n.tv;
      default:
        return profile;
    }
  }

  IconData _profileIcon(String profile) {
    switch (profile) {
      case 'global':
        return Icons.public;
      case 'desktop':
        return Icons.desktop_windows;
      case 'mobile':
        return Icons.smartphone;
      default:
        return Icons.tv;
    }
  }

  Future<void> _pullSelectedProfile() async {
    if (_profileSyncBusy || !_syncService.pluginAvailable) return;
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return;

    setState(() => _profileSyncBusy = true);
    final client = GetIt.instance<MediaServerClient>();
    final profile = _syncService.syncProfile;
    final ok = await _syncService.pullSettingsForProfile(
      client,
      profile: profile,
    );

    if (!mounted) return;
    setState(() => _profileSyncBusy = false);
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ok
              ? l10n.loadedProfileSettings(_profileLabel(profile, l10n))
              : l10n.failedToLoadProfileSettings(_profileLabel(profile, l10n)),
        ),
      ),
    );
  }

  Future<void> _pushSelectedProfile() async {
    if (_profileSyncBusy || !_syncService.pluginAvailable) return;
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return;

    setState(() => _profileSyncBusy = true);
    final client = GetIt.instance<MediaServerClient>();
    final profile = _syncService.syncProfile;
    final result = await _syncService.pushSettingsForProfile(
      client,
      profile: profile,
      force: true,
    );

    if (!mounted) return;
    setState(() => _profileSyncBusy = false);
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(switch (result) {
          ProfilePushResult.saved => l10n.syncedSettingsToProfile(_profileLabel(profile, l10n)),
          ProfilePushResult.savedWithPinErrors => l10n.profileSavedWithPinErrors,
          ProfilePushResult.failed => l10n.friendsSaveFailed,
        }),
      ),
    );
  }

  Future<void> _resetSelectedProfile() async {
    if (_profileSyncBusy || !_syncService.pluginAvailable) return;
    if (!GetIt.instance.isRegistered<MediaServerClient>()) return;

    final l10n = AppLocalizations.of(context);
    final profile = _syncService.syncProfile;
    final label = _profileLabel(profile, l10n);

    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog.adaptive(
        title: Text(l10n.resetProfileTitle(label)),
        content: Text(
          profile == 'global'
              ? l10n.resetGlobalProfileDescription
              : l10n.resetProfileDescription(label),
        ),
        actions: [
          // Focused on open, so a remote lands on the harmless action rather
          // than on the dialog scope, where the first press would go on waking
          // focus up instead of moving between the two.
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(dialogContext, false),
            autofocus: true,
            focusRingColor: AppColorScheme.accent,
            child: Text(l10n.cancel),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(dialogContext, true),
            isDestructive: true,
            focusRingColor: AppColorScheme.accent,
            child: Text(l10n.reset),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _profileSyncBusy = true);
    final ok = await _syncService.resetProfileToDefaults(
      GetIt.instance<MediaServerClient>(),
      profile: profile,
    );

    if (!mounted) return;
    setState(() => _profileSyncBusy = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ok ? l10n.profileReset(label) : l10n.failedToResetProfile(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return withCleanSettingsTypography(
      context,
      Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context);
          final theme = Theme.of(context);
          final syncEnabled = _prefs.get(UserPreferences.pluginSyncEnabled);

          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildStatusCard(l10n, syncEnabled),
                if (_syncService.pluginAvailable && syncEnabled) ...[
                  SettingsSectionHeader(l10n.profile),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                    child: Text(
                      l10n.syncProfileDescription,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _subtleColor(false),
                      ),
                    ),
                  ),
                  _buildProfileGrid(l10n),
                  const SizedBox(height: 12),
                  _buildTransferCard(theme, l10n),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusCard(AppLocalizations l10n, bool syncEnabled) {
    final available = _syncService.pluginAvailable;
    final version = _syncService.pluginVersion?.trim() ?? '';
    final services = <String>[
      if (_syncService.mdblistAvailable) 'MDBList',
      if (_syncService.tmdbAvailable) 'TMDB',
      if (_syncService.seerrEnabled) 'Seerr',
    ];

    return _SyncCard(
      autofocus: true,
      onTap: () => _syncService.setSyncEnabled(!syncEnabled),
      builder: (context, focused) {
        final theme = Theme.of(context);
        final inverted = _inverts(focused);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                buildSettingsLeadingIconShell(
                  context,
                  icon: Icon(available ? Icons.extension : Icons.extension_off),
                  focused: focused,
                  iconColor: inverted
                      ? _invertedIconColor
                      : AppColorScheme.onSurface,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        available ? 'Moonbase' : l10n.pluginNotDetected,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: _textColor(inverted),
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (available)
                        Row(
                          children: [
                            const _StatusDot(),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                version.isEmpty
                                    ? l10n.pluginConnected
                                    : l10n.pluginConnectedVersion(version),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: _subtleColor(inverted),
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        Text(
                          l10n.pluginNotDetectedDescription,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: _subtleColor(inverted),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // The card takes focus and the press, so the switch only
                    // shows the state and takes a touch.
                    ExcludeFocus(
                      child: Switch.adaptive(
                        value: syncEnabled,
                        onChanged: _syncService.setSyncEnabled,
                      ),
                    ),
                    Text(
                      syncEnabled ? l10n.pluginSyncOn : l10n.pluginSyncOff,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: _subtleColor(inverted),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (available && services.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final service in services)
                    _ServiceChip(label: service, inverted: inverted),
                ],
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildProfileGrid(AppLocalizations l10n) {
    const profiles = PluginSyncService.supportedProfiles;
    final active = _syncService.syncProfile;
    final device = _syncService.currentDeviceProfile;

    Widget card(String profile) => _buildProfileCard(
      profile,
      l10n,
      selected: profile == active,
      isDevice: profile == device,
    );

    return Column(
      children: [
        for (var i = 0; i < profiles.length; i += 2) ...[
          if (i > 0) const SizedBox(height: 10),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: card(profiles[i])),
                const SizedBox(width: 10),
                Expanded(child: card(profiles[i + 1])),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildProfileCard(
    String profile,
    AppLocalizations l10n, {
    required bool selected,
    required bool isDevice,
  }) {
    return _SyncCard(
      selected: selected,
      onTap: () => _selectProfile(profile),
      padding: const EdgeInsets.all(12),
      builder: (context, focused) {
        final theme = Theme.of(context);
        final inverted = _inverts(focused);
        final subtitleStyle = theme.textTheme.bodySmall?.copyWith(
          color: _subtleColor(inverted),
        );
        return Row(
          children: [
            Icon(
              _profileIcon(profile),
              size: 24,
              color: inverted
                  ? _invertedIconColor
                  : selected
                  ? AppColorScheme.accent
                  : _subtleColor(false),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _profileLabel(profile, l10n),
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: _textColor(inverted),
                    ),
                  ),
                  if (isDevice)
                    Row(
                      children: [
                        const _StatusDot(),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            l10n.profileThisDevice,
                            style: subtitleStyle,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      profile == 'global'
                          ? l10n.profileAppliesEverywhere
                          : l10n.profileOverridesGlobal,
                      style: subtitleStyle,
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTransferCard(ThemeData theme, AppLocalizations l10n) {
    final label = _profileLabel(_syncService.syncProfile, l10n);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: AppRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _buildTransferButton(
                    icon: Icons.cloud_download,
                    title: l10n.profileLoad,
                    subtitle: l10n.profileLoadSubtitle,
                    onTap: _pullSelectedProfile,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildTransferButton(
                    icon: Icons.cloud_upload,
                    title: l10n.save,
                    subtitle: l10n.profileSaveSubtitle,
                    onTap: _pushSelectedProfile,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: _SyncCard(
              color: Colors.transparent,
              outlined: false,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              onTap: _resetSelectedProfile,
              builder: (context, focused) {
                final error = theme.colorScheme.error;
                // The error tone is too light to read on the focused fill.
                final color = _inverts(focused)
                    ? Color.lerp(error, AppColors.black, 0.35)!
                    : error;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.restart_alt, size: 20, color: color),
                    const SizedBox(width: 8),
                    Text(
                      l10n.resetNamedProfile(label),
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (_profileSyncBusy)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: LinearProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _buildTransferButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return _SyncCard(
      color: AppColorScheme.buttonNormal,
      outlined: false,
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      builder: (context, focused) {
        final theme = Theme.of(context);
        final inverted = _inverts(focused);
        return Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: inverted
                  ? _invertedIconColor
                  : AppColorScheme.accent,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: _textColor(inverted),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: _subtleColor(inverted),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

bool _inverts(bool focused) => focused && settingsTileInvertsOnFocus;

Color _textColor(bool inverted) => inverted
    ? AppColors.black.withValues(alpha: 0.87)
    : AppColorScheme.onSurface;

Color _subtleColor(bool inverted) => inverted
    ? AppColors.black.withValues(alpha: 0.7)
    : AppColorScheme.onSurface.withValues(alpha: 0.7);

Color get _invertedIconColor => AppColors.black.withValues(alpha: 0.54);

class _StatusDot extends StatelessWidget {
  const _StatusDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: AppColorScheme.statusAvailable,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ServiceChip extends StatelessWidget {
  const _ServiceChip({required this.label, required this.inverted});

  final String label;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final borders = ThemeRegistry.active.borders;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: inverted
            ? AppColors.black.withValues(alpha: 0.06)
            : borders.chipBackground,
        borderRadius: borders.chipRadius,
        border: Border.fromBorderSide(
          inverted
              ? BorderSide(color: AppColors.black.withValues(alpha: 0.2))
              : borders.chipBorder,
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: _textColor(inverted),
        ),
      ),
    );
  }
}

/// A focusable card in the settings tile style. It fills light under D-pad
/// focus where settings tiles do, and [selected] gives it an accent edge.
class _SyncCard extends StatefulWidget {
  const _SyncCard({
    required this.onTap,
    required this.builder,
    this.selected = false,
    this.autofocus = false,
    this.color,
    this.outlined = true,
    this.padding = const EdgeInsets.all(14),
  });

  final VoidCallback onTap;
  final Widget Function(BuildContext context, bool focused) builder;
  final bool selected;
  final bool autofocus;
  final Color? color;
  final bool outlined;
  final EdgeInsetsGeometry padding;

  @override
  State<_SyncCard> createState() => _SyncCardState();
}

class _SyncCardState extends State<_SyncCard> {
  bool _focused = false;

  void _onFocusChange(bool focused) {
    setState(() => _focused = focused);
    if (!focused) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Scrollable.ensureVisible(
        context,
        alignment: 0.15,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final focusVisible = InputModeTracker.showFocusVisuals(context, _focused);
    final accent = AppColorScheme.accent;
    final borders = ThemeRegistry.active.borders;
    final radius = AppRadius.circular(16);

    final Color fill;
    if (_inverts(focusVisible)) {
      fill = AppColorScheme.buttonFocused;
    } else if (widget.selected) {
      fill = accent.withValues(alpha: 0.14);
    } else {
      fill = widget.color ?? Theme.of(context).colorScheme.surfaceContainerLow;
    }

    final Color edge;
    if (focusVisible) {
      edge = accent.withValues(alpha: 0.72);
    } else if (widget.selected) {
      edge = accent;
    } else if (widget.outlined) {
      edge = AppColorScheme.onSurface.withValues(alpha: 0.16);
    } else {
      edge = Colors.transparent;
    }

    return Semantics(
      selected: widget.selected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: fill,
          borderRadius: radius,
          border: Border.all(color: edge, width: widget.selected ? 2 : 1),
          boxShadow: focusVisible
              ? (borders.focusGlow.isNotEmpty
                    ? borders.focusGlow
                    : [
                        BoxShadow(
                          color: accent.withValues(alpha: 0.22),
                          blurRadius: 14,
                          spreadRadius: 0.5,
                        ),
                      ])
              : null,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            autofocus: widget.autofocus,
            onTap: widget.onTap,
            onFocusChange: _onFocusChange,
            borderRadius: radius,
            focusColor: Colors.transparent,
            child: Padding(
              padding: widget.padding,
              child: widget.builder(context, focusVisible),
            ),
          ),
        ),
      ),
    );
  }
}
