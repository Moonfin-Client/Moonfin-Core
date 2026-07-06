part of '../settings_side_panel.dart';

class _PanelEntry {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final FocusNode? focusNode;

  const _PanelEntry({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.focusNode,
  });
}

class _PanelEntryTile extends StatelessWidget {
  final _PanelEntry entry;

  const _PanelEntryTile({required this.entry});

  @override
  Widget build(BuildContext context) {
    return _TvSettingsListTile(
      focusNode: entry.focusNode,
      autofocus: entry.focusNode != null,
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

  const _TvSettingsListTile({
    this.focusNode,
    this.autofocus = false,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
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

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
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
