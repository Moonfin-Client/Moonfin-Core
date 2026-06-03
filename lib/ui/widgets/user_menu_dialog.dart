import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../auth/models/server.dart';
import '../../auth/models/user.dart';
import '../../auth/repositories/server_repository.dart';
import '../../auth/repositories/session_repository.dart';
import '../../auth/repositories/user_repository.dart';
import '../../auth/store/authentication_store.dart';
import '../../l10n/app_localizations.dart';
import '../../util/platform_detection.dart';
import '../navigation/destinations.dart';
import '../screens/settings/settings_side_panel.dart';
import 'overlay_sheet.dart';
import 'remote_control_dialog.dart';
import 'settings/settings_panel.dart';

enum _AccountDialogAction { quickConnect }

void showUserMenu(BuildContext context) {
  showFocusRestoringDialog<_AccountDialogAction>(
    context: context,
    builder: (_) => const _AccountDialog(),
  ).then((action) {
    if (action != _AccountDialogAction.quickConnect) return;
    if (!context.mounted) return;
    _showQuickConnectCodeDialog(context);
  });
}

class _StoredAccount {
  final Server server;
  final PrivateUser user;

  const _StoredAccount({required this.server, required this.user});
}

class _AccountDialog extends StatefulWidget {
  const _AccountDialog();

  @override
  State<_AccountDialog> createState() => _AccountDialogState();
}

class _AccountDialogState extends State<_AccountDialog> {
  static const _danger = Color(0xFFC62828);

  final _serverRepo = GetIt.instance<ServerRepository>();
  final _authStore = GetIt.instance<AuthenticationStore>();
  final _sessionRepo = GetIt.instance<SessionRepository>();

  final _accounts = <_StoredAccount>[];

  bool _busy = false;

  String? get _activeServerId => _sessionRepo.activeServerId;
  String? get _activeUserId => _sessionRepo.activeUserId;

  @override
  void initState() {
    super.initState();
    _loadAccounts();
  }

