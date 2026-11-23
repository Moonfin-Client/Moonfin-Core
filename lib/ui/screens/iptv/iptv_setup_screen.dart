import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_iptv/server_iptv.dart';

import '../../../auth/repositories/server_repository.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../data/services/iptv/iptv_playlist_error_message.dart';
import '../../../data/services/iptv/iptv_profiles_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/idiom/app_ui_idiom.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../navigation/home_refresh_bus.dart';
import '../../widgets/login_scaffold.dart';
import 'widgets/iptv_login_widgets.dart';
import 'widgets/login_background.dart';

enum _ConnType { xtream, m3uUrl, m3uFile }

/// IPTV account setup: add an Xtream Codes account, an M3U URL,
/// or a local M3U file.
class IptvSetupScreen extends StatefulWidget {
  const IptvSetupScreen({super.key});

  @override
  State<IptvSetupScreen> createState() => _IptvSetupScreenState();
}

class _IptvSetupScreenState extends State<IptvSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _urlController = TextEditingController();
  final _epgUrlController = TextEditingController();
  final _serverUrlController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _playlistService = GetIt.instance<PlaylistService>();
  final _profilesService = GetIt.instance<IptvProfilesService>();
  final _sessionRepository = GetIt.instance<SessionRepository>();

  final _typeFocuses = {for (final t in _ConnType.values) t: FocusNode()};
  final _nameFocus = FocusNode();
  final _serverUrlFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _epgUrlFocus = FocusNode();
  final _urlFocus = FocusNode();
  final _fileFocus = FocusNode();
  final _testFocus = FocusNode();
  final _submitFocus = FocusNode();

  _ConnType _type = _ConnType.xtream;
  String? _selectedFilePath;
  bool _obscurePassword = true;
  bool _testingConnection = false;
  bool _showTestResult = false;
  PlaylistError? _testConnectionError;
  bool _tvKeyboardVisible = false;

  AppLocalizations get _l10n => AppLocalizations.of(context);

  bool get _apple => AppUiIdiomResolver.isApple;
  bool get _tv => PlatformDetection.isTV;

  @override
  void initState() {
    super.initState();
    _playlistService.addListener(_onServiceChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _playlistService.clearError();
    });
  }

  @override
  void dispose() {
    _playlistService.removeListener(_onServiceChanged);
    _nameController.dispose();
    _urlController.dispose();
    _epgUrlController.dispose();
    _serverUrlController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    for (final node in _typeFocuses.values) {
      node.dispose();
    }
    _nameFocus.dispose();
    _serverUrlFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _epgUrlFocus.dispose();
    _urlFocus.dispose();
    _fileFocus.dispose();
    _testFocus.dispose();
    _submitFocus.dispose();
    super.dispose();
  }

  void _onTvKeyboardVisibility(bool visible) {
    if (_tvKeyboardVisible == visible) return;
    setState(() => _tvKeyboardVisible = visible);
  }

  void _onServiceChanged() {
    if (mounted) setState(() {});
  }

  void _back() =>
      context.canPop() ? context.pop() : context.go(Destinations.serverSelect);

  // Web gives no file path to read, and Apple TV has no file picker.
  bool get _canPickFile =>
      !PlatformDetection.isWeb && !PlatformDetection.isAppleTV;

  void _selectType(_ConnType type) {
    if (type == _type) return;
    setState(() {
      _type = type;
      _showTestResult = false;
    });
  }

  /// Opened from server select, this enters the IPTV session, creating a
  /// default profile the first time. Opened from the playlists screen, it just
  /// goes back, so the user stays on their own profile.
  Future<void> _onAdded() async {
    // Pull guide data in the background so the EPG has programs by the time
    // the user opens it.
    unawaited(GetIt.instance<EpgService>().refreshAllSources());

    if (!(ModalRoute.of(context)?.isFirst ?? true)) {
      homeRefreshBus.requestNowOrAfterNavigation();
      context.pop();
      return;
    }

    final profiles = _profilesService.getProfiles();
    final profile = profiles.isEmpty
        ? await _profilesService.createProfile(_l10n.iptvDefaultProfileName)
        : profiles.first;
    final switched = await _sessionRepository.switchCurrentSession(
      serverId: ServerRepository.iptvServerId,
      userId: profile.id,
    );

    if (!mounted) return;
    context.go(switched ? Destinations.home : Destinations.serverSelect);
  }

  Future<void> _testConnection() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _testingConnection = true;
      _showTestResult = false;
    });
    final error = await _playlistService.testXtreamConnection(
      serverUrl: _serverUrlController.text.trim(),
      username: _usernameController.text.trim(),
      password: _passwordController.text.trim(),
    );
    if (!mounted) return;
    setState(() {
      _testingConnection = false;
      _showTestResult = true;
      _testConnectionError = error;
    });
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.pickFiles(
      dialogTitle: _l10n.iptvSelectM3uPlaylist,
    );
    final path = result?.files.single.path;
    if (path == null || !mounted) return;
    setState(() => _selectedFilePath = path);
  }

  Future<void> _submitXtream() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final id = await _playlistService.addXtreamPlaylist(
      name: _playlistName(),
      serverUrl: _serverUrlController.text.trim(),
      username: _usernameController.text.trim(),
      password: _passwordController.text.trim(),
      epgUrl: _epgUrl(),
    );
    if (id != null && mounted) await _onAdded();
  }

  Future<void> _submitM3uUrl() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final id = await _playlistService.addM3uUrlPlaylist(
      name: _playlistName(),
      url: _urlController.text.trim(),
      epgUrl: _epgUrl(),
    );
    if (id != null && mounted) await _onAdded();
  }

  Future<void> _submitM3uFile() async {
    final path = _selectedFilePath;
    if (path == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(_l10n.iptvPleaseSelectFile)));
      return;
    }
    final id = await _playlistService.addM3uFilePlaylist(
      name: _playlistName(),
      filePath: path,
      epgUrl: _epgUrl(),
    );
    if (id != null && mounted) await _onAdded();
  }

  String _playlistName() {
    final name = _nameController.text.trim();
    return name.isEmpty ? _l10n.iptvMyPlaylist : name;
  }

  String? _epgUrl() {
    final value = _epgUrlController.text.trim();
    return value.isEmpty ? null : value;
  }

  String? _validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) return _l10n.iptvUrlRequired;
    final uri = Uri.tryParse(value.trim());
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return _l10n.iptvEnterValidUrl;
    }
    return null;
  }

  String? _required(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return _l10n.iptvFieldRequired(label);
    }
    return null;
  }

  String get _fileButtonLabel => _selectedFilePath == null
      ? _l10n.iptvSelectM3uFile
      : _selectedFilePath!.split(Platform.pathSeparator).last;

  @override
  Widget build(BuildContext context) {
    final page = Scaffold(
      backgroundColor: ThemeRegistry.active.colors.background,
      body: LoginBackground(
        apple: _apple,
        child: SafeArea(
          child: FocusTraversalGroup(
            // TV always takes the Material layout since only its fields host
            // the d-pad driven custom keyboard.
            child: _apple && !_tv ? _buildApple() : _buildMaterial(),
          ),
        ),
      ),
    );
    // Pushed from the playlists screen the route pops on its own, which keeps
    // the iOS swipe back.
    return ModalRoute.of(context)?.isFirst ?? false
        ? SignInBackScope(onBack: _back, child: page)
        : page;
  }

  Widget _buildMaterial() {
    final c = ThemeRegistry.active.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
          child: Row(
            children: [
              IconButton(icon: const Icon(Icons.arrow_back), onPressed: _back),
              const SizedBox(width: 4),
              Text(
                _l10n.iptvAddPlaylist,
                style: TextStyle(
                  color: c.onBackground,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (_playlistService.isLoading) _importProgress(apple: false),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _tv ? _tvTypeSelector() : _materialSegmented(),
                      const SizedBox(height: 22),
                      ..._materialFields(),
                      if (_playlistService.error != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          iptvPlaylistErrorMessage(
                            _l10n,
                            _playlistService.error!,
                          ),
                          style: TextStyle(
                            color: AppColorScheme.statusError,
                            fontSize: 13,
                          ),
                        ),
                      ],
                      const SizedBox(height: 26),
                      _materialActions(),
                      if (_showTestResult) ...[
                        const SizedBox(height: 14),
                        _testResultText(),
                      ],
                      // Keeps the focused field above the TV on-screen
                      // keyboard.
                      if (_tv)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          height: _tvKeyboardVisible ? 280 : 0,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _materialSegmented() {
    final c = ThemeRegistry.active.colors;
    return SegmentedButton<_ConnType>(
      segments: [
        ButtonSegment(value: _ConnType.xtream, label: Text(_l10n.iptvXtream)),
        ButtonSegment(value: _ConnType.m3uUrl, label: Text(_l10n.iptvM3uUrl)),
        if (_canPickFile)
          ButtonSegment(
            value: _ConnType.m3uFile,
            label: Text(_l10n.iptvFileTab),
          ),
      ],
      selected: {_type},
      showSelectedIcon: false,
      onSelectionChanged: (s) => _selectType(s.first),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.accent
              : c.inputBackground,
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? c.onAccent
              : c.onBackground.withValues(alpha: 0.75),
        ),
        side: WidgetStatePropertyAll(BorderSide(color: c.inputBorder)),
      ),
    );
  }

  /// Three real buttons instead of a SegmentedButton so each option is its
  /// own focus target under d-pad navigation.
  Widget _tvTypeSelector() {
    final c = ThemeRegistry.active.colors;

    Widget option(_ConnType type, String label) {
      final selected = _type == type;
      final node = _typeFocuses[type];
      final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      );
      final child = Text(label, maxLines: 1, overflow: TextOverflow.ellipsis);

      if (selected) {
        return FilledButton(
          focusNode: node,
          onPressed: () => _selectType(type),
          style:
              FilledButton.styleFrom(
                backgroundColor: c.accent,
                foregroundColor: c.onAccent,
                shape: shape,
              ).copyWith(
                side: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.focused)
                      ? BorderSide(color: c.onAccent, width: 2)
                      : null,
                ),
              ),
          child: child,
        );
      }
      return OutlinedButton(
        focusNode: node,
        onPressed: () => _selectType(type),
        style: OutlinedButton.styleFrom(
          foregroundColor: c.onBackground.withValues(alpha: 0.75),
          shape: shape,
        ).copyWith(side: _focusAwareSide),
        child: child,
      );
    }

    return Row(
      children: [
        Expanded(child: option(_ConnType.xtream, _l10n.iptvXtream)),
        const SizedBox(width: 10),
        Expanded(child: option(_ConnType.m3uUrl, _l10n.iptvM3uUrl)),
        if (_canPickFile) ...[
          const SizedBox(width: 10),
          Expanded(child: option(_ConnType.m3uFile, _l10n.iptvFileTab)),
        ],
      ],
    );
  }

  FocusNode get _typeFocus => _typeFocuses[_type]!;

  WidgetStateProperty<BorderSide?> get _focusAwareSide {
    final c = ThemeRegistry.active.colors;
    return WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.focused)
          ? BorderSide(color: c.accent, width: 2)
          : BorderSide(color: c.inputBorder),
    );
  }

  Widget _materialPasswordField() => GlassField(
    key: ObjectKey(_passwordController),
    controller: _passwordController,
    label: _l10n.password,
    icon: Icons.lock_outline,
    obscureText: _obscurePassword,
    validator: (v) => _required(v, _l10n.password),
    focusNode: _passwordFocus,
    up: _usernameFocus,
    down: _epgUrlFocus,
    onTvKeyboardVisibility: _onTvKeyboardVisibility,
    suffixIcon: _tv
        ? null
        : IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              size: 20,
            ),
            onPressed: () =>
                setState(() => _obscurePassword = !_obscurePassword),
          ),
  );

  Widget _materialEpgField({FocusNode? up}) => GlassField(
    key: ObjectKey(_epgUrlController),
    controller: _epgUrlController,
    label: _l10n.iptvEpgUrlOptional,
    icon: Icons.calendar_today_outlined,
    hint: 'http://example.com/epg.xml',
    keyboardType: TextInputType.url,
    focusNode: _epgUrlFocus,
    up: up,
    down: _submitFocus,
    onTvKeyboardVisibility: _onTvKeyboardVisibility,
  );

  Widget _materialNameField({FocusNode? down}) => GlassField(
    key: ObjectKey(_nameController),
    controller: _nameController,
    label: _l10n.playlistName,
    icon: Icons.bookmark_outline,
    textInputAction: TextInputAction.next,
    autofocus: _tv,
    focusNode: _nameFocus,
    up: _typeFocus,
    down: down,
    onTvKeyboardVisibility: _onTvKeyboardVisibility,
  );

  List<Widget> _materialFields() {
    switch (_type) {
      case _ConnType.xtream:
        return [
          _materialNameField(down: _serverUrlFocus),
          const SizedBox(height: 14),
          GlassField(
            key: ObjectKey(_serverUrlController),
            controller: _serverUrlController,
            label: _l10n.iptvServerUrl,
            icon: Icons.dns_outlined,
            hint: 'http://example.com:8080',
            keyboardType: TextInputType.url,
            validator: _validateUrl,
            textInputAction: TextInputAction.next,
            focusNode: _serverUrlFocus,
            up: _nameFocus,
            down: _usernameFocus,
            onTvKeyboardVisibility: _onTvKeyboardVisibility,
          ),
          const SizedBox(height: 14),
          GlassField(
            key: ObjectKey(_usernameController),
            controller: _usernameController,
            label: _l10n.username,
            icon: Icons.person_outline,
            validator: (v) => _required(v, _l10n.username),
            textInputAction: TextInputAction.next,
            focusNode: _usernameFocus,
            up: _serverUrlFocus,
            down: _passwordFocus,
            onTvKeyboardVisibility: _onTvKeyboardVisibility,
          ),
          const SizedBox(height: 14),
          _materialPasswordField(),
          const SizedBox(height: 14),
          _materialEpgField(up: _passwordFocus),
        ];
      case _ConnType.m3uUrl:
        return [
          _materialNameField(down: _urlFocus),
          const SizedBox(height: 14),
          GlassField(
            key: ObjectKey(_urlController),
            controller: _urlController,
            label: _l10n.iptvM3uUrl,
            icon: Icons.link,
            hint: 'http://example.com/playlist.m3u',
            keyboardType: TextInputType.url,
            validator: _validateUrl,
            focusNode: _urlFocus,
            up: _nameFocus,
            down: _epgUrlFocus,
            onTvKeyboardVisibility: _onTvKeyboardVisibility,
          ),
          const SizedBox(height: 14),
          _materialEpgField(up: _urlFocus),
        ];
      case _ConnType.m3uFile:
        final c = ThemeRegistry.active.colors;
        return [
          _materialNameField(down: _fileFocus),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            focusNode: _fileFocus,
            onPressed: _playlistService.isLoading ? null : _pickFile,
            icon: const Icon(Icons.file_open_outlined, size: 18),
            label: Text(_fileButtonLabel, overflow: TextOverflow.ellipsis),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              foregroundColor: _selectedFilePath == null
                  ? c.onBackground
                  : c.accent,
            ).copyWith(side: _focusAwareSide),
          ),
          const SizedBox(height: 14),
          _materialEpgField(up: _fileFocus),
        ];
    }
  }

  Widget _materialActions() {
    final busy = _playlistService.isLoading;
    if (_type != _ConnType.xtream) {
      return LoginPrimaryButton(
        label: _l10n.iptvAddPlaylist,
        busy: busy,
        focusNode: _submitFocus,
        onPressed: _type == _ConnType.m3uUrl ? _submitM3uUrl : _submitM3uFile,
      );
    }
    final c = ThemeRegistry.active.colors;
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            focusNode: _testFocus,
            onPressed: busy || _testingConnection ? null : _testConnection,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              foregroundColor: c.onBackground,
            ).copyWith(side: _focusAwareSide),
            child: _testingConnection
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(_l10n.iptvTest),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: LoginPrimaryButton(
            label: _l10n.connect,
            busy: busy,
            focusNode: _submitFocus,
            onPressed: _submitXtream,
          ),
        ),
      ],
    );
  }

  Widget _buildApple() {
    final c = ThemeRegistry.active.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 16, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              onPressed: _back,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(CupertinoIcons.back, size: 22),
                  const SizedBox(width: 2),
                  Text(_l10n.back),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _l10n.iptvAddPlaylist,
              style: TextStyle(
                color: c.onBackground,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
          ),
        ),
        if (_playlistService.isLoading) _importProgress(apple: true),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 28),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CupertinoSlidingSegmentedControl<_ConnType>(
                          groupValue: _type,
                          onValueChanged: (v) =>
                              v != null ? _selectType(v) : null,
                          children: {
                            _ConnType.xtream: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(_l10n.iptvXtream),
                            ),
                            _ConnType.m3uUrl: Text(_l10n.iptvM3uUrl),
                            if (_canPickFile)
                              _ConnType.m3uFile: Text(_l10n.iptvFileTab),
                          },
                        ),
                      ),
                      ..._appleSections(),
                      if (_playlistService.error != null)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                          child: Text(
                            iptvPlaylistErrorMessage(
                              _l10n,
                              _playlistService.error!,
                            ),
                            style: TextStyle(
                              color: AppColorScheme.statusError,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _appleActions(),
                      ),
                      if (_showTestResult)
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: _testResultText(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  CupertinoTextFormFieldRow _appleRow(
    TextEditingController controller,
    String label, {
    String? placeholder,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    final c = ThemeRegistry.active.colors;
    return CupertinoTextFormFieldRow(
      controller: controller,
      prefix: SizedBox(
        width: 96,
        child: Text(label, style: TextStyle(color: c.onBackground)),
      ),
      placeholder: placeholder,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: c.onBackground),
    );
  }

  List<Widget> _appleSections() {
    final c = ThemeRegistry.active.colors;
    Widget header(String t) =>
        Text(t, style: TextStyle(color: c.onBackground.withValues(alpha: 0.6)));

    final epgSection = CupertinoFormSection.insetGrouped(
      header: header(_l10n.iptvSectionEpgOptional),
      children: [
        _appleRow(
          _epgUrlController,
          _l10n.iptvEpgUrl,
          placeholder: 'http://example.com/epg.xml',
          keyboardType: TextInputType.url,
        ),
      ],
    );

    switch (_type) {
      case _ConnType.xtream:
        return [
          CupertinoFormSection.insetGrouped(
            header: header(_l10n.iptvSectionConnection),
            children: [
              _appleRow(
                _nameController,
                _l10n.name,
                placeholder: _l10n.iptvMyProvider,
              ),
              _appleRow(
                _serverUrlController,
                _l10n.server,
                placeholder: 'http://example.com:8080',
                keyboardType: TextInputType.url,
                validator: _validateUrl,
              ),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: header(_l10n.iptvSectionCredentials),
            children: [
              _appleRow(
                _usernameController,
                _l10n.username,
                validator: (v) => _required(v, _l10n.username),
              ),
              _appleRow(
                _passwordController,
                _l10n.password,
                obscureText: _obscurePassword,
                validator: (v) => _required(v, _l10n.password),
              ),
            ],
          ),
          epgSection,
        ];
      case _ConnType.m3uUrl:
        return [
          CupertinoFormSection.insetGrouped(
            header: header(_l10n.iptvSectionPlaylist),
            children: [
              _appleRow(
                _nameController,
                _l10n.name,
                placeholder: _l10n.iptvMyPlaylist,
              ),
              _appleRow(
                _urlController,
                _l10n.iptvM3uUrl,
                placeholder: 'http://example.com/playlist.m3u',
                keyboardType: TextInputType.url,
                validator: _validateUrl,
              ),
            ],
          ),
          epgSection,
        ];
      case _ConnType.m3uFile:
        return [
          CupertinoFormSection.insetGrouped(
            header: header(_l10n.iptvSectionPlaylist),
            children: [
              _appleRow(
                _nameController,
                _l10n.name,
                placeholder: _l10n.iptvMyPlaylist,
              ),
              CupertinoListTile(
                title: Text(
                  _fileButtonLabel,
                  style: TextStyle(color: c.onBackground),
                ),
                trailing: Icon(CupertinoIcons.folder, color: c.accent),
                onTap: _playlistService.isLoading ? null : _pickFile,
              ),
            ],
          ),
          epgSection,
        ];
    }
  }

  Widget _appleActions() {
    final busy = _playlistService.isLoading;
    if (_type != _ConnType.xtream) {
      return LoginPrimaryButton(
        label: _l10n.iptvAddPlaylist,
        apple: true,
        busy: busy,
        onPressed: _type == _ConnType.m3uUrl ? _submitM3uUrl : _submitM3uFile,
      );
    }
    return Column(
      children: [
        LoginPrimaryButton(
          label: _l10n.connect,
          apple: true,
          busy: busy,
          onPressed: _submitXtream,
        ),
        const SizedBox(height: 8),
        CupertinoButton(
          onPressed: busy || _testingConnection ? null : _testConnection,
          child: _testingConnection
              ? const CupertinoActivityIndicator()
              : Text(_l10n.iptvTestConnection),
        ),
      ],
    );
  }

  Widget _importProgress({required bool apple}) {
    final c = ThemeRegistry.active.colors;
    final label = Text(
      _l10n.iptvImportingPercent((_playlistService.progress * 100).toInt()),
      style: TextStyle(
        color: c.onBackground.withValues(alpha: 0.6),
        fontSize: apple ? 13 : 12,
      ),
    );

    if (apple) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
        child: Row(
          children: [
            const CupertinoActivityIndicator(),
            const SizedBox(width: 10),
            label,
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(value: _playlistService.progress),
          ),
          const SizedBox(height: 6),
          label,
        ],
      ),
    );
  }

  Widget _testResultText() {
    final error = _testConnectionError;
    return Text(
      error == null
          ? _l10n.iptvConnectionSuccessful
          : iptvPlaylistErrorMessage(_l10n, error),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        color: error == null
            ? AppColorScheme.statusAvailable
            : AppColorScheme.statusError,
      ),
    );
  }
}
