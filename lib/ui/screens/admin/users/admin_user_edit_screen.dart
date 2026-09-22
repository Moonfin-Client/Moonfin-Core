import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';

import '../../../navigation/destinations.dart';
import '../../../widgets/adaptive/adaptive_dialog.dart';
import '../../detail/modern/widgets/details_tab_bar.dart';
import '../widgets/admin_form_styles.dart';
import '../providers/admin_user_providers.dart';
import 'admin_user_delete_dialog.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../../../../util/platform_detection.dart';

class AdminUserEditScreen extends ConsumerStatefulWidget {
  final String userId;
  const AdminUserEditScreen({super.key, required this.userId});

  @override
  ConsumerState<AdminUserEditScreen> createState() =>
      _AdminUserEditScreenState();
}

class _AdminUserEditScreenState extends ConsumerState<AdminUserEditScreen> {
  int _selectedTab = 0;
  final _tabFocusNodes = <int, FocusNode>{};
  late final MediaServerClient _client;

  ServerUser? _user;
  late Map<String, dynamic> _policy;
  List<VirtualFolderInfo>? _libraries;
  List<Map<String, dynamic>> _parentalRatings = const [];
  List<Map<String, dynamic>> _authProviders = const [];
  List<Map<String, dynamic>> _resetProviders = const [];
  List<DeviceInfoDto> _devices = const [];

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _bitrateLimitController = TextEditingController();
  final _maxSessionsController = TextEditingController();
  final _loginAttemptsController = TextEditingController();
  final _tagControllers = <String, TextEditingController>{};

  bool _loading = true;
  bool _saving = false;
  String? _error;
  String _originalName = '';

  @override
  void initState() {
    super.initState();
    _client = GetIt.instance<MediaServerClient>();
    _loadUser();
  }

  FocusNode _tabNode(int index) {
    return _tabFocusNodes.putIfAbsent(
        index, () => FocusNode(debugLabel: 'admin_user_tab_$index'));
  }

  @override
  void dispose() {
    for (final node in _tabFocusNodes.values) {
      node.dispose();
    }
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _bitrateLimitController.dispose();
    _maxSessionsController.dispose();
    _loginAttemptsController.dispose();
    for (final c in _tagControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _loadUser() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final results = await Future.wait([
        _client.adminUsersApi.getUserById(widget.userId),
        _client.adminLibraryApi.getVirtualFolders(),
      ]);
      // Dropdown reference lists are optional; degrade to empty on older
      // servers rather than failing the whole screen.
      final ratings = await _client.adminSystemApi
          .getParentalRatings()
          .catchError((_) => <Map<String, dynamic>>[]);
      final authProviders = await _client.adminSystemApi
          .getAuthProviders()
          .catchError((_) => <Map<String, dynamic>>[]);
      final resetProviders = await _client.adminSystemApi
          .getPasswordResetProviders()
          .catchError((_) => <Map<String, dynamic>>[]);
      final devices = await _client.adminDevicesApi
          .getDevices()
          .catchError((_) => <DeviceInfoDto>[]);
      if (!mounted) return;
      final user = results[0] as ServerUser;
      final libs = results[1] as List<VirtualFolderInfo>;
      setState(() {
        _user = user;
        _libraries = libs;
        _parentalRatings = ratings;
        _authProviders = authProviders;
        _resetProviders = resetProviders;
        _devices = devices;
        _originalName = (user.name ?? '').trim();
        _nameController.text = _originalName;
        _policy = user.policy?.toJson() ?? <String, dynamic>{};
        _bitrateLimitController.text =
            (_policy['RemoteClientBitrateLimit'] as int?)?.toString() ?? '';
        _maxSessionsController.text =
            (_policy['MaxActiveSessions'] as int?)?.toString() ?? '';
        _loginAttemptsController.text =
            (_policy['LoginAttemptsBeforeLockout'] as int?)?.toString() ?? '';
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = describeError(e, AppLocalizations.of(context));
        _loading = false;
      });
    }
  }

