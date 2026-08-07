import 'package:flutter/material.dart';

import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../track_selector_dialog.dart';
import 'seerr_request_action.dart';
import 'seerr_tv_controls.dart';

/// Lists the open requests on a title so a request manager can approve or
/// decline each one.
///
/// A sheet rather than a pair of buttons in the action row, because approve
/// and decline belong to a request rather than to the title, and a title can
/// carry several.
void showSeerrManageRequestsSheet({
  required BuildContext context,
  required SeerrMediaDetailViewModel vm,
}) {
  showStyledPlayerDialog<void>(
    context,
    title: AppLocalizations.of(context).manageRequests,
    builder: (_) => _SeerrManageRequestsSheet(vm: vm),
  );
}

class _SeerrManageRequestsSheet extends StatefulWidget {
  final SeerrMediaDetailViewModel vm;

  const _SeerrManageRequestsSheet({required this.vm});

  @override
  State<_SeerrManageRequestsSheet> createState() =>
      _SeerrManageRequestsSheetState();
}

class _SeerrManageRequestsSheetState extends State<_SeerrManageRequestsSheet> {
  @override
  void initState() {
    super.initState();
    widget.vm.addListener(_onChanged);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (!mounted) return;
    // Once nothing is left to decide, the sheet has nothing to show.
    if (seerrPendingRequests(widget.vm.state).isEmpty) {
      Navigator.of(context).pop();
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = widget.vm.state;
    final requests = seerrPendingRequests(state);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final request in requests) ...[
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: Text(
              seerrRequestedByLabel(request, l10n),
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SeerrDialogButton(
                  label: l10n.approve,
                  icon: Icons.check_circle_outline,
                  primary: true,
                  primaryColor: Colors.green[700],
                  onPressed: state.isRequesting
                      ? null
                      : () => widget.vm.approveRequest(request.id),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SeerrDialogButton(
                  label: l10n.declineAction,
                  icon: Icons.cancel_outlined,
                  foreground: Colors.red[300],
                  onPressed: state.isRequesting
                      ? null
                      : () => widget.vm.declineRequest(request.id),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