  Future<void> _loadAccounts() async {
    await _serverRepo.loadStoredServers();
    final loaded = <_StoredAccount>[];
    for (final server in _serverRepo.servers) {
      final users = _authStore.getUsers(server.id)
        ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));
      for (final user in users) {
        loaded.add(_StoredAccount(server: server, user: user));
      }
    }

    if (!mounted) return;
    setState(() {
      _accounts
        ..clear()
        ..addAll(loaded);
    });
  }

  bool _isActive(_StoredAccount account) {
    return account.server.id == _activeServerId &&
        account.user.id == _activeUserId;
  }

  String? _avatarUrl(_StoredAccount account) {
    final apiKey = account.user.accessToken;
    if (apiKey.isEmpty) return null;

    final base =
        '${account.server.address}/Users/${account.user.id}/Images/Primary?quality=90&maxHeight=180&api_key=$apiKey';
    final tag = account.user.imageTag;
    if (tag == null || tag.isEmpty) {
      return base;
    }
    return '$base&tag=$tag';
  }

  Future<void> _switchAccount(_StoredAccount account) async {
    if (_busy) return;

    if (_isActive(account)) {
      if (mounted) Navigator.of(context).pop();
      return;
    }

    setState(() => _busy = true);
    final ok = await _sessionRepo.switchCurrentSession(
      serverId: account.server.id,
      userId: account.user.id,
    );

    if (!mounted) return;
    setState(() => _busy = false);
    final router = GoRouter.of(context);

    if (ok) {
      Navigator.of(context).pop();
      router.go('${Destinations.startup}?bootstrap=1');
      return;
    }

    Navigator.of(context).pop();
    router.go(
      '${Destinations.login}?serverId=${account.server.id}&username=${Uri.encodeComponent(account.user.name)}',
    );
  }

  Future<void> _signOutCurrent() async {
    if (_busy) return;
    setState(() => _busy = true);
    await _sessionRepo.destroyCurrentSession();

    if (!mounted) return;
    Navigator.of(context).pop();
    context.go(Destinations.serverSelect);
  }

  Future<void> _signOutAll() async {
    if (_busy) return;
    setState(() => _busy = true);

    await _sessionRepo.destroyCurrentSession();
    await _serverRepo.loadStoredServers();
    final serverIds = _serverRepo.servers.map((s) => s.id).toList();
    for (final id in serverIds) {
      await _serverRepo.deleteServer(id);
    }

    if (!mounted) return;
    Navigator.of(context).pop();
    context.go(Destinations.serverSelect);
  }

  void _addUser() {
    final activeServer = _activeServerId;
    final router = GoRouter.of(context);
    Navigator.of(context).pop();
    if (activeServer != null && activeServer.isNotEmpty) {
      router.go('${Destinations.server}?serverId=$activeServer');
      return;
    }
    router.go(Destinations.serverSelect);
  }

  void _changeServer() {
    final router = GoRouter.of(context);
    Navigator.of(context).pop();
    router.go(Destinations.serverSelect);
  }

  Widget _buildPairedActionButtons({
    required Widget first,
    required Widget second,
  }) {
    if (PlatformDetection.isMobile) {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 76,
              child: first,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 76,
              child: second,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: first),
        const SizedBox(width: 10),
        Expanded(child: second),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final focusColor = Theme.of(context).colorScheme.primary;
    final activeIndex = _accounts.indexWhere(_isActive);
    final initialAccountFocusIndex = activeIndex >= 0 ? activeIndex : 0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 520,
          maxWidth: 800,
          maxHeight: 760,
        ),
        decoration: BoxDecoration(
          color: AppColorScheme.surface.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.fromBorderSide(ThemeRegistry.active.borders.chipBorder),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.switchUser,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColorScheme.onSurface,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (!PlatformDetection.isTV)
                      _CircleActionButton(
                        icon: Icons.close,
                        onPressed: _busy ? null : () => Navigator.of(context).pop(),
                        focusColor: focusColor,
                      ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: AppColorScheme.onSurface.withValues(alpha: 0.08),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 228,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final cards = <Widget>[
                        for (var index = 0; index < _accounts.length; index++) ...[
                          if (index > 0) const SizedBox(width: 20),
                          _AccountCard(
                            username: _accounts[index].user.name,
                            serverName: _accounts[index].server.name,
                            avatarUrl: _avatarUrl(_accounts[index]),
                            active: _isActive(_accounts[index]),
                            autofocus: index == initialAccountFocusIndex,
                            onTap: _busy ? null : () => _switchAccount(_accounts[index]),
                            focusColor: focusColor,
                          ),
                        ],
                        if (_accounts.isNotEmpty) const SizedBox(width: 20),
                        _AddUserCard(
                          label: l10n.addUser,
                          autofocus: _accounts.isEmpty,
                          onTap: _busy ? null : _addUser,
                          focusColor: focusColor,
                        ),
                      ];

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: constraints.maxWidth),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: cards,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PlatformDetection.isWeb
                    ? SizedBox(
                        width: double.infinity,
                        child: _ActionButton(
                          label: l10n.signOut,
                          onPressed: _busy ? null : _signOutCurrent,
                          focusColor: focusColor,
                        ),
                      )
                    : _buildPairedActionButtons(
                        first: _ActionButton(
                          label: l10n.selectServer,
                          onPressed: _busy ? null : _changeServer,
                          focusColor: focusColor,
                        ),
                        second: _ActionButton(
                          label: l10n.signOut,
                          onPressed: _busy ? null : _signOutCurrent,
                          focusColor: focusColor,
                        ),
                      ),
              ),
              if (_accounts.length > 1) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: _ActionButton(
                      label: l10n.signOutAllUsers,
                      onPressed: _busy ? null : _signOutAll,
                      focusColor: _danger,
                    ),
                  ),
                ),
              ],
              if (!PlatformDetection.isTV) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: _ActionButton(
                      label: l10n.settings,
                      onPressed: _busy
                          ? null
                          : () async {
                              Navigator.of(context).pop();
                              if (!context.mounted) return;
                              await SettingsPanel.open(
                                context,
                                const SettingsSidePanel(),
                              );
                            },
                      focusColor: focusColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: _buildPairedActionButtons(
                    first: _ActionButton(
                      label: l10n.quickConnect,
                      onPressed: _busy
                          ? null
                          : () => Navigator.of(
                              context,
                            ).pop(_AccountDialogAction.quickConnect),
                      focusColor: focusColor,
                    ),
                    second: _ActionButton(
                      label: l10n.remoteControl,
                      onPressed: _busy
                          ? null
                          : () {
                              Navigator.of(context).pop();
                              showRemoteControlDialog(context);
                            },
                      focusColor: focusColor,
                    ),
                  ),
                ),
                if (!PlatformDetection.isWeb) ...[
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: double.infinity,
                      child: _ActionButton(
                        label: l10n.savedMedia,
                        onPressed: _busy
                            ? null
                            : () {
                                Navigator.of(context).pop();
                                context.navigateTopLevel(Destinations.downloads);
                              },
                        focusColor: focusColor,
                      ),
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showQuickConnectCodeDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context);
  final code = await _promptQuickConnectCode(context);
  if (code == null || code.isEmpty || !context.mounted) return;

  final messenger = ScaffoldMessenger.of(context);

  try {
    final client = GetIt.instance<MediaServerClient>();
    final userId = GetIt.instance<UserRepository>().currentUser?.id;
    final authorized = await client.authApi.authorizeQuickConnect(
      code,
      userId: userId,
    );

    if (!context.mounted) return;

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          authorized
              ? l10n.quickConnectAuthorized
              : l10n.quickConnectInvalidOrExpired,
        ),
      ),
    );
  } on UnsupportedError {
    messenger.showSnackBar(
      SnackBar(content: Text(l10n.quickConnectNotSupported)),
    );
  } on DioException catch (e) {
    final message = _quickConnectErrorMessage(e, l10n);
    messenger.showSnackBar(SnackBar(content: Text(message)));
  } catch (_) {
    messenger.showSnackBar(
      SnackBar(content: Text(l10n.quickConnectAuthorizeFailed)),
    );
  }
}

