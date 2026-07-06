import 'package:custom_tv_text_field/custom_tv_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/plugin_sync_service.dart';
import '../../../data/services/seerr/seerr_models.dart';
import '../../../l10n/app_localizations.dart';
import '../../../preference/preference_constants.dart';
import '../../../preference/seerr_preferences.dart';
import '../../../preference/seerr_row_config.dart';
import '../../../preference/user_preferences.dart';
import '../../../util/focus/dpad_keys.dart';
import '../../../util/platform_detection.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../widgets/focus/request_initial_focus.dart';
import '../../widgets/settings/clean_settings_typography.dart';
import '../../widgets/settings/preference_tiles.dart';
import 'settings_app_bar.dart';

typedef _SeerrSignInAction =
    Future<String?> Function(String username, String password, String authType);
typedef _SeerrAction = Future<String?> Function();

class SeerrConfigScreen extends StatefulWidget {
  const SeerrConfigScreen({super.key});

  @override
  State<SeerrConfigScreen> createState() => _SeerrConfigScreenState();
}

class _SeerrConfigScreenState extends State<SeerrConfigScreen> {
  late final PluginSyncService _syncService;
  late final SeerrPreferences _seerrPrefs;

  MoonfinStatusResponse? _seerrStatus;
  bool _statusLoading = false;
  late List<SeerrRowConfig> _rows;
  final _focusNodes = <FocusNode>[];

  final _enableSeerrFocusNode = FocusNode(debugLabel: 'seerrEnableSeerr');
  final _accountCardFocusNode = FocusNode(debugLabel: 'seerrAccountCard');
  final _refreshFocusNode = FocusNode(debugLabel: 'seerrRefresh');

  @override
  void initState() {
    super.initState();
    _syncService = GetIt.instance<PluginSyncService>();
    _seerrPrefs = GetIt.instance<SeerrPreferences>();
    _rows = List.of(_seerrPrefs.rowsConfig);
    _rebuildFocusNodes();
    _syncService.addListener(_onSyncStateChanged);
    _loadSeerrStatus(showLoading: true);

    _enableSeerrFocusNode.onKeyEvent = (node, event) {
      if (event is! KeyDownEvent) return KeyEventResult.ignored;
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        final seerrAvailable =
            _syncService.pluginAvailable && _syncService.seerrEnabled;
        final showSeerrSettings = seerrAvailable && _seerrPrefs.enabled;
        if (showSeerrSettings) {
          _accountCardFocusNode.requestFocus();
          return KeyEventResult.handled;
        }
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        final seerrAvailable =
            _syncService.pluginAvailable && _syncService.seerrEnabled;
        final showSeerrSettings = seerrAvailable && _seerrPrefs.enabled;
        if (showSeerrSettings) {
          _refreshFocusNode.requestFocus();
          return KeyEventResult.handled;
        }
      }
      return KeyEventResult.ignored;
    };