  Future<void> _saveProfile() async {
    final l10n = AppLocalizations.of(context);
    final newName = _nameController.text.trim();
    if (newName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminUsernameRequired)),
      );
      return;
    }

    if (newName == _originalName) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminNoProfileChanges)),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      await _client.adminUsersApi.updateUser(widget.userId, {
        'Name': newName,
        'Configuration': <String, dynamic>{},
      });
      _originalName = newName;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminProfileSaved)),
        );
      }
      ref.invalidate(adminUsersListProvider);
      ref.invalidate(adminUserProvider(widget.userId));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminSaveFailed(describeError(e, l10n)))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _savePolicy() async {
    final l10n = AppLocalizations.of(context);
    final bitrate = int.tryParse(_bitrateLimitController.text);
    final maxSessions = int.tryParse(_maxSessionsController.text);
    _policy['RemoteClientBitrateLimit'] = bitrate;
    _policy['MaxActiveSessions'] = maxSessions;
    final loginAttempts = _loginAttemptsController.text.trim();
    if (loginAttempts.isNotEmpty) {
      _policy['LoginAttemptsBeforeLockout'] = int.tryParse(loginAttempts);
    }

    setState(() => _saving = true);
    try {
      await _client.adminUsersApi
          .updateUserPolicy(widget.userId, _policy);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminPermissionsSaved)),
        );
      }
      ref.invalidate(adminUsersListProvider);
      ref.invalidate(adminUserProvider(widget.userId));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminSaveFailed(describeError(e, l10n)))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _savePassword() async {
    final l10n = AppLocalizations.of(context);
    final pw = _passwordController.text;
    final confirm = _confirmPasswordController.text;
    if (pw.isNotEmpty && pw != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminPasswordsMismatch)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      if (pw.isEmpty) {
        await _client.adminUsersApi
            .updateUserPassword(widget.userId, resetPassword: true);
      } else {
        await _client.adminUsersApi
            .updateUserPassword(widget.userId, newPassword: pw);
      }
      if (mounted) {
        _passwordController.clear();
        _confirmPasswordController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(pw.isEmpty ? l10n.adminPasswordReset : l10n.adminPasswordUpdated),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminFailed(describeError(e, l10n)))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  void _togglePolicy(String key, bool value) {
    setState(() => _policy[key] = value);
  }

  void _toggleFolderAccess(String folderId, bool enabled) {
    final folders = List<String>.from(
        _policy['EnabledFolders'] as List? ?? []);
    if (enabled) {
      if (!folders.contains(folderId)) folders.add(folderId);
    } else {
      folders.remove(folderId);
    }
    setState(() => _policy['EnabledFolders'] = folders);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminUserLoadFailed,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(_error!, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            FilledButton.tonal(
                onPressed: _loadUser, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Row(
            children: [
              TextButton.icon(
                onPressed: () => context.go(Destinations.adminUsers),
                icon: const Icon(Icons.arrow_back),
                label: Text(l10n.adminBackToUsers),
              ),
              const Spacer(),
              Text(
                _user?.name?.isNotEmpty == true
                    ? _user!.name!
                    : l10n.adminUserSettings,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
          child: DetailsTabBar(
            segmented: true,
            wrap: PlatformDetection.useMobileUi,
            labels: [
              l10n.profile,
              l10n.permissions,
              l10n.access,
              l10n.adminParentalControl,
              l10n.password,
            ],
            selectedIndex: _selectedTab,
            onSelect: (i) => setState(() => _selectedTab = i),
            focusNodeFor: _tabNode,
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedTab,
            children: [
              _buildProfileTab(),
              _buildPermissionsTab(),
              _buildAccessTab(),
              _buildParentalTab(),
              _buildPasswordTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          controller: _nameController,
          decoration: adminInputDecoration(label: l10n.username),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            FilledButton(
              onPressed: _saving ? null : _saveProfile,
              child: Text(l10n.adminSaveProfile),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () => showAdminUserDeleteDialog(
                context,
                user: _user!,
                onDeleted: () {
                  ref.invalidate(adminUsersListProvider);
                  context.go(Destinations.adminUsers);
                },
              ),
              icon: const Icon(Icons.delete),
              label: Text(l10n.adminDeleteUser),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPermissionsTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader(l10n.admin),
        if (_policy['IsAdministrator'] == true)
          Card(
            color: Theme.of(context).colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                l10n.adminFullAccessWarning,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer),
              ),
            ),
          ),
        _policySwitch('IsAdministrator', l10n.administrator),
        _policySwitch('IsHidden', l10n.adminHiddenUser),
        _policySwitch('IsDisabled', l10n.disabled),
        _sectionHeader(l10n.playback),
        _policySwitch('EnableMediaPlayback', l10n.adminAllowMediaPlayback),
        _policySwitch(
            'EnableAudioPlaybackTranscoding', l10n.adminAllowAudioTranscoding),
        _policySwitch(
            'EnableVideoPlaybackTranscoding', l10n.adminAllowVideoTranscoding),
        _policySwitch('EnablePlaybackRemuxing', l10n.adminAllowRemuxing),
        _policySwitch('ForceRemoteSourceTranscoding',
            l10n.adminForceRemoteTranscoding),
        _sectionHeader(l10n.content),
        _policySwitch('EnableContentDeletion', l10n.adminAllowContentDeletion),
        _policySwitch(
            'EnableContentDownloading', l10n.adminAllowContentDownloading),
        _policySwitch('EnablePublicSharing', l10n.adminAllowPublicSharing),
        _sectionHeader(l10n.sessions),
        _policySwitch('EnableRemoteControlOfOtherUsers',
            l10n.adminAllowRemoteControl),
        _policySwitch(
            'EnableSharedDeviceControl', l10n.adminAllowSharedDeviceControl),
        _policySwitch('EnableRemoteAccess', l10n.adminAllowRemoteAccess),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            controller: _bitrateLimitController,
            decoration: adminInputDecoration(
              label: l10n.adminRemoteBitrateLimit,
              helper: l10n.adminLeaveEmptyNoLimit,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            controller: _maxSessionsController,
            decoration: adminInputDecoration(
              label: l10n.adminMaxActiveSessions,
              helper: l10n.adminLeaveEmptyNoLimit,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        _sectionHeader(l10n.features),
        _policySwitch('EnableLiveTvAccess', l10n.adminAllowLiveTvAccess),
        _policySwitch(
            'EnableLiveTvManagement', l10n.adminAllowLiveTvManagement),
        _policySwitch(
            'EnableCollectionManagement', l10n.adminAllowCollectionManagement),
        _policySwitch(
            'EnableSubtitleManagement', l10n.adminAllowSubtitleManagement),
        _policySwitch('EnableLyricManagement', l10n.adminAllowLyricManagement),
        _sectionHeader(l10n.authentication),
        if (_authProviders.length > 1)
          _providerDropdown(
            label: l10n.adminAuthProvider,
            policyKey: 'AuthenticationProviderId',
            providers: _authProviders,
          ),
        if (_resetProviders.length > 1)
          _providerDropdown(
            label: l10n.adminPasswordResetProvider,
            policyKey: 'PasswordResetProviderId',
            providers: _resetProviders,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            controller: _loginAttemptsController,
            decoration: adminInputDecoration(
              label: l10n.adminLoginAttemptsBeforeLockout,
              helper: l10n.adminLoginAttemptsHint,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: DropdownButtonFormField<String>(
            initialValue:
                (_policy['SyncPlayAccess'] as String?) ?? 'CreateAndJoinGroups',
            decoration: adminInputDecoration(label: l10n.adminSyncPlayAccess),
            items: [
              DropdownMenuItem(
                value: 'CreateAndJoinGroups',
                child: Text(l10n.adminSyncPlayCreateAndJoin),
              ),
              DropdownMenuItem(
                value: 'JoinGroups',
                child: Text(l10n.adminSyncPlayJoin),
              ),
              DropdownMenuItem(
                value: 'None',
                child: Text(l10n.adminSyncPlayNone),
              ),
            ],
            onChanged: (v) =>
                setState(() => _policy['SyncPlayAccess'] = v),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton(
            onPressed: _saving ? null : _savePolicy,
            child: Text(l10n.adminSavePermissions),
          ),
        ),
      ],
    );
  }

  Widget _providerDropdown({
    required String label,
    required String policyKey,
    required List<Map<String, dynamic>> providers,
  }) {
    final current = _policy[policyKey] as String?;
    final ids = providers
        .map((p) => (p['Id'] ?? p['id'])?.toString())
        .whereType<String>()
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButtonFormField<String>(
        initialValue: ids.contains(current)
            ? current
            : (ids.isNotEmpty ? ids.first : null),
        decoration: adminInputDecoration(label: label),
        items: providers.map((p) {
          final id = (p['Id'] ?? p['id'])?.toString() ?? '';
          final name = (p['Name'] ?? p['name'])?.toString() ?? id;
          return DropdownMenuItem(value: id, child: Text(name));
        }).toList(),
        onChanged: (v) => setState(() => _policy[policyKey] = v),
      ),
    );
  }

  Widget _buildAccessTab() {
    final l10n = AppLocalizations.of(context);
    final enableAllFolders = _policy['EnableAllFolders'] as bool? ?? true;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader(l10n.adminLibraryAccess),
        SwitchListTile.adaptive(
          title: Text(l10n.adminEnableAllLibraryAccess),
          value: enableAllFolders,
          onChanged: (v) => _togglePolicy('EnableAllFolders', v),
        ),
        if (!enableAllFolders && _libraries != null)
          ...() {
            final enabledFolders = List<String>.from(
                _policy['EnabledFolders'] as List? ?? []);
            return (_libraries!).map((lib) {
            final enabled = enabledFolders.contains(lib.itemId);
            return CheckboxListTile(
              title: Text(lib.name),
              subtitle: lib.collectionType != null
                  ? Text(lib.collectionType!)
                  : null,
              value: enabled,
              onChanged: (v) =>
                  _toggleFolderAccess(lib.itemId, v ?? false),
            );
          });
          }(),
        const Divider(height: 32),
        _sectionHeader(l10n.adminDeviceAndChannelAccess),
        _policySwitch('EnableAllDevices', l10n.adminEnableAllDevices),
        if (_policy['EnableAllDevices'] != true && _devices.isNotEmpty)
          ...() {
            final enabledDevices = List<String>.from(
                _policy['EnabledDevices'] as List? ?? []);
            return _devices.map((d) {
              final label = d.customName?.isNotEmpty == true
                  ? d.customName!
                  : (d.name ?? d.appName ?? d.id);
              return CheckboxListTile(
                title: Text(label),
                subtitle: d.appName != null ? Text(d.appName!) : null,
                value: enabledDevices.contains(d.id),
                onChanged: (v) =>
                    _toggleListMembership('EnabledDevices', d.id, v ?? false),
              );
            });
          }(),
        _policySwitch(
            'EnableAllChannels', l10n.adminEnableAllChannels),
        const Divider(height: 32),
        _sectionHeader(l10n.adminAllowContentDeletion),
        _policySwitch('EnableContentDeletion', l10n.adminAllowContentDeletion),
        if (_policy['EnableContentDeletion'] != true && _libraries != null)
          ...() {
            final delFolders = List<String>.from(
                _policy['EnableContentDeletionFromFolders'] as List? ?? []);
            return _libraries!.map((lib) {
              return CheckboxListTile(
                title: Text(lib.name),
                subtitle: Text(l10n.adminContentDeletionFolders),
                value: delFolders.contains(lib.itemId),
                onChanged: (v) => _toggleListMembership(
                    'EnableContentDeletionFromFolders', lib.itemId, v ?? false),
              );
            });
          }(),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton(
            onPressed: _saving ? null : _savePolicy,
            child: Text(l10n.adminSaveAccess),
          ),
        ),
      ],
    );
  }

  /// Generic add/remove of [value] in a `List<String>` policy key.
  void _toggleListMembership(String key, String value, bool enabled) {
    final list = List<String>.from(_policy[key] as List? ?? []);
    if (enabled) {
      if (!list.contains(value)) list.add(value);
    } else {
      list.remove(value);
    }
    setState(() => _policy[key] = list);
  }

  /// Distinct parental-rating options, sorted by score. Handles both the legacy
  /// `{Name, Value}` shape and the newer `{Name, RatingScore: {Score, SubScore}}`.
  List<({String name, int score, int? subScore})> _parentalRatingOptions() {
    final seen = <String>{};
    final out = <({String name, int score, int? subScore})>[];
    for (final r in _parentalRatings) {
      final name = (r['Name'] ?? r['name'])?.toString();
      if (name == null) continue;
      int? score;
      int? subScore;
      final ratingScore = r['RatingScore'] ?? r['ratingScore'];
      if (ratingScore is Map) {
        score = (ratingScore['Score'] ?? ratingScore['score']) as int?;
        subScore = (ratingScore['SubScore'] ?? ratingScore['subScore']) as int?;
      }
      score ??= (r['Value'] ?? r['value']) as int?;
      if (score == null) continue;
      final key = '$score:${subScore ?? 0}';
      if (!seen.add(key)) continue;
      out.add((name: name, score: score, subScore: subScore));
    }
    out.sort((a, b) => a.score.compareTo(b.score));
    return out;
  }

  Widget _buildParentalTab() {
    final l10n = AppLocalizations.of(context);
    final options = _parentalRatingOptions();
    final currentRating = _policy['MaxParentalRating'] as int?;
    const unratedItems = <(String, String Function(AppLocalizations))>[
      ('Book', _unratedBook),
      ('ChannelContent', _unratedChannel),
      ('LiveTvChannel', _unratedLiveTv),
      ('Movie', _unratedMovie),
      ('Music', _unratedMusic),
      ('Trailer', _unratedTrailer),
      ('Series', _unratedSeries),
    ];
    final blocked = List<String>.from(
        _policy['BlockUnratedItems'] as List? ?? const []);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader(l10n.adminMaxParentalRating),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: DropdownButtonFormField<int?>(
            initialValue:
                options.any((o) => o.score == currentRating) ? currentRating : null,
            decoration: adminInputDecoration(
              label: l10n.adminMaxParentalRating,
              helper: l10n.adminMaxParentalRatingHint,
            ),
            items: [
              DropdownMenuItem<int?>(
                value: null,
                child: Text(l10n.adminParentalRatingNone),
              ),
              ...options.map((o) => DropdownMenuItem<int?>(
                    value: o.score,
                    child: Text(o.name),
                  )),
            ],
            onChanged: (v) => setState(() {
              _policy['MaxParentalRating'] = v;
              final match = options.where((o) => o.score == v);
              _policy['MaxParentalSubRating'] =
                  match.isNotEmpty ? match.first.subScore : null;
            }),
          ),
        ),
        _sectionHeader(l10n.adminBlockUnratedItems),
        ...unratedItems.map((item) => CheckboxListTile(
              title: Text(item.$2(l10n)),
              value: blocked.contains(item.$1),
              onChanged: (v) =>
                  _toggleListMembership('BlockUnratedItems', item.$1, v ?? false),
            )),
        const Divider(height: 32),
        _sectionHeader(l10n.adminAccessSchedules),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(l10n.adminAccessSchedulesHint,
              style: Theme.of(context).textTheme.bodySmall),
        ),
        _buildSchedules(l10n),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: OutlinedButton.icon(
            onPressed: _addSchedule,
            icon: const Icon(Icons.add),
            label: Text(l10n.adminAddSchedule),
          ),
        ),
        const Divider(height: 32),
        _sectionHeader(l10n.adminAllowedTags),
        _buildTagEditor('AllowedTags', l10n.adminAllowedTagsHint, l10n),
        const SizedBox(height: 16),
        _sectionHeader(l10n.adminBlockedTags),
        _buildTagEditor('BlockedTags', l10n.adminBlockedTagsHint, l10n),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton(
            onPressed: _saving ? null : _savePolicy,
            child: Text(l10n.save),
          ),
        ),
      ],
    );
  }

  static const List<String> _dayValues = [
    'Everyday',
    'Weekday',
    'Weekend',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  String _dayLabel(String value, AppLocalizations l10n) {
    switch (value) {
      case 'Everyday':
        return l10n.adminDayEveryday;
      case 'Weekday':
        return l10n.adminDayWeekday;
      case 'Weekend':
        return l10n.adminDayWeekend;
      case 'Sunday':
        return l10n.adminDaySunday;
      case 'Monday':
        return l10n.adminDayMonday;
      case 'Tuesday':
        return l10n.adminDayTuesday;
      case 'Wednesday':
        return l10n.adminDayWednesday;
      case 'Thursday':
        return l10n.adminDayThursday;
      case 'Friday':
        return l10n.adminDayFriday;
      case 'Saturday':
        return l10n.adminDaySaturday;
    }
    return value;
  }

  Widget _buildSchedules(AppLocalizations l10n) {
    final schedules = List<Map<String, dynamic>>.from(
        (_policy['AccessSchedules'] as List? ?? const [])
            .map((e) => Map<String, dynamic>.from(e as Map)));
    if (schedules.isEmpty) return const SizedBox.shrink();
    return Column(
      children: List.generate(schedules.length, (i) {
        final s = schedules[i];
        final day = (s['DayOfWeek'] ?? 'Everyday').toString();
        final start = ((s['StartHour'] as num?) ?? 0).round();
        final end = ((s['EndHour'] as num?) ?? 24).round();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: DropdownButtonFormField<String>(
                  initialValue: _dayValues.contains(day) ? day : 'Everyday',
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: l10n.adminScheduleDay,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                  items: _dayValues
                      .map((d) => DropdownMenuItem(
                          value: d, child: Text(_dayLabel(d, l10n))))
                      .toList(),
                  onChanged: (v) => _updateSchedule(i, 'DayOfWeek', v),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: _hourDropdown(
                    l10n.adminScheduleStart, start, 0, 23,
                    (v) => _updateSchedule(i, 'StartHour', v)),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: _hourDropdown(
                    l10n.adminScheduleEnd, end, 1, 24,
                    (v) => _updateSchedule(i, 'EndHour', v)),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _removeSchedule(i),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _hourDropdown(
      String label, int value, int min, int max, ValueChanged<int?> onChanged) {
    return DropdownButtonFormField<int>(
      initialValue: value.clamp(min, max),
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
      items: [
        for (var h = min; h <= max; h++)
          DropdownMenuItem(
              value: h, child: Text('${h.toString().padLeft(2, '0')}:00')),
      ],
      onChanged: onChanged,
    );
  }

  void _addSchedule() {
    final schedules = List<Map<String, dynamic>>.from(
        (_policy['AccessSchedules'] as List? ?? const [])
            .map((e) => Map<String, dynamic>.from(e as Map)));
    schedules.add({'DayOfWeek': 'Everyday', 'StartHour': 0, 'EndHour': 24});
    setState(() => _policy['AccessSchedules'] = schedules);
  }

  void _removeSchedule(int index) {
    final schedules = List<Map<String, dynamic>>.from(
        (_policy['AccessSchedules'] as List? ?? const [])
            .map((e) => Map<String, dynamic>.from(e as Map)));
    schedules.removeAt(index);
    setState(() => _policy['AccessSchedules'] = schedules);
  }

  void _updateSchedule(int index, String key, dynamic value) {
    if (value == null) return;
    final schedules = List<Map<String, dynamic>>.from(
        (_policy['AccessSchedules'] as List? ?? const [])
            .map((e) => Map<String, dynamic>.from(e as Map)));
    schedules[index][key] = value;
    setState(() => _policy['AccessSchedules'] = schedules);
  }

  Widget _buildTagEditor(String key, String hint, AppLocalizations l10n) {
    final tags = List<String>.from(_policy[key] as List? ?? const []);
    final controller =
        _tagControllers.putIfAbsent(key, () => TextEditingController());
    void addTag() {
      final t = controller.text.trim();
      if (t.isEmpty) return;
      if (!tags.contains(t)) {
        final next = [...tags, t];
        setState(() => _policy[key] = next);
      }
      controller.clear();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hint, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          if (tags.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: tags
                  .map((t) => Chip(
                        label: Text(t),
                        onDeleted: () => setState(() =>
                            _policy[key] = tags.where((x) => x != t).toList()),
                      ))
                  .toList(),
            ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: l10n.adminAddTag,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                  onSubmitted: (_) => addTag(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: addTag,
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _unratedBook(AppLocalizations l) => l.adminUnratedBook;
  static String _unratedChannel(AppLocalizations l) => l.adminUnratedChannelContent;
  static String _unratedLiveTv(AppLocalizations l) => l.adminUnratedLiveTvChannel;
  static String _unratedMovie(AppLocalizations l) => l.adminUnratedMovie;
  static String _unratedMusic(AppLocalizations l) => l.adminUnratedMusic;
  static String _unratedTrailer(AppLocalizations l) => l.adminUnratedTrailer;
  static String _unratedSeries(AppLocalizations l) => l.adminUnratedSeries;

  Widget _buildPasswordTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l10n.adminChangePassword,
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        TextFormField(
          controller: _passwordController,
          decoration: adminInputDecoration(label: l10n.adminNewPassword),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _confirmPasswordController,
          decoration: adminInputDecoration(label: l10n.adminConfirmPassword),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            FilledButton(
              onPressed: _saving ? null : _savePassword,
              child: Text(l10n.adminSetPassword),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: _saving
                  ? null
                  : () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => AlertDialog.adaptive(
                          title: Text(l10n.adminResetPassword),
                          content: Text(l10n.adminResetPasswordWarning),
                          actions: [
                            adaptiveDialogAction(
                              onPressed: () =>
                                  Navigator.of(ctx).pop(false),
                              child: Text(l10n.cancel),
                            ),
                            FilledButton(
                              onPressed: () =>
                                  Navigator.of(ctx).pop(true),
                              child: Text(l10n.reset),
                            ),
                          ],
                        ),
                      );
                      if (confirmed == true) {
                        _passwordController.clear();
                        _confirmPasswordController.clear();
                        await _savePassword();
                      }
                    },
              child: Text(l10n.adminResetPassword),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sectionHeader(String title) {
    return adminSectionLabel(context, title);
  }

  Widget _policySwitch(String key, String label) {
    return adminSwitchRow(
      title: label,
      value: _policy[key] as bool? ?? false,
      onChanged: (v) => _togglePolicy(key, v),
    );
  }
}