String _quickConnectErrorMessage(DioException e, AppLocalizations l10n) {
  final status = e.response?.statusCode;
  final data = e.response?.data;
  final serverMessage = data is String
      ? data
      : (data is Map<String, dynamic>
            ? (data['message'] ?? data['Message'])?.toString()
            : null);

  if (status == 401) {
    return l10n.quickConnectDisabled;
  }

  if (status == 403) {
    return serverMessage ?? l10n.quickConnectForbidden;
  }

  if (status == 404) {
    return l10n.quickConnectNotFound;
  }

  if (serverMessage != null && serverMessage.isNotEmpty) {
    return l10n.quickConnectFailedWithMessage(serverMessage);
  }

  return l10n.quickConnectAuthorizeFailed;
}

Future<String?> _promptQuickConnectCode(BuildContext context) async {
  final l10n = AppLocalizations.of(context);
  final controller = TextEditingController();

  String normalizedCode() => controller.text.replaceAll(RegExp(r'\D'), '');

  final code = await showFocusRestoringDialog<String>(
    context: context,
    useRootNavigator: true,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColorScheme.surface.withValues(alpha: 0.9),
      title: Text(
        l10n.quickConnect,
        style: TextStyle(color: AppColorScheme.onSurface),
      ),
      content: TextField(
        controller: controller,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(8),
        ],
        style: TextStyle(color: AppColorScheme.onSurface),
        decoration: InputDecoration(
          hintText: l10n.quickConnectEnterCode,
          hintStyle: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        onSubmitted: (_) {
          final value = normalizedCode();
          if (value.isNotEmpty) Navigator.pop(ctx, value);
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () {
            final value = normalizedCode();
            if (value.isNotEmpty) Navigator.pop(ctx, value);
          },
          child: Text(l10n.quickConnectAuthorize),
        ),
      ],
    ),
  );

  controller.dispose();
  return code;
}

class _CircleActionButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color focusColor;

  const _CircleActionButton({
    required this.icon,
    required this.onPressed,
    required this.focusColor,
  });

  @override
  State<_CircleActionButton> createState() => _CircleActionButtonState();
}

