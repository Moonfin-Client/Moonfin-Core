import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../playback/native_game_player.dart';
import '../../../util/game_cores.dart';
import '../../../util/game_storage.dart';
import '../../widgets/focus/dpad_list_tile.dart';
import '../../widgets/overlay_sheet.dart';

/// Emulator settings for a core that is not running.
///
/// The in-game options menu needs a loaded session, so a core that will not
/// start was previously unconfigurable -- including by the very setting that
/// would fix it. Reads definitions with [NativeGamePlayer.probeOptions] and
/// writes the same blob the in-game menu does.
class EmulatorCoreSettingsScreen extends StatefulWidget {
  const EmulatorCoreSettingsScreen({
    super.key,
    required this.coreId,
    required this.system,
  });

  final String coreId;

  /// The user-facing system name ("Nintendo 64"), for the title.
  final String system;

  @override
  State<EmulatorCoreSettingsScreen> createState() =>
      _EmulatorCoreSettingsScreenState();
}

class _EmulatorCoreSettingsScreenState
    extends State<EmulatorCoreSettingsScreen> {
  final MediaServerClient _client = GetIt.instance<MediaServerClient>();

  List<GameCoreOption> _options = const [];
  Map<String, String> _values = {};
  bool _loading = true;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final corePath = await installedCorePath(widget.coreId);
      if (corePath == null) {
        if (!mounted) return;
        setState(() {
          _loading = false;
          _error = 'This core is not downloaded yet.';
        });
        return;
      }
      final systemDir = await GameStorage.systemDir();
      final player = NativeGamePlayer.create();
      final probed = await player.probeOptions(corePath, systemDir.path);

      // Saved values win over defaults, as a real load does.
      final games = _client.gamesApi;
      final saved = games == null
          ? const <String, String>{}
          : await readCoreSettings(games, widget.coreId);

      if (!mounted) return;
      setState(() {
        _options = probed;
        _values = {
          for (final o in probed) o.id: saved[o.id] ?? o.current,
        };
        _loading = false;
        // Empty covers both "the core has no options" and "this platform
        // cannot probe" -- only Android implements it so far. Reset still
        // works either way, so point at that rather than dead-ending.
        // TODO: Localize this.
        _error = probed.isEmpty
            ? 'This core\'s settings cannot be read on this device. '
                'You can still reset them to defaults below.'
            : null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Could not read this core\'s settings.';
      });
    }
  }

  /// Opens [option]'s values as a radio list, using the same d-pad pattern as
  /// the download settings.
  Future<void> _pickChoice(GameCoreOption option) async {
    final current = _values[option.id] ?? option.current;
    final chosen = await showFocusRestoringModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(ctx).height * 0.9,
          ),
          child: DpadRadioGroup<String>(
            groupValue: current,
            onChanged: (v) => Navigator.pop(ctx, v),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Text(
                    option.label,
                    style: Theme.of(ctx).textTheme.titleMedium,
                  ),
                ),
                for (final choice in option.choices)
                  DpadRadioListTile<String>(
                    autofocus: choice == current,
                    title: Text(choice),
                    value: choice,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
    if (chosen == null || chosen == current || !mounted) return;
    setState(() => _values[option.id] = chosen);
    await _save();
  }

  Future<void> _save() async {
    final games = _client.gamesApi;
    if (games == null) return;
    setState(() => _saving = true);
    try {
      await writeCoreSettings(games, widget.coreId, _values);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not save these settings.')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _resetToDefaults() async {
    final games = _client.gamesApi;
    if (games == null) return;
    setState(() => _saving = true);
    try {
      await resetCoreSettings(games, widget.coreId);
      if (!mounted) return;
      // Show what the next load will actually use.
      setState(() {
        _values = {for (final o in _options) o.id: o.current};
        _saving = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings reset to defaults.')),
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not reset these settings.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.system} settings'),
        actions: [
          if (_saving)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _WarningBanner(theme: theme),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(_error!, style: theme.textTheme.bodyLarge),
                  ),
                Expanded(
                  child: ListView(
                    children: [
                      for (final option in _options)
                        ListTile(
                          title: Text(option.label),
                          subtitle: Text(_values[option.id] ?? option.current),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: _saving ? null : () => _pickChoice(option),
                        ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: OutlinedButton.icon(
                      onPressed: _saving ? null : _resetToDefaults,
                      icon: const Icon(Icons.settings_backup_restore),
                      label: const Text('Reset to defaults'),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

/// Cores run in-process, so a bad value can stop a game starting or take the
/// app down with it. Say so before anything is changed.
class _WarningBanner extends StatelessWidget {
  const _WarningBanner({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final color = theme.colorScheme.tertiaryContainer;
    return Container(
      width: double.infinity,
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: theme.colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'These are the emulator core\'s own settings. Some combinations '
              'can stop a game from starting, or close the app while it runs. '
              'If something breaks, use Reset to defaults below.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
