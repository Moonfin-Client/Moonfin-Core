part of '../settings_side_panel.dart';

class _PanelEntry {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PanelEntry({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}

class _PanelEntryTile extends StatelessWidget {
  final _PanelEntry entry;

  const _PanelEntryTile({required this.entry});

  @override
  Widget build(BuildContext context) {
    return _TvSettingsListTile(
      leading: Icon(entry.icon),
      title: Text(entry.title),
      subtitle: Text(entry.subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: entry.onTap,
    );
  }
}

class _TvSettingsListTile extends StatefulWidget {
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  /// The preference the tile picks or opens an editor for, so the live
  /// preview can show it.
  final String? previewKey;

  const _TvSettingsListTile({
    super.key,
    this.focusNode,
    this.autofocus = false,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.previewKey,
  });

  @override
  State<_TvSettingsListTile> createState() => _TvSettingsListTileState();
}

class _TvSettingsListTileState extends State<_TvSettingsListTile> {
  late final FocusNode _focusNode;
  late final bool _ownsFocusNode;

  void _invokeTap() {
    final onTap = widget.onTap;
    if (onTap != null) onTap();
  }

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
      _ownsFocusNode = false;
    } else {
      _focusNode = FocusNode();
      _ownsFocusNode = true;
    }
  }

  @override
  void dispose() {
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resolvedTrailing =
        widget.trailing ??
        (widget.onTap != null ? const Icon(Icons.chevron_right) : null);
    return SettingsPreviewReporter(
      describe: () => SettingsPreviewEntry(
        prefKey: widget.previewKey,
        title: _plainText(widget.title) ?? '',
        description: _plainText(widget.subtitle),
      ),
      child: _buildTile(resolvedTrailing),
    );
  }

  static String? _plainText(Widget? widget) =>
      widget is Text ? (widget.data ?? widget.textSpan?.toPlainText()) : null;

  Widget _buildTile(Widget? resolvedTrailing) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (!event.logicalKey.isSelectKey) return KeyEventResult.ignored;
        if (event is KeyDownEvent) {
          _invokeTap();
        }
        return KeyEventResult.handled;
      },
      child: TvFocusHighlight(
        builder: (context, focused) {
          final highlighted = focused && settingsTileInvertsOnFocus;
          return ListTile(
            focusNode: _focusNode,
            autofocus: widget.autofocus,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            leading: widget.leading != null
                ? buildSettingsLeadingIconShell(
                    context,
                    icon: widget.leading!,
                    focused: focused,
                    iconColor: highlighted
                        ? AppColors.black.withValues(alpha: 0.54)
                        : AppColorScheme.onSurface.withValues(alpha: 0.78),
                  )
                : null,
            title: DefaultTextStyle.merge(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: highlighted
                    ? AppColors.black.withValues(alpha: 0.87)
                    : settingsHeadlineColor(),
              ),
              child: widget.title,
            ),
            subtitle: widget.subtitle != null
                ? DefaultTextStyle.merge(
                    style: TextStyle(
                      fontSize: 12,
                      color: highlighted
                          ? AppColors.black.withValues(alpha: 0.54)
                          : AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    child: widget.subtitle!,
                  )
                : null,
            trailing: resolvedTrailing != null
                ? IconTheme(
                    data: IconThemeData(
                      size: 20,
                      color: highlighted
                          ? AppColors.black.withValues(alpha: 0.54)
                          : AppColorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    child: resolvedTrailing,
                  )
                : null,
            onTap: _invokeTap,
          );
        },
      ),
    );
  }
}

class _SectionHeader extends SettingsSectionHeader {
  const _SectionHeader(super.text);
}

void _pushPersonalizationSync() {
  final syncService = GetIt.instance<PluginSyncService>();
  if (syncService.pluginAvailable) {
    syncService.pushSettings(GetIt.instance<MediaServerClient>());
  }
}

void _reloadHomeRows() {
  if (!GetIt.instance.isRegistered<HomeViewModel>()) return;
  GetIt.instance<HomeViewModel>().load(preserveExisting: true);
}

String _formatCamelCaseLabel(String camelCase) {
  final buf = StringBuffer();
  for (var i = 0; i < camelCase.length; i++) {
    final c = camelCase[i];
    if (i == 0) {
      buf.write(c.toUpperCase());
    } else if (c == c.toUpperCase() && c != c.toLowerCase()) {
      buf.write(' ');
      buf.write(c);
    } else {
      buf.write(c);
    }
  }
  return buf.toString();
}

void _ensureSettingsTileVisible(
  BuildContext context, {
  double alignment = 0.9,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted) return;
    Scrollable.ensureVisible(
      context,
      alignment: alignment,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
    );
  });
}