    _refreshFocusNode.onKeyEvent = (node, event) {
      if (event is! KeyDownEvent) return KeyEventResult.ignored;
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _enableSeerrFocusNode.requestFocus();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    };
  }

  @override
  void dispose() {
    _syncService.removeListener(_onSyncStateChanged);
    for (final n in _focusNodes) {
      n.dispose();
    }
    _enableSeerrFocusNode.dispose();
    _accountCardFocusNode.dispose();
    _refreshFocusNode.dispose();
    super.dispose();
  }

  void _onSyncStateChanged() {
    if (!mounted) return;
    setState(() {
      _rows = List.of(_seerrPrefs.rowsConfig);
      _rebuildFocusNodes();
    });
    _loadSeerrStatus();
  }

  Future<void> _loadSeerrStatus({bool showLoading = false}) async {
    if (!_syncService.pluginAvailable || !_syncService.seerrEnabled) {
      if (!mounted) return;
      setState(() {
        _seerrStatus = null;
        _statusLoading = false;
      });
      return;
    }

    if (showLoading && mounted) {
      setState(() => _statusLoading = true);
    }

    MoonfinStatusResponse? status = _seerrStatus;
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      status = await repo.checkMoonfinStatus();
    } catch (_) {}

    if (!mounted) return;
    setState(() {
      _seerrStatus = status;
      _statusLoading = false;
    });
  }

  String? _extractSeerrError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final apiError = data['error'];
      if (apiError is String && apiError.trim().isNotEmpty) {
        return apiError.trim();
      }
    }
    if (data is String && data.trim().isNotEmpty) {
      return data.trim();
    }
    return null;
  }

  Future<String?> _signInToSeerr(
    String username,
    String password,
    String authType,
  ) async {
    final l10n = AppLocalizations.of(context);
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      final response = await repo.loginWithMoonbase(
        username: username,
        password: password,
        authType: authType,
      );

      if (!response.success) {
        return response.error ?? l10n.loginFailed;
      }

      await _seerrPrefs.setEnabled(true);
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.seerrEnabled,
        true,
      );
      await _pushSync();
      await _loadSeerrStatus();
      return null;
    } on DioException catch (error) {
      return _extractSeerrError(error) ?? l10n.loginFailed;
    } catch (_) {
      return l10n.loginFailed;
    }
  }

  Future<String?> _signOutFromSeerr() async {
    final l10n = AppLocalizations.of(context);
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      await repo.logoutMoonfin();
      await _seerrPrefs.setEnabled(false);
      await GetIt.instance<UserPreferences>().set(
        UserPreferences.seerrEnabled,
        false,
      );
      await _pushSync();
      await _loadSeerrStatus();
      return null;
    } on DioException catch (error) {
      return _extractSeerrError(error) ?? l10n.loginFailed;
    } catch (_) {
      return l10n.loginFailed;
    }
  }

  Future<void> _pushSync() async {
    if (!_syncService.pluginAvailable) return;
    final client = GetIt.instance<MediaServerClient>();
    await _syncService.pushSettings(client);
  }

  Future<void> _saveRows() async {
    for (var i = 0; i < _rows.length; i++) {
      _rows[i] = _rows[i].copyWith(order: i);
    }
    await _seerrPrefs.setRowsConfig(_rows);
    await _pushSync();
  }

  Future<void> _setBlockNsfw(bool value) async {
    await _seerrPrefs.setBlockNsfw(value);
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _setSeerrEnabled(bool value) async {
    await _seerrPrefs.setEnabled(value);
    await GetIt.instance<UserPreferences>().set(
      UserPreferences.seerrEnabled,
      value,
    );
    await _pushSync();
    await _loadSeerrStatus(showLoading: true);
  }

  Future<void> _resetRows() async {
    setState(() {
      _rows = SeerrRowConfig.defaults();
      _rebuildFocusNodes();
    });
    await _saveRows();
  }

  void _rebuildFocusNodes() {
    if (_focusNodes.length == _rows.length) return;
    for (final n in _focusNodes) {
      n.dispose();
    }
    _focusNodes.clear();
    for (var i = 0; i < _rows.length; i++) {
      _focusNodes.add(FocusNode(debugLabel: 'seerr_row_$i'));
    }
  }

  void _moveSeerrRowTo(int index, int newIndex) {
    if (newIndex < 0 || newIndex >= _rows.length || index == newIndex) {
      return;
    }
    setState(() {
      final item = _rows.removeAt(index);
      _rows.insert(newIndex, item);
      final node = _focusNodes.removeAt(index);
      _focusNodes.insert(newIndex, node);
    });
    _saveRows();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNodes[newIndex].requestFocus();
      }
    });
  }

  String _rowLabel(SeerrRowType type, AppLocalizations l10n) => switch (type) {
    SeerrRowType.recentRequests => l10n.recentRequests,
    SeerrRowType.recentlyAdded => l10n.recentlyAdded,
    SeerrRowType.trending => l10n.trending,
    SeerrRowType.popularMovies => l10n.popularMovies,
    SeerrRowType.movieGenres => l10n.movieGenres,
    SeerrRowType.upcomingMovies => l10n.upcomingMovies,
    SeerrRowType.studios => l10n.studios,
    SeerrRowType.popularSeries => l10n.popularSeries,
    SeerrRowType.seriesGenres => l10n.seriesGenres,
    SeerrRowType.upcomingSeries => l10n.upcomingSeries,
    SeerrRowType.networks => l10n.networks,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final seerrAvailable =
        _syncService.pluginAvailable && _syncService.seerrEnabled;
    final showSeerrSettings = seerrAvailable && _seerrPrefs.enabled;

    return RequestInitialFocus(
      targetNode: _enableSeerrFocusNode,
      child: Scaffold(
        appBar: buildSettingsAppBar(
          context,
          Text(l10n.seerr),
          actions: showSeerrSettings
              ? [
                  IconButton(
                    focusNode: _refreshFocusNode,
                    icon: const Icon(Icons.restore),
                    tooltip: l10n.resetRowsToDefaults,
                    onPressed: _resetRows,
                  ),
                ]
              : const [],
        ),
        body: withCleanSettingsTypography(
          context,
          PlatformDetection.isTV
              ? _buildTvRows(l10n, seerrAvailable, showSeerrSettings)
              : _buildReorderableRows(l10n, seerrAvailable, showSeerrSettings),
        ),
      ),
    );
  }

  Widget _buildRowsHeader(
    BuildContext context,
    AppLocalizations l10n,
    bool seerrAvailable,
    bool showSeerrSettings,
  ) {
    return Column(
      children: [
        if (seerrAvailable)
          TvFocusHighlight(
            builder: (context, focused) => SwitchListTile.adaptive(
              focusNode: _enableSeerrFocusNode,
              secondary: Icon(
                Icons.movie_filter,
                color: focused ? AppColors.black.withValues(alpha: 0.54) : null,
              ),
              title: Text(
                l10n.enableSeerr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.87)
                      : AppColorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                l10n.showSeerrInNavigation,
                style: TextStyle(
                  fontSize: 12,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.54)
                      : AppColorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              value: _seerrPrefs.enabled,
              onChanged: _setSeerrEnabled,
            ),
          )
        else
          ListTile(
            leading: const Icon(Icons.movie_filter_outlined),
            title: Text(l10n.enableSeerr),
            subtitle: Text(l10n.seerrUnavailable),
          ),
        if (showSeerrSettings)
          _SeerrLoginCard(
            status: _seerrStatus,
            statusLoading: _statusLoading,
            onSignIn: _signInToSeerr,
            onSignOut: _signOutFromSeerr,
            firstFocusNode: _accountCardFocusNode,
            onMoveUp: () => _enableSeerrFocusNode.requestFocus(),
          ),
        if (showSeerrSettings)
          TvFocusHighlight(
            builder: (context, focused) => SwitchListTile.adaptive(
              secondary: Icon(
                Icons.visibility_off,
                color: focused ? AppColors.black.withValues(alpha: 0.54) : null,
              ),
              title: Text(
                l10n.nsfwFilter,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.87)
                      : AppColorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                l10n.hideAdultContent,
                style: TextStyle(
                  fontSize: 12,
                  color: focused
                      ? AppColors.black.withValues(alpha: 0.54)
                      : AppColorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              value: _seerrPrefs.blockNsfw,
              onChanged: _setBlockNsfw,
            ),
          ),
        if (showSeerrSettings)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l10n.discoverRows.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        if (showSeerrSettings)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _syncService.pluginAvailable
                    ? l10n.discoverRowsDescriptionPlugin
                    : l10n.discoverRowsDescription,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTvRows(
    AppLocalizations l10n,
    bool seerrAvailable,
    bool showSeerrSettings,
  ) {
    return ListView.builder(
      itemCount: (showSeerrSettings ? _rows.length : 0) + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildRowsHeader(
            context,
            l10n,
            seerrAvailable,
            showSeerrSettings,
          );
        }
        final rowIndex = index - 1;
        final row = _rows[rowIndex];
        return _SeerrReorderableTile(
          key: ValueKey(row.type),
          focusNode: _focusNodes[rowIndex],
          label: _rowLabel(row.type, l10n),
          enabled: row.enabled,
          enabledLabel: l10n.enabled,
          hiddenLabel: l10n.hidden,
          isFirst: rowIndex == 0,
          isLast: rowIndex == _rows.length - 1,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (rowIndex != 0) const Icon(Icons.arrow_left, size: 18),
              if (rowIndex != _rows.length - 1)
                const Icon(Icons.arrow_right, size: 18),
            ],
          ),
          onToggle: (enabled) {
            setState(() {
              _rows[rowIndex] = row.copyWith(enabled: enabled);
            });
            _saveRows();
          },
          onMoveUp: () => _moveSeerrRowTo(rowIndex, rowIndex - 1),
          onMoveDown: () => _moveSeerrRowTo(rowIndex, rowIndex + 1),
        );
      },
    );
  }

  Widget _buildReorderableRows(
    AppLocalizations l10n,
    bool seerrAvailable,
    bool showSeerrSettings,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      children: [
        Builder(
          builder: (context) => _buildRowsHeader(
            context,
            l10n,
            seerrAvailable,
            showSeerrSettings,
          ),
        ),
        if (showSeerrSettings)
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: false,
            itemCount: _rows.length,
            onReorder: (oldIndex, newIndex) {
              if (newIndex > oldIndex) newIndex--;
              _moveSeerrRowTo(oldIndex, newIndex);
            },
            itemBuilder: (context, rowIndex) {
              final row = _rows[rowIndex];
              return _SeerrReorderableTile(
                key: ValueKey(row.type),
                focusNode: _focusNodes[rowIndex],
                label: _rowLabel(row.type, l10n),
                enabled: row.enabled,
                enabledLabel: l10n.enabled,
                hiddenLabel: l10n.hidden,
                isFirst: rowIndex == 0,
                isLast: rowIndex == _rows.length - 1,
                trailing: PlatformDetection.useMobileUi
                    ? ReorderableDelayedDragStartListener(
                        index: rowIndex,
                        child: Icon(
                          Icons.drag_handle,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      )
                    : ReorderableDragStartListener(
                        index: rowIndex,
                        child: Icon(
                          Icons.drag_handle,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                onToggle: (enabled) {
                  setState(() {
                    _rows[rowIndex] = row.copyWith(enabled: enabled);
                  });
                  _saveRows();
                },
                onMoveUp: () => _moveSeerrRowTo(rowIndex, rowIndex - 1),
                onMoveDown: () => _moveSeerrRowTo(rowIndex, rowIndex + 1),
              );
            },
          ),
      ],
    );
  }
}

