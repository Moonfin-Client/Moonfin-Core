import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'overlay_sheet.dart';

/// What the manager chose in the household offer.
enum HouseholdOfferChoice { addThem, notNow, dontAskAgain }

/// Offers a household manager the rest of their household after they sign in
/// by hand, so each account can be picked from Who's watching without signing
/// in. The message names the members, and the answers read top to bottom.
class HouseholdOfferDialog extends StatefulWidget {
  final String message;
  final Future<void> Function() onAddThem;

  const HouseholdOfferDialog({
    super.key,
    required this.message,
    required this.onAddThem,
  });

  static Future<HouseholdOfferChoice?> show(
    BuildContext context, {
    required String message,
    required Future<void> Function() onAddThem,
  }) {
    return showFocusRestoringDialog<HouseholdOfferChoice>(
      context: context,
      builder: (_) => HouseholdOfferDialog(message: message, onAddThem: onAddThem),
    );
  }

  @override
  State<HouseholdOfferDialog> createState() => _HouseholdOfferDialogState();
}

class _HouseholdOfferDialogState extends State<HouseholdOfferDialog> {
  final _addButtonFocus = FocusNode();
  bool _isAdding = false;

  void _close(HouseholdOfferChoice choice) {
    Navigator.of(context).pop(choice);
  }

  Future<void> _addThem() async {
    if (_isAdding) return;
    setState(() => _isAdding = true);
    try {
      await widget.onAddThem();
    } finally {
      if (mounted) setState(() => _isAdding = false);
    }
    // The report the add produced (if any) is shown by the caller over the
    // dialog that now closes.
    if (mounted) _close(HouseholdOfferChoice.addThem);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: _isAdding ? 0 : 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: _isAdding
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FilledButton(
                        focusNode: _addButtonFocus,
                        autofocus: true,
                        onPressed: _addThem,
                        child: Text(l10n.householdOfferAddThem),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: () => _close(HouseholdOfferChoice.notNow),
                        child: Text(l10n.householdOfferNotNow),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () =>
                            _close(HouseholdOfferChoice.dontAskAgain),
                        child: Text(l10n.householdOfferDontAskAgain),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _addButtonFocus.dispose();
    super.dispose();
  }
}

/// The one-button report after adding the household, saying who came along
/// and who did not.
class HouseholdNoticeDialog extends StatelessWidget {
  final String message;

  const HouseholdNoticeDialog({super.key, required this.message});

  static Future<void> show(BuildContext context, String message) {
    return showFocusRestoringDialog<void>(
      context: context,
      builder: (_) => HouseholdNoticeDialog(message: message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          FilledButton(
            autofocus: true,
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }
}
