import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../../auth/models/server.dart';
import '../../auth/models/user.dart';
import '../../auth/repositories/server_repository.dart';
import '../../auth/repositories/session_repository.dart';
import '../../auth/repositories/user_repository.dart';
import '../../auth/services/silo_household.dart';
import '../../auth/store/authentication_store.dart';
import '../../data/services/media_server_client_factory.dart';
import '../../l10n/app_localizations.dart';
import '../../data/services/pin_guard.dart';
import '../../data/services/server_pin_service.dart';
import '../../util/platform_detection.dart';
import '../../util/signed_in_server_features.dart';
import '../../util/silo_failure_message.dart';
import '../navigation/destinations.dart';
import 'adaptive/adaptive_dialog.dart';
import '../screens/auth/silo_profile_unlock.dart';
import '../screens/settings/settings_side_panel.dart';
import 'navigation_layout.dart';
import 'overlay_sheet.dart';
import 'pin_entry_dialog.dart';
import 'remote_control_dialog.dart';
import 'settings/settings_panel.dart';
import 'profile_carousel.dart';

enum _AccountDialogAction { quickConnect }

void showUserMenu(BuildContext context) {
  final shown = PlatformDetection.useMobileUi
      ? showFocusRestoringModalBottomSheet<_AccountDialogAction>(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          showDragHandle: true,
          backgroundColor: AppColorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (_) => const _AccountDialog(),
        )
      : showFocusRestoringDialog<_AccountDialogAction>(
          context: context,
          barrierColor: Colors.transparent,
          useSafeArea: false,
          builder: (_) => const _AccountDialog(),
        );
  shown.then((action) {
    if (action != _AccountDialogAction.quickConnect) return;
    if (!context.mounted) return;
    showQuickConnectCodeDialog(context);
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
  final _carouselFocus = FocusNode();
  int _selected = 0;

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
      final active = _accounts.indexWhere(_isActive);
      _selected = active < 0 ? 0 : active;
    });
    if (_accounts.isNotEmpty && !PlatformDetection.useMobileUi) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _carouselFocus.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _carouselFocus.dispose();
    super.dispose();
  }

  bool _isActive(_StoredAccount account) {
    return account.server.id == _activeServerId &&
        account.user.id == _activeUserId;
  }

  String? _avatarUrl(_StoredAccount account) {
    final apiKey = account.user.accessToken;
    if (apiKey.isEmpty) return null;

    if (!account.server.serverType.hasJellyfinUserImagePath) {
      if (!GetIt.instance.isRegistered<MediaServerClientFactory>()) return null;
      return siloProfileImageUrl(
        GetIt.instance<MediaServerClientFactory>(),
        serverId: account.server.id,
        userId: account.user.id,
      );
    }

    final base =
        '${account.server.address}/Users/${account.user.id}/Images/Primary?quality=90&maxHeight=180&${account.server.serverType.tokenQueryParam}=$apiKey';
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

    // Held through the PIN lookup and dialog too, or another account could be
    // picked while this one is still being asked for.
    setState(() => _busy = true);
    try {
      await _switchVerifiedAccount(account);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _switchVerifiedAccount(_StoredAccount account) async {
    final guard = PinGuard.forAccount(
      store: GetIt.instance<PreferenceStore>(),
      service: GetIt.instance<ServerPinService>(),
      userId: account.user.id,
      serverAddress: account.server.address,
      accessToken: account.user.accessToken,
    );
    await guard.refresh();
    if (!mounted) return;

    if (guard.pin.isPinEnabled) {
      final verified = await PinEntryDialog.show(
        context,
        mode: PinEntryMode.verify,
        onVerifyAsync: guard.verify,
        onForgotPin: () {
          if (mounted) {
            Navigator.of(context).pop();
            GoRouter.of(context).go(
              '${Destinations.login}?serverId=${account.server.id}&username=${Uri.encodeComponent(account.user.name)}&resetPin=1',
            );
          }
        },
      );
      if (!verified) return;
    }

    // A Silo profile locked with a PIN asks for it first.
    if (account.user.siloHasPin) {
      if (!mounted) return;
      final unlocked = await unlockSiloProfileIfNeeded(
        context,
        server: account.server,
        user: account.user,
      );
      if (!unlocked || !mounted) return;
    }

    final ok = await _sessionRepo.switchCurrentSession(
      serverId: account.server.id,
      userId: account.user.id,
    );
    if (!mounted) return;
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

  /// Signs every stored profile of the active Silo account out and ends
  /// its login. "Sign out" leaves the account's other profiles.
  Future<void> _signOutSiloAccount() async {
    if (_busy) return;
    setState(() => _busy = true);
    await _sessionRepo.signOutSiloAccount();

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

  _StoredAccount? get _activeAccount => _accounts.where(_isActive).firstOrNull;

  ProfileEntry _entryFor(_StoredAccount account) => ProfileEntry(
    id: account.user.id,
    name: account.user.name,
    avatarUrl: _avatarUrl(account),
    badge: _isActive(account)
        ? ProfileBadge.active
        : account.user.siloHasPin
        ? ProfileBadge.pin
        : ProfileBadge.none,
  );

  Widget _buildAccountSubtitle(_StoredAccount account) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileStatusLine(
          '${account.server.name} · ${account.server.serverType.productName}',
        ),
        if (_isActive(account)) ...[
          const SizedBox(height: 4),
          ProfileStatusLine(
            l10n.accountActive,
            color: Theme.of(context).colorScheme.primary,
          ),
        ] else if (account.user.siloHasPin) ...[
          const SizedBox(height: 4),
          ProfileStatusLine(l10n.pinRequired, icon: Icons.lock_outline),
        ],
      ],
    );
  }

  List<Widget> _buildActions({required bool compact}) {
    final l10n = AppLocalizations.of(context);
    final focusColor = Theme.of(context).colorScheme.primary;
    final activeIsSilo =
        GetIt.instance.isRegistered<MediaServerClient>() &&
        GetIt.instance<MediaServerClient>().serverType == ServerType.silo;
    // The bottom navbar hub has these already.
    final showAppActions =
        !PlatformDetection.isTV && !NavigationLayout.usesBottomNavbar;

    Widget action(
      String label,
      VoidCallback onPressed, {
      IconData? icon,
      bool danger = false,
    }) => _ActionButton(
      label: label,
      icon: icon,
      danger: danger,
      compact: compact,
      onPressed: _busy ? null : onPressed,
      focusColor: danger ? _danger : focusColor,
    );

    return [
      // Phones add a user from the + at the end of the avatar row.
      if (!compact) action(l10n.addUser, _addUser, icon: Icons.person),
      if (!PlatformDetection.isWeb)
        action(l10n.selectServer, _changeServer, icon: Icons.home),
      action(l10n.signOut, _signOutCurrent),
      if (_sessionRepo.activeUserHasSiloSiblings)
        action(l10n.siloSignOutAccount, _signOutSiloAccount),
      if (_accounts.length > 1)
        action(l10n.signOutAllUsers, _signOutAll, danger: true),
      if (showAppActions) ...[
        action(l10n.settings, () async {
          Navigator.of(context).pop();
          if (!context.mounted) return;
          await SettingsPanel.open(context, const SettingsSidePanel());
        }),
        action(
          activeIsSilo ? l10n.siloApproveSignIn : l10n.quickConnect,
          () => Navigator.of(context).pop(_AccountDialogAction.quickConnect),
        ),
        if (activeServerSupports((f) => f.supportsRemoteControl))
          action(l10n.remoteControl, () {
            Navigator.of(context).pop();
            showRemoteControlDialog(context);
          }),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) =>
      PlatformDetection.useMobileUi ? _buildSheet(context) : _buildWide(context);

  Widget _buildWide(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onSurface = AppColorScheme.onSurface;
    final active = _activeAccount;
    return Material(
      color: const Color(0xE605070E),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(48, 28, 48, 32),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    l10n.switchUser,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: onSurface,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: active == null
                        ? const SizedBox.shrink()
                        : Text(
                            l10n.signedInAsOnServer(
                              active.user.name,
                              active.server.name,
                            ),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: onSurface.withValues(alpha: 0.65),
                            ),
                          ),
                  ),
                  if (!PlatformDetection.isTV) ...[
                    const SizedBox(width: 16),
                    _CircleActionButton(
                      icon: Icons.close,
                      onPressed: _busy ? null : () => Navigator.of(context).pop(),
                      focusColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ],
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ProfileCarousel(
                      entries: [for (final a in _accounts) _entryFor(a)],
                      selected: _selected,
                      focusNode: _carouselFocus,
                      onSelected: (index) => setState(() => _selected = index),
                      onActivate: (index) => _switchAccount(_accounts[index]),
                      subtitle: _accounts.isEmpty
                          ? null
                          : _buildAccountSubtitle(_accounts[_selected]),
                    ),
                  ),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: _buildActions(compact: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selected = _accounts.isEmpty ? null : _accounts[_selected];
    final entries = [for (final a in _accounts) _entryFor(a)];
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
                _CircleActionButton(
                  icon: Icons.close,
                  onPressed: _busy ? null : () => Navigator.of(context).pop(),
                  focusColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (selected != null) ...[
              ProfileHero(
                entry: entries[_selected],
                subtitle: _buildAccountSubtitle(selected),
                onPrevious: _selected > 0
                    ? () => setState(() => _selected--)
                    : null,
                onNext: _selected < _accounts.length - 1
                    ? () => setState(() => _selected++)
                    : null,
              ),
              const SizedBox(height: 24),
            ],
            ProfileStrip(
              entries: entries,
              selected: _selected,
              onSelected: (index) => setState(() => _selected = index),
              onAdd: _busy ? null : _addUser,
              addLabel: l10n.addUser,
            ),
            if (selected != null) ...[
              const SizedBox(height: 20),
              ProfilePrimaryButton(
                label: _isActive(selected)
                    ? l10n.continueAsUser(selected.user.name)
                    : l10n.switchToUser(selected.user.name),
                onPressed: _busy ? null : () => _switchAccount(selected),
              ),
            ],
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: _buildActions(compact: true),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showQuickConnectCodeDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context);
  final client = GetIt.instance<MediaServerClient>();
  // Silo calls it approving a sign-in, with the code another device shows.
  final silo = client.serverType == ServerType.silo;
  final code = await _promptQuickConnectCode(context, silo: silo);
  if (code == null || code.isEmpty || !context.mounted) return;

  final messenger = ScaffoldMessenger.of(context);

  try {
    final userId = GetIt.instance<UserRepository>().currentUser?.id;
    final authorized = await client.authApi.authorizeQuickConnect(
      code,
      userId: userId,
    );

    if (!context.mounted) return;

    messenger.showSnackBar(
      SnackBar(
        content: Text(switch ((authorized, silo)) {
          (true, false) => l10n.quickConnectAuthorized,
          (false, false) => l10n.quickConnectInvalidOrExpired,
          (true, true) => l10n.siloApproveSignInDone,
          (false, true) => l10n.siloApproveSignInNoRequest,
        }),
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
  final siloFailure = SiloFailure.of(e);
  if (siloFailure != null) return siloFailure.message(l10n);
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

Future<String?> _promptQuickConnectCode(
  BuildContext context, {
  bool silo = false,
}) => showFocusRestoringDialog<String>(
  context: context,
  useRootNavigator: true,
  builder: (_) => _QuickConnectCodeDialog(silo: silo),
);

/// Asks for the code another device shows. Owns its text controller, so the
/// controller lives as long as the field: the dialog's closing animation
/// still rebuilds the field after the code was returned, and a controller
/// disposed by the caller at that point fails the build (a red error screen
/// on approve and on a wrong code).
class _QuickConnectCodeDialog extends StatefulWidget {
  const _QuickConnectCodeDialog({required this.silo});

  final bool silo;

  @override
  State<_QuickConnectCodeDialog> createState() =>
      _QuickConnectCodeDialogState();
}

class _QuickConnectCodeDialogState extends State<_QuickConnectCodeDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final value = _controller.text.replaceAll(RegExp(r'\D'), '');
    if (value.isNotEmpty) Navigator.pop(context, value);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final silo = widget.silo;
    return AlertDialog.adaptive(
      backgroundColor: AppColorScheme.surface.withValues(alpha: 0.9),
      title: Text(
        silo ? l10n.siloApproveSignIn : l10n.quickConnect,
        style: TextStyle(color: AppColorScheme.onSurface),
      ),
      content: TextField(
        controller: _controller,
        autofocus: true,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(8),
        ],
        style: TextStyle(color: AppColorScheme.onSurface),
        decoration: InputDecoration(
          hintText: silo
              ? l10n.siloApproveSignInHint
              : l10n.quickConnectEnterCode,
          hintStyle: TextStyle(
            color: AppColorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        adaptiveDialogAction(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(
            silo ? l10n.siloApproveSignInApprove : l10n.quickConnectAuthorize,
          ),
        ),
      ],
    );
  }
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
      // Focus follows the pointer so hover lights this up the same way
      // the remote does, and arrow keys carry on from where the mouse is.
      child: MouseRegion(
        cursor: widget.onPressed != null
            ? SystemMouseCursors.click
            : MouseCursor.defer,
        onEnter: (_) {
          if (widget.onPressed != null) _focusNode.requestFocus();
        },
        child: GestureDetector(
          onTap: widget.onPressed == null
              ? null
              : () {
                  _focusNode.requestFocus();
                  widget.onPressed!();
                },
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
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final bool danger;
  final bool compact;
  final VoidCallback? onPressed;
  final Color focusColor;

  const _ActionButton({
    required this.label,
    this.icon,
    this.danger = false,
    this.compact = false,
    required this.onPressed,
    required this.focusColor,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  static const _dangerText = Color(0xFFF87171);

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
    final restColor = widget.danger ? _dangerText : AppColorScheme.onSurface;
    final color = !enabled
        ? AppColorScheme.onSurface.withValues(alpha: 0.45)
        : (_focused ? widget.focusColor : restColor);
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
      // Focus follows the pointer so hover lights this up the same way
      // the remote does, and arrow keys carry on from where the mouse is.
      child: MouseRegion(
        cursor: widget.onPressed != null
            ? SystemMouseCursors.click
            : MouseCursor.defer,
        onEnter: (_) {
          if (widget.onPressed != null) _focusNode.requestFocus();
        },
        child: GestureDetector(
          onTap: widget.onPressed == null
              ? null
              : () {
                  _focusNode.requestFocus();
                  widget.onPressed!();
                },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            height: widget.compact ? 40 : 44,
            padding: EdgeInsets.symmetric(horizontal: widget.compact ? 16 : 20),
            decoration: BoxDecoration(
              color: enabled
                  ? (_focused
                        ? widget.focusColor.withValues(alpha: 0.16)
                        : AppColorScheme.onSurface.withValues(alpha: 0.06))
                  : AppColorScheme.onSurface.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(999),
              border: Border.fromBorderSide(
                enabled
                    ? (_focused
                          ? focusBorder.copyWith(color: widget.focusColor)
                          : baseBorder.copyWith(
                              color: restColor.withValues(
                                alpha: widget.danger ? 0.45 : 0.2,
                              ),
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, size: 18, color: color),
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Text(
                    widget.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: widget.compact ? 14 : 15,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
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