class _SeerrLoginCard extends StatefulWidget {
  final MoonfinStatusResponse? status;
  final bool statusLoading;
  final _SeerrSignInAction onSignIn;
  final _SeerrAction onSignOut;
  final FocusNode firstFocusNode;
  final VoidCallback onMoveUp;

  const _SeerrLoginCard({
    required this.status,
    required this.statusLoading,
    required this.onSignIn,
    required this.onSignOut,
    required this.firstFocusNode,
    required this.onMoveUp,
  });

  @override
  State<_SeerrLoginCard> createState() => _SeerrLoginCardState();
}

class _SeerrLoginCardState extends State<_SeerrLoginCard> {
  final _userPreferences = GetIt.instance<UserPreferences>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocus = FocusNode(debugLabel: 'seerr_username');
  final _passwordFocus = FocusNode(debugLabel: 'seerr_password');
  final _localAuthFocus = FocusNode(debugLabel: 'seerr_auth_local');
  final _signInFocus = FocusNode(debugLabel: 'seerr_sign_in');
  final _signInButtonFocus = FocusNode(
    canRequestFocus: false,
    debugLabel: 'seerr_sign_in_btn',
  );
  final _signOutButtonFocus = FocusNode(
    canRequestFocus: false,
    debugLabel: 'seerr_sign_out_btn',
  );
  final _usernameTvFieldKey = GlobalKey<CustomTVTextFieldState>();
  final _passwordTvFieldKey = GlobalKey<CustomTVTextFieldState>();

