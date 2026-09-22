import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:server_core/server_core.dart';

import '../providers/admin_user_providers.dart';
import '../widgets/admin_form_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';

class AdminUserAddScreen extends ConsumerStatefulWidget {
  const AdminUserAddScreen({super.key});

  @override
  ConsumerState<AdminUserAddScreen> createState() => _AdminUserAddScreenState();
}

class _AdminUserAddScreenState extends ConsumerState<AdminUserAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context);
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final client = GetIt.instance<MediaServerClient>();
      await client.adminUsersApi.createUser(
        _nameController.text.trim(),
        _passwordController.text.isEmpty ? null : _passwordController.text,
      );
      ref.invalidate(adminUsersListProvider);
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminUserCreateFailed(describeError(e, l10n)))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            adminScreenHeader(
              context,
              title: l10n.adminCreateUser,
              icon: Icons.person_add_alt_1_outlined,
            ),
            TextFormField(
              controller: _nameController,
              decoration: adminInputDecoration(label: l10n.username),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Username is required' : null,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: adminInputDecoration(label: l10n.adminPasswordOptional),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            adminSaveButton(
              label: l10n.create,
              saving: _saving,
              onPressed: _submit,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _saving ? null : () => context.pop(),
              child: Text(l10n.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
