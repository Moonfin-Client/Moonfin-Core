import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../auth/models/user.dart';
import '../../../auth/repositories/session_repository.dart';
import '../../../data/services/iptv/iptv_profiles_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../../navigation/destinations.dart';
import '../../widgets/overlay_sheet.dart';
import '../../widgets/profile_carousel.dart';
import 'widgets/iptv_login_widgets.dart';

/// Create, rename, recolor, and delete the local IPTV profiles shown on the
/// "Who's watching" screen. Each profile keeps its own favorites, watch
/// history, and channel group selection.
class IptvProfilesScreen extends StatefulWidget {
  const IptvProfilesScreen({super.key});

  @override
  State<IptvProfilesScreen> createState() => _IptvProfilesScreenState();
}

class _IptvProfilesScreenState extends State<IptvProfilesScreen> {
  AppLocalizations get _l10n => AppLocalizations.of(context);

  final _profilesService = GetIt.instance<IptvProfilesService>();
  final _sessionRepository = GetIt.instance<SessionRepository>();

  List<PrivateUser> _profiles = const [];

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    setState(() => _profiles = _profilesService.getProfiles());
  }

  Future<void> _addProfile() async {
    final result = await _ProfileEditDialog.show(context);
    if (result == null) return;
    await _profilesService.createProfile(
      result.name,
      avatarIndex: result.avatarIndex,
    );
    if (!mounted) return;
    _reload();
  }

  Future<void> _editProfile(PrivateUser profile) async {
    final result = await _ProfileEditDialog.show(
      context,
      initialName: profile.name,
      initialAvatarIndex:
          IptvProfilesService.avatarIndexFromTag(profile.imageTag) ?? 0,
    );
    if (result == null) return;
    await _profilesService.updateProfile(
      profile.id,
      name: result.name,
      avatarIndex: result.avatarIndex,
    );
    if (!mounted) return;
    _reload();
  }

  Future<void> _deleteProfile(PrivateUser profile) async {
    final confirmed = await showFocusRestoringDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_l10n.iptvDeleteConfirmTitle(profile.name)),
        content: Text(_l10n.iptvDeleteProfileBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(_l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(_l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await _profilesService.deleteProfile(profile.id);
    if (!mounted) return;
    _reload();
  }

  @override
  Widget build(BuildContext context) {
    final activeProfileId = _sessionRepository.activeUserId;

    return Scaffold(
      appBar: AppBar(
        title: Text(_l10n.iptvProfiles),
        leading: BackButton(
          onPressed: () => context.canPop()
              ? context.pop()
              : context.go(Destinations.serverSelect),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addProfile,
        icon: const Icon(Icons.person_add),
        label: Text(_l10n.iptvAddProfile),
      ),
      body: _profiles.isEmpty
          ? Center(
              child: Text(
                _l10n.iptvNoProfilesYet,
                style: TextStyle(
                  color: AppColorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 88),
              itemCount: _profiles.length,
              itemBuilder: (context, index) {
                final profile = _profiles[index];
                final isActive = profile.id == activeProfileId;
                return ListTile(
                  autofocus: PlatformDetection.isTV && index == 0,
                  leading: SizedBox.square(
                    dimension: 44,
                    child: ProfileAvatar(
                      entry: ProfileEntry(
                        id: profile.id,
                        name: profile.name,
                        color: IptvProfilesService.colorForTag(
                          profile.imageTag,
                        ),
                      ),
                    ),
                  ),
                  title: Text(profile.name),
                  subtitle: isActive ? Text(_l10n.iptvCurrentProfile) : null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit_outlined, size: 20),
                        tooltip: _l10n.edit,
                        onPressed: () => _editProfile(profile),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, size: 20),
                        // The active profile owns the running session, so it
                        // has to be switched away from before deleting.
                        tooltip: isActive
                            ? _l10n.iptvSwitchBeforeDelete
                            : _l10n.delete,
                        onPressed: isActive
                            ? null
                            : () => _deleteProfile(profile),
                      ),
                    ],
                  ),
                  onTap: () => _editProfile(profile),
                );
              },
            ),
    );
  }
}

typedef _ProfileEditResult = ({String name, int avatarIndex});

class _ProfileEditDialog extends StatefulWidget {
  final String? initialName;
  final int initialAvatarIndex;

  const _ProfileEditDialog({this.initialName, this.initialAvatarIndex = 0});

  static Future<_ProfileEditResult?> show(
    BuildContext context, {
    String? initialName,
    int initialAvatarIndex = 0,
  }) {
    return showFocusRestoringDialog<_ProfileEditResult>(
      context: context,
      builder: (context) => _ProfileEditDialog(
        initialName: initialName,
        initialAvatarIndex: initialAvatarIndex,
      ),
    );
  }

  @override
  State<_ProfileEditDialog> createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<_ProfileEditDialog> {
  AppLocalizations get _l10n => AppLocalizations.of(context);

  late final TextEditingController _nameController = TextEditingController(
    text: widget.initialName ?? '',
  );
  late int _avatarIndex = widget.initialAvatarIndex;
  int _focusedAvatar = -1;

  @override
  void initState() {
    super.initState();
    // The Save button enables from the controller so text typed on the TV
    // keyboard counts too.
    _nameController.addListener(_onNameChanged);
  }

  void _onNameChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isNew = widget.initialName == null;
    return AlertDialog(
      title: Text(isNew ? _l10n.iptvNewProfile : _l10n.iptvEditProfile),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlatformDetection.isTV
              ? GlassField(
                  controller: _nameController,
                  label: _l10n.name,
                  icon: Icons.person_outline,
                  autofocus: true,
                )
              : TextField(
                  controller: _nameController,
                  autofocus: true,
                  decoration: InputDecoration(labelText: _l10n.name),
                ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var i = 0; i < IptvProfilesService.avatarColors.length; i++)
                InkWell(
                  onTap: () => setState(() => _avatarIndex = i),
                  onFocusChange: (focused) => setState(
                    () => _focusedAvatar = focused
                        ? i
                        : (_focusedAvatar == i ? -1 : _focusedAvatar),
                  ),
                  borderRadius: AppRadius.circular(24),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _avatarIndex == i
                            ? Theme.of(context).colorScheme.primary
                            : _focusedAvatar == i
                            ? AppColorScheme.onSurface.withValues(alpha: 0.7)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: IptvProfilesService.avatarColors[i],
                      child: _avatarIndex == i
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(_l10n.cancel),
        ),
        FilledButton(
          onPressed: _nameController.text.trim().isEmpty
              ? null
              : () => Navigator.of(context).pop((
                  name: _nameController.text.trim(),
                  avatarIndex: _avatarIndex,
                )),
          child: Text(isNew ? _l10n.create : _l10n.save),
        ),
      ],
    );
  }
}