  String _authType = 'jellyfin';
  bool _submitting = false;
  String? _errorMessage;

  BoxDecoration _boxDecoration(BuildContext context, {required bool focused}) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderTokens = ThemeRegistry.active.borders;
    final baseBorder = borderTokens.cardBorder.color;
    final unfocusedBorderColor = baseBorder.a == 0
        ? AppColorScheme.onSurface.withValues(alpha: 0.16)
        : baseBorder.withValues(alpha: 0.55);

    return BoxDecoration(
      color: colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
      borderRadius: AppRadius.circular(16),
      border: Border.fromBorderSide(
        (focused ? borderTokens.focusBorder : borderTokens.cardBorder).copyWith(
          color: focused
              ? AppColorScheme.accent.withValues(alpha: 0.72)
              : unfocusedBorderColor,
          width: 1.0,
        ),
      ),
      boxShadow: focused
          ? (borderTokens.focusGlow.isNotEmpty
                ? borderTokens.focusGlow
                : [
                    BoxShadow(
                      color: AppColorScheme.accent.withValues(alpha: 0.22),
                      blurRadius: 14,
                      spreadRadius: 0.5,
                    ),
                  ])
          : null,
    );
  }

  bool get _canSignIn {
    return !_submitting && _usernameController.text.trim().isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_onCredentialChanged);
    _passwordController.addListener(_onCredentialChanged);
  }

  @override
  void didUpdateWidget(covariant _SeerrLoginCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    final wasAuthenticated = oldWidget.status?.authenticated ?? false;
    final isAuthenticated = widget.status?.authenticated ?? false;
    if (!wasAuthenticated && isAuthenticated) {
      _passwordController.clear();
      if (_errorMessage != null) {
        setState(() => _errorMessage = null);
      }
    }

    if (wasAuthenticated != isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final scope = FocusScope.of(context);
        final focusedChild = scope.focusedChild;
        final hasFocusInside =
            focusedChild != null &&
            (focusedChild == widget.firstFocusNode ||
                focusedChild == _usernameFocus ||
                focusedChild == _passwordFocus ||
                focusedChild == _localAuthFocus ||
                focusedChild == _signInFocus);

        if (!hasFocusInside) return;

        if (isAuthenticated) {
          widget.firstFocusNode.requestFocus();
          _ensureFocusVisible(widget.firstFocusNode, alignment: 0.22);
        } else {
          final authFocus = _authType == 'local'
              ? _localAuthFocus
              : widget.firstFocusNode;
          authFocus.requestFocus();
          _ensureFocusVisible(authFocus, alignment: 0.16);
        }
      });
    }
  }

  @override
  void dispose() {
    _usernameController.removeListener(_onCredentialChanged);
    _passwordController.removeListener(_onCredentialChanged);
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _localAuthFocus.dispose();
    _signInFocus.dispose();
    _signInButtonFocus.dispose();
    _signOutButtonFocus.dispose();
    super.dispose();
  }

  void _setAuthType(String authType) {
    if (!mounted) return;
    if (_authType == authType && _errorMessage == null) return;
    setState(() {
      _authType = authType;
      _errorMessage = null;
    });
  }

  void _onCredentialChanged() {
    if (!mounted) return;
    setState(() {
      if (_errorMessage != null) {
        _errorMessage = null;
      }
    });
  }

  Future<void> _submitSignIn() async {
    if (!_canSignIn) return;
    setState(() {
      _submitting = true;
      _errorMessage = null;
    });

    final error = await widget.onSignIn(
      _usernameController.text.trim(),
      _passwordController.text,
      _authType,
    );

    if (!mounted) return;
    setState(() {
      _submitting = false;
      _errorMessage = error;
      if (error == null) {
        _passwordController.clear();
      }
    });
  }

  Future<void> _submitSignOut() async {
    if (_submitting) return;
    setState(() {
      _submitting = true;
      _errorMessage = null;
    });

    final error = await widget.onSignOut();

    if (!mounted) return;
    setState(() {
      _submitting = false;
      _errorMessage = error;
    });
  }

  bool _handleTvFieldOpen(KeyEvent event, FocusNode focusNode) {
    if (!PlatformDetection.isTV || _submitting) return false;
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) return false;

    final fieldKey = focusNode == _usernameFocus
        ? _usernameTvFieldKey
        : _passwordTvFieldKey;

    if (event.logicalKey.isBackKey) {
      if (event is KeyDownEvent &&
          (fieldKey.currentState?.isKeyboardVisible ?? false)) {
        fieldKey.currentState?.closeKeyboard();
        focusNode.requestFocus();
        return true;
      }
      return false;
    }

    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      if (!focusNode.hasFocus) focusNode.requestFocus();
      fieldKey.currentState?.openKeyboard();
      return true;
    }

    return false;
  }

  void _handleTvKeyboardVisibility(
    bool visible,
    GlobalKey<CustomTVTextFieldState> fieldKey,
  ) {
    if (!visible) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fieldContext = fieldKey.currentContext;
      if (fieldContext == null || !mounted) return;
      Scrollable.ensureVisible(
        fieldContext,
        alignment: 0.12,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
    });
  }

  void _ensureFocusVisible(FocusNode node, {double alignment = 0.16}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final focusContext = node.context;
      if (focusContext == null) return;
      Scrollable.ensureVisible(
        focusContext,
        alignment: alignment,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
      );
    });
  }

  KeyEventResult _onUsernameKey(FocusNode node, KeyEvent event) {
    if (_handleTvFieldOpen(event, node)) {
      return KeyEventResult.handled;
    }
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _passwordFocus.requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      if (_authType == 'local') {
        _localAuthFocus.requestFocus();
      } else {
        widget.firstFocusNode.requestFocus();
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult _onAuthOptionKey(
    KeyEvent event, {
    required String currentAuthType,
    FocusNode? leftFocus,
    FocusNode? rightFocus,
  }) {
    if (_submitting) return KeyEventResult.ignored;
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      if (leftFocus != null) {
        leftFocus.requestFocus();
        _setAuthType('jellyfin');
      }
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      if (rightFocus != null) {
        rightFocus.requestFocus();
        _setAuthType('local');
      }
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      _setAuthType(currentAuthType);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _usernameFocus.requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      widget.onMoveUp();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult _onJellyfinAuthKey(FocusNode node, KeyEvent event) {
    return _onAuthOptionKey(
      event,
      currentAuthType: 'jellyfin',
      rightFocus: _localAuthFocus,
    );
  }

  KeyEventResult _onLocalAuthKey(FocusNode node, KeyEvent event) {
    return _onAuthOptionKey(
      event,
      currentAuthType: 'local',
      leftFocus: widget.firstFocusNode,
    );
  }

  KeyEventResult _onPasswordKey(FocusNode node, KeyEvent event) {
    if (_handleTvFieldOpen(event, node)) {
      return KeyEventResult.handled;
    }
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _signInFocus.requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      _usernameFocus.requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult _onSignInKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      _submitSignIn();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      _passwordFocus.requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  KeyEventResult _onSignOutKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.select) {
      _submitSignOut();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  Widget _buildCredentialsField({
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
    required GlobalKey<CustomTVTextFieldState> tvFieldKey,
    required TextFieldType tvType,
    required bool obscureText,
    required TextInputAction textInputAction,
    required TextInputType keyboardType,
    required VoidCallback onSubmitted,
    required KeyEventResult Function(FocusNode, KeyEvent) onTvKey,
    Iterable<String>? autofillHints,
  }) {
    if (PlatformDetection.isTV) {
      final colorScheme = Theme.of(context).colorScheme;
      return Focus(
        focusNode: focusNode,
        onKeyEvent: onTvKey,
        child: ListenableBuilder(
          listenable: focusNode,
          builder: (_, _) {
            final focused = focusNode.hasFocus;
            return CustomTVTextField(
              key: tvFieldKey,
              controller: controller,
              isFocused: focused,
              inputPurpose: switch (tvType) {
                TextFieldType.url => InputPurpose.url,
                TextFieldType.email => InputPurpose.email,
                TextFieldType.number ||
                TextFieldType.phone => InputPurpose.numeric,
                TextFieldType.password => InputPurpose.password,
                TextFieldType.username => InputPurpose.username,
                _ => InputPurpose.text,
              },
              preferSystemIme: _userPreferences.get(
                UserPreferences.preferSystemImeKeyboard,
              ),
              hint: label,
              textFieldType: tvType,
              keyboardType: KeyboardType.alphabetic,
              filled: true,
              fillColor: focused
                  ? colorScheme.primaryContainer
                  : colorScheme.surfaceContainerHighest.scaleAlpha(0.6),
              borderColor: colorScheme.outline,
              focusedBorderColor: AppColorScheme.accent,
              hintStyle: TextStyle(
                fontFamily: kCleanSettingsFontFamily,
                color: colorScheme.onSurface.withValues(alpha: 0.65),
              ),
              textStyle: TextStyle(
                fontFamily: kCleanSettingsFontFamily,
                color: colorScheme.onSurface,
              ),
              popParentOnKeyboardClose: false,
              onFieldSubmitted: (_) => onSubmitted(),
              onVisibilityChanged: (visible) =>
                  _handleTvKeyboardVisibility(visible, tvFieldKey),
            );
          },
        ),
      );
    }

    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      enabled: !_submitting,
      onSubmitted: (_) => onSubmitted(),
      autofillHints: obscureText
          ? const [AutofillHints.password]
          : autofillHints,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: AppRadius.circular(12)),
      ),
    );
  }

  Widget _buildAuthOption({
    required String authType,
    required String label,
    required FocusNode focusNode,
    KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Focus(
      focusNode: focusNode,
      onKeyEvent: onKeyEvent,
      onFocusChange: (focused) {
        if (focused) {
          _ensureFocusVisible(focusNode, alignment: 0.16);
        }
        if (!PlatformDetection.isTV ||
            !focused ||
            _submitting ||
            _authType == authType) {
          return;
        }
        _setAuthType(authType);
      },
      child: ListenableBuilder(
        listenable: focusNode,
        builder: (_, _) {
          final selected = _authType == authType;
          final focused = focusNode.hasFocus;
          final selectedBackground = AppColorScheme.accent.withValues(
            alpha: 0.22,
          );
          final idleBackground = colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.65,
          );
          final focusedBackground = AppColorScheme.accent.withValues(
            alpha: 0.16,
          );
          final selectedBorder = AppColorScheme.accent;
          final focusedBorder = AppColorScheme.accent;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            constraints: const BoxConstraints(minHeight: 52),
            decoration: BoxDecoration(
              color: selected
                  ? selectedBackground
                  : (focused ? focusedBackground : idleBackground),
              borderRadius: AppRadius.circular(12),
              border: Border.all(
                color: focused
                    ? focusedBorder
                    : (selected ? selectedBorder : colorScheme.outline),
                width: focused ? 2.5 : 1.2,
              ),
            ),
            child: InkWell(
              borderRadius: AppRadius.circular(12),
              onTap: _submitting
                  ? null
                  : () {
                      _setAuthType(authType);
                      focusNode.requestFocus();
                    },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Center(
                  child: Text(
                    label,
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: kCleanSettingsFontFamily,
                      color: selected
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.onSurface,
                      fontWeight: selected || focused
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAuthTypeSelector(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: FocusTraversalOrder(
            order: const NumericFocusOrder(0),
            child: _buildAuthOption(
              authType: 'jellyfin',
              label: l10n.jellyfinAccount,
              focusNode: widget.firstFocusNode,
              onKeyEvent: PlatformDetection.isTV ? _onJellyfinAuthKey : null,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: FocusTraversalOrder(
            order: const NumericFocusOrder(0.1),
            child: _buildAuthOption(
              authType: 'local',
              label: l10n.localAccount,
              focusNode: _localAuthFocus,
              onKeyEvent: PlatformDetection.isTV ? _onLocalAuthKey : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingCard(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Card(
        child: ListTile(
          leading: const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          title: Text(l10n.seerrAccountType),
          subtitle: Text(l10n.signIn),
        ),
      ),
    );
  }

  Widget _buildUnavailableCard(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.movie_filter_outlined),
          title: Text(l10n.seerr),
          subtitle: Text(l10n.seerrUnavailable),
        ),
      ),
    );
  }

  Widget _buildAuthenticatedCard(
    AppLocalizations l10n,
    MoonfinStatusResponse status,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final displayName = status.displayName?.trim();
    final username = (displayName != null && displayName.isNotEmpty)
        ? displayName
        : l10n.seerr;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
      child: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: Container(
          decoration: _boxDecoration(context, focused: false),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.seerrAccountType,
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.82),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.account_circle_outlined),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  l10n.loggedInAs(username),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: colorScheme.onSurface,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    FocusTraversalOrder(
                      order: const NumericFocusOrder(1),
                      child: ListenableBuilder(
                        listenable: widget.firstFocusNode,
                        builder: (context, _) {
                          final isFocused = widget.firstFocusNode.hasFocus;
                          return Focus(
                            focusNode: widget.firstFocusNode,
                            onKeyEvent: (node, event) {
                              if (event is! KeyDownEvent) {
                                return KeyEventResult.ignored;
                              }
                              if (event.logicalKey ==
                                  LogicalKeyboardKey.arrowUp) {
                                widget.onMoveUp();
                                return KeyEventResult.handled;
                              }
                              return PlatformDetection.isTV
                                  ? _onSignOutKey(node, event)
                                  : KeyEventResult.ignored;
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 120),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.circular(24),
                                boxShadow: isFocused
                                    ? [
                                        BoxShadow(
                                          color: AppColorScheme.onSurface
                                              .withValues(alpha: 0.35),
                                          blurRadius: 10,
                                          spreadRadius: 1.5,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: FilledButton(
                                focusNode: PlatformDetection.isTV
                                    ? _signOutButtonFocus
                                    : null,
                                style: FilledButton.styleFrom(
                                  foregroundColor: colorScheme.onPrimary,
                                  backgroundColor: colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: AppRadius.circular(24),
                                  ),
                                  side: isFocused
                                      ? BorderSide(
                                          color: AppColorScheme.onSurface
                                              .withValues(alpha: 0.72),
                                          width: 2.0,
                                        )
                                      : BorderSide.none,
                                ),
                                onPressed: _submitting ? null : _submitSignOut,
                                child: _submitting
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(l10n.signOut),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      fontFamily: kCleanSettingsFontFamily,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInCard(AppLocalizations l10n) {
    final isLocalAuth = _authType == 'local';

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
      child: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: Container(
          decoration: _boxDecoration(context, focused: false),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.seerrAccountType,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 14),
                _buildAuthTypeSelector(l10n),
                const SizedBox(height: 12),
                FocusTraversalOrder(
                  order: const NumericFocusOrder(1),
                  child: _buildCredentialsField(
                    label: isLocalAuth ? l10n.email : l10n.username,
                    controller: _usernameController,
                    focusNode: _usernameFocus,
                    tvFieldKey: _usernameTvFieldKey,
                    tvType: TextFieldType.other,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: isLocalAuth
                        ? TextInputType.emailAddress
                        : TextInputType.text,
                    autofillHints: [
                      if (isLocalAuth)
                        AutofillHints.email
                      else
                        AutofillHints.username,
                    ],
                    onSubmitted: () => _passwordFocus.requestFocus(),
                    onTvKey: _onUsernameKey,
                  ),
                ),
                const SizedBox(height: 12),
                FocusTraversalOrder(
                  order: const NumericFocusOrder(2),
                  child: _buildCredentialsField(
                    label: l10n.password,
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    tvFieldKey: _passwordTvFieldKey,
                    tvType: TextFieldType.password,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    onSubmitted: _submitSignIn,
                    onTvKey: _onPasswordKey,
                  ),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      fontFamily: kCleanSettingsFontFamily,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
                const SizedBox(height: 14),
                Align(
                  alignment: Alignment.centerRight,
                  child: FocusTraversalOrder(
                    order: const NumericFocusOrder(3),
                    child: ListenableBuilder(
                      listenable: _signInFocus,
                      builder: (context, _) {
                        final isFocused = _signInFocus.hasFocus;
                        return Focus(
                          focusNode: _signInFocus,
                          onKeyEvent: PlatformDetection.isTV
                              ? _onSignInKey
                              : null,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 120),
                            decoration: BoxDecoration(
                              borderRadius: AppRadius.circular(24),
                              boxShadow: isFocused
                                  ? [
                                      BoxShadow(
                                        color: AppColorScheme.onSurface
                                            .withValues(alpha: 0.35),
                                        blurRadius: 10,
                                        spreadRadius: 1.5,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: FilledButton(
                              focusNode: PlatformDetection.isTV
                                  ? _signInButtonFocus
                                  : null,
                              onPressed: _canSignIn ? _submitSignIn : null,
                              style: FilledButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: AppRadius.circular(24),
                                ),
                                side: isFocused
                                    ? BorderSide(
                                        color: AppColorScheme.onSurface
                                            .withValues(alpha: 0.72),
                                        width: 2.0,
                                      )
                                    : BorderSide.none,
                              ),
                              child: _submitting
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(l10n.signIn),
                            ),
                          ),
                        );
                      },
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final status = widget.status;
    if (widget.statusLoading) {
      return _buildLoadingCard(l10n);
    }
    if (status != null && !status.enabled) {
      return _buildUnavailableCard(l10n);
    }
    if (status?.authenticated ?? false) {
      return _buildAuthenticatedCard(l10n, status!);
    }
    return _buildSignInCard(l10n);
  }
}

class _SeerrReorderableTile extends StatefulWidget {
  final FocusNode focusNode;
  final String label;
  final bool enabled;
  final String enabledLabel;
  final String hiddenLabel;
  final bool isFirst;
  final bool isLast;
  final Widget? trailing;
  final ValueChanged<bool> onToggle;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  const _SeerrReorderableTile({
    super.key,
    required this.focusNode,
    required this.label,
    required this.enabled,
    required this.enabledLabel,
    required this.hiddenLabel,
    required this.isFirst,
    required this.isLast,
    this.trailing,
    required this.onToggle,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  @override
  State<_SeerrReorderableTile> createState() => _SeerrReorderableTileState();
}

class _SeerrReorderableTileState extends State<_SeerrReorderableTile> {
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focused = widget.focusNode.hasFocus;
  }

  @override
  void didUpdateWidget(covariant _SeerrReorderableTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final hasFocus = widget.focusNode.hasFocus;
    if (_focused != hasFocus) {
      _focused = hasFocus;
    }
  }

  void _ensureFocusedTileVisible() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_focused) return;
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        alignment: 0.2,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      );
    });
  }

  BoxDecoration _tileDecoration(BuildContext context, {required bool focused}) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderTokens = ThemeRegistry.active.borders;
    final baseBorder = borderTokens.cardBorder.color;
    final unfocusedBorderColor = baseBorder.a == 0
        ? AppColorScheme.onSurface.withValues(alpha: 0.16)
        : baseBorder.withValues(alpha: 0.55);

    return BoxDecoration(
      color: focused
          ? AppColorScheme.onSurface
          : colorScheme.surfaceContainerLow.withValues(alpha: 0.82),
      borderRadius: AppRadius.circular(12),
      border: Border.fromBorderSide(
        (focused ? borderTokens.focusBorder : borderTokens.cardBorder).copyWith(
          color: focused
              ? AppColorScheme.accent.withValues(alpha: 0.72)
              : unfocusedBorderColor,
          width: 1.0,
        ),
      ),
      boxShadow: focused
          ? (borderTokens.focusGlow.isNotEmpty
                ? borderTokens.focusGlow
                : [
                    BoxShadow(
                      color: AppColorScheme.accent.withValues(alpha: 0.22),
                      blurRadius: 14,
                      spreadRadius: 0.5,
                    ),
                  ])
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = _focused
        ? AppColors.black.withValues(alpha: 0.87)
        : colorScheme.onSurface;
    final iconColor = _focused
        ? AppColors.black.withValues(alpha: 0.54)
        : colorScheme.onSurfaceVariant;

    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (f) {
        if (_focused != f && mounted) {
          setState(() => _focused = f);
        }
        if (f) {
          _ensureFocusedTileVisible();
        }
      },
      onKeyEvent: (node, event) {
        if (event is! KeyDownEvent) return KeyEventResult.ignored;
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
            !widget.isFirst) {
          widget.onMoveUp();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
            !widget.isLast) {
          widget.onMoveDown();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.select ||
            event.logicalKey == LogicalKeyboardKey.enter) {
          widget.onToggle(!widget.enabled);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          decoration: _tileDecoration(context, focused: _focused),
          child: ListTile(
            onTap: () => widget.onToggle(!widget.enabled),
            leading: Icon(
              widget.enabled ? Icons.check_box : Icons.check_box_outline_blank,
              color: widget.enabled
                  ? (_focused ? AppColors.black : colorScheme.primary)
                  : iconColor,
            ),
            title: Text(
              widget.label,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              widget.enabled ? widget.enabledLabel : widget.hiddenLabel,
              style: TextStyle(
                color: _focused
                    ? AppColors.black.withValues(alpha: 0.6)
                    : colorScheme.onSurfaceVariant,
              ),
            ),
            trailing: widget.trailing,
          ),
        ),
      ),
    );
  }
}
