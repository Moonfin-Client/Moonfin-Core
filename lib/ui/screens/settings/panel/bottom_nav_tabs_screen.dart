part of '../settings_side_panel.dart';

/// Which tabs sit between Home and You on the mobile bottom navbar. Until the
/// user pins something the bar picks them from the nav button switches, and
/// this screen shows that choice as the starting point.
class _BottomNavTabsScreen extends StatefulWidget {
  const _BottomNavTabsScreen();

  @override
  State<_BottomNavTabsScreen> createState() => _BottomNavTabsScreenState();
}

class _BottomNavTabsScreenState extends State<_BottomNavTabsScreen> {
  final _prefs = GetIt.instance<UserPreferences>();

  BottomNavTabGates get _gates => BottomNavTabGates.fromPreferences(
        _prefs,
        seerrAvailable: GetIt.instance<PluginSyncService>().seerrAvailable,
      );

  String get _raw => _prefs.get(UserPreferences.bottomNavbarTabs);
  bool get _automatic => isAutomaticBottomNavTabs(_raw);

  // Explicit pins are listed even when their switch is off, so the user can
  // see why a tab went missing from the bar.
  List<BottomNavTab> get _pinned => _automatic
      ? _gates.resolvePins(_raw)
      : parsePinnedBottomNavTabs(_raw);

  Future<void> _write(List<BottomNavTab> pins) async {
    await _prefs.set(
      UserPreferences.bottomNavbarTabs,
      serializePinnedBottomNavTabs(pins),
    );
    _pushPersonalizationSync();
    if (mounted) setState(() {});
  }

  Future<void> _reset() async {
    await _prefs.removePreference(UserPreferences.bottomNavbarTabs);
    _pushPersonalizationSync();
    if (mounted) setState(() {});
  }

  void _move(List<BottomNavTab> pins, int from, int to) {
    final next = [...pins];
    next.insert(to, next.removeAt(from));
    _write(next);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final hint = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final gates = _gates;
    final pinned = _pinned;
    final full = pinned.length >= kMaxPinnedBottomNavTabs;
    final split = _prefs.get(UserPreferences.bottomNavbarStyle) ==
        BottomNavbarStyle.split;

    Widget icon(BottomNavTab tab, {required bool enabled}) =>
        bottomNavTabIconWidget(
          tab,
          active: false,
          size: 24,
          color: enabled
              ? theme.colorScheme.onSurface
              : theme.colorScheme.onSurface.withValues(alpha: 0.38),
        );

    return withCleanSettingsTypography(
      context,
      Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.bottomNavbarTabs)),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Text(l10n.bottomNavbarTabsDescription, style: hint),
            ),
            if (split)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Text(l10n.bottomNavbarSplitSearchNote, style: hint),
              ),
            _SectionHeader(
              _automatic
                  ? '${l10n.bottomNavbarTabsPinned} · '
                      '${l10n.bottomNavbarTabsAutomatic}'
                  : l10n.bottomNavbarTabsPinned,
            ),
            adaptiveListSection(
              children: [
                for (var i = 0; i < pinned.length; i++)
                  ListTile(
                    leading: icon(pinned[i], enabled: gates.offers(pinned[i])),
                    title: Text(bottomNavTabLabel(l10n, pinned[i])),
                    subtitle: gates.offers(pinned[i])
                        ? null
                        : Text(l10n.bottomNavbarTabTurnedOff),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: l10n.moveUp,
                          icon: const Icon(Icons.keyboard_arrow_up),
                          onPressed: i == 0
                              ? null
                              : () => _move(pinned, i, i - 1),
                        ),
                        IconButton(
                          tooltip: l10n.moveDown,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onPressed: i == pinned.length - 1
                              ? null
                              : () => _move(pinned, i, i + 1),
                        ),
                        // The bar always keeps one tab between Home and You.
                        IconButton(
                          tooltip: l10n.remove,
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: pinned.length <= 1
                              ? null
                              : () => _write([...pinned]..removeAt(i)),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            _SectionHeader(l10n.bottomNavbarTabsAvailable),
            if (full)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(l10n.bottomNavbarTabsLimit, style: hint),
              ),
            adaptiveListSection(
              children: [
                for (final tab in BottomNavTab.values)
                  if (!pinned.contains(tab))
                    ListTile(
                      enabled: gates.offers(tab) && !full,
                      leading: icon(tab, enabled: gates.offers(tab) && !full),
                      title: Text(bottomNavTabLabel(l10n, tab)),
                      subtitle: gates.offers(tab)
                          ? null
                          : Text(l10n.bottomNavbarTabTurnedOff),
                      trailing: const Icon(Icons.push_pin_outlined),
                      onTap: () => _write([...pinned, tab]),
                    ),
              ],
            ),
            if (!_automatic)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton.icon(
                    onPressed: _reset,
                    icon: const Icon(Icons.restart_alt),
                    label: Text(l10n.bottomNavbarTabsReset),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