class _CircleActionButtonState extends State<_CircleActionButton> {
  final _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (mounted) setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final focusBorder = ThemeRegistry.active.borders.focusBorder;
    final baseBorder = ThemeRegistry.active.borders.chipBorder;
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onPressed?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: enabled
                ? (_focused
                      ? widget.focusColor.withValues(alpha: 0.16)
                      : AppColorScheme.onSurface.withValues(alpha: 0.06))
                : AppColorScheme.onSurface.withValues(alpha: 0.04),
            border: Border.fromBorderSide(
              _focused
                  ? focusBorder.copyWith(color: widget.focusColor)
                  : baseBorder.copyWith(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.12),
                    ),
            ),
          ),
          child: Icon(
            widget.icon,
            color: enabled
                ? (_focused ? widget.focusColor : AppColorScheme.onSurface)
                : AppColorScheme.onSurface.withValues(alpha: 0.45),
            size: 22,
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color focusColor;

  const _ActionButton({
    required this.label,
    required this.onPressed,
    required this.focusColor,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  final _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (mounted) setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final focusBorder = ThemeRegistry.active.borders.focusBorder;
    final baseBorder = ThemeRegistry.active.borders.chipBorder;
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onPressed?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          constraints: const BoxConstraints(minHeight: 52),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: enabled
                ? (_focused
                      ? widget.focusColor.withValues(alpha: 0.16)
                      : AppColorScheme.onSurface.withValues(alpha: 0.08))
                : AppColorScheme.onSurface.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.fromBorderSide(
              enabled
                  ? (_focused
                        ? focusBorder.copyWith(color: widget.focusColor)
                        : baseBorder.copyWith(
                            color: AppColorScheme.onSurface.withValues(alpha: 0.12),
                          ))
                  : baseBorder.copyWith(
                      color: AppColorScheme.onSurface.withValues(alpha: 0.08),
                    ),
            ),
            boxShadow: _focused
                ? [
                    BoxShadow(
                      color: widget.focusColor.withValues(alpha: 0.35),
                      blurRadius: 0,
                      spreadRadius: 3,
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              widget.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: enabled
                    ? (_focused ? widget.focusColor : AppColorScheme.onSurface)
                    : AppColorScheme.onSurface.withValues(alpha: 0.45),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AccountCard extends StatefulWidget {
  final String username;
  final String serverName;
  final String? avatarUrl;
  final bool active;
  final bool autofocus;
  final VoidCallback? onTap;
  final Color focusColor;

  const _AccountCard({
    required this.username,
    required this.serverName,
    required this.avatarUrl,
    required this.active,
    required this.autofocus,
    required this.onTap,
    required this.focusColor,
  });

  @override
  State<_AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<_AccountCard> {
  final _focusNode = FocusNode();
  bool _focused = false;
  bool _avatarFailed = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (mounted) setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  void didUpdateWidget(covariant _AccountCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.avatarUrl != widget.avatarUrl) {
      _avatarFailed = false;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _focused
        ? widget.focusColor
        : AppColorScheme.onSurface.withValues(alpha: 0.15);

    return Focus(
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onTap?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 120),
          scale: _focused ? 1.06 : 1,
          child: SizedBox(
            width: 140,
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: borderColor, width: 3),
                    color: AppColorScheme.surfaceVariant,
                  ),
                  child: ClipOval(
                    child: _avatarFailed || widget.avatarUrl == null
                        ? Icon(
                            Icons.person,
                            color: AppColorScheme.onSurface.withValues(alpha: 0.55),
                            size: 68,
                          )
                        : Image.network(
                            widget.avatarUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) {
                              if (!_avatarFailed) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                      if (mounted) {
                                        setState(() => _avatarFailed = true);
                                      }
                                    });
                              }
                              return Icon(
                                Icons.person,
                                color: AppColorScheme.onSurface.withValues(alpha: 0.55),
                                size: 68,
                              );
                            },
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.serverName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColorScheme.onSurface.withValues(alpha: 0.45),
                  ),
                ),
                const SizedBox(height: 4),
                if (widget.active)
                  Text(
                    'ACTIVE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: AppColorScheme.accent,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddUserCard extends StatefulWidget {
  final String label;
  final bool autofocus;
  final VoidCallback? onTap;
  final Color focusColor;

  const _AddUserCard({
    required this.label,
    required this.autofocus,
    required this.onTap,
    required this.focusColor,
  });

  @override
  State<_AddUserCard> createState() => _AddUserCardState();
}

class _AddUserCardState extends State<_AddUserCard> {
  final _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (mounted) setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _focused
        ? widget.focusColor
      : AppColorScheme.onSurface.withValues(alpha: 0.25);
    final bg = _focused
        ? widget.focusColor.withValues(alpha: 0.14)
      : AppColorScheme.onSurface.withValues(alpha: 0.06);

    return Focus(
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent &&
            (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onTap?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 120),
          scale: _focused ? 1.06 : 1,
          child: SizedBox(
            width: 140,
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bg,
                    border: Border.all(color: borderColor, width: 3),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 48,
                    color: _focused
                        ? widget.focusColor
                        : AppColorScheme.onSurface.withValues(alpha: 0.54),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
