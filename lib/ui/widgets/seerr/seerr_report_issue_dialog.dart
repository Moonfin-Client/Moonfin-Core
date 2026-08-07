import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../../../util/platform_detection.dart';
import '../focus/focusable_wrapper.dart';
import 'seerr_request_action.dart';
import 'seerr_text_field.dart';
import 'seerr_tv_controls.dart';
import '../track_selector_dialog.dart';

/// Opens the report sheet for a title already in the library.
void showSeerrReportIssueDialog({
  required BuildContext context,
  required SeerrMediaDetailViewModel vm,
}) {
  final s = vm.state;
  showStyledPlayerDialog<void>(
    context,
    title: AppLocalizations.of(context).reportIssue,
    builder: (_) => SeerrReportIssueDialog(
      vm: vm,
      isTv: s.isTv,
      seasons: s.tv?.seasons ?? const [],
      numberOfSeasons: s.numberOfSeasons ?? 0,
    ),
  );
}

/// Reports a problem with something already in the library, narrowed to a
/// season and episode when the viewer knows which.
class SeerrReportIssueDialog extends StatefulWidget {
  final SeerrMediaDetailViewModel vm;
  final bool isTv;
  final List<SeerrSeason> seasons;
  final int numberOfSeasons;

  const SeerrReportIssueDialog({
    super.key,
    required this.vm,
    required this.isTv,
    required this.seasons,
    required this.numberOfSeasons,
  });

  @override
  State<SeerrReportIssueDialog> createState() => _SeerrReportIssueDialogState();
}

class _SeerrReportIssueDialogState extends State<SeerrReportIssueDialog> {
  int _issueType = SeerrIssue.typeVideo;
  int _season = 0;
  int _episode = 0;
  bool _submitting = false;
  final _messageController = TextEditingController();

  late final List<int> _seasonNumbers =
      seerrSeasonNumbersOf(widget.seasons, widget.numberOfSeasons);

  int? get _episodeCount {
    if (_season <= 0) return null;
    return widget.seasons
        .where((s) => s.seasonNumber == _season)
        .firstOrNull
        ?.episodeCount;
  }

  @override
  void initState() {
    super.initState();
    if (widget.isTv && _seasonNumbers.length == 1) {
      _season = _seasonNumbers.first;
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final message = _messageController.text.trim();
    if (message.isEmpty || _submitting) return;
    setState(() => _submitting = true);

    final ok = await widget.vm.submitIssue(
      issueType: _issueType,
      message: message,
      problemSeason: widget.isTv ? _season : 0,
      problemEpisode: widget.isTv && _season > 0 ? _episode : 0,
    );

    if (!mounted) return;
    if (ok) {
      Navigator.of(context).pop();
    } else {
      setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final types = [
      (SeerrIssue.typeVideo, l10n.issueTypeVideo),
      (SeerrIssue.typeAudio, l10n.issueTypeAudio),
      (SeerrIssue.typeSubtitles, l10n.subtitles),
      (SeerrIssue.typeOther, l10n.other),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < types.length; i++)
            _buildTypeOption(types[i].$1, types[i].$2, autofocus: i == 0),
          if (widget.isTv && _seasonNumbers.isNotEmpty) ...[
            const Divider(color: Colors.white12),
            const SizedBox(height: 4),
            SeerrSelectorRow(
              label: l10n.season,
              value: _season <= 0
                  ? l10n.allSeasons
                  : l10n.seasonNumber(_season),
              onTap: () => _pickSeason(l10n),
            ),
            if (_season > 0) ...[
              const SizedBox(height: 12),
              SeerrSelectorRow(
                label: l10n.episode,
                value: _episode <= 0
                    ? l10n.allEpisodes
                    : l10n.episodeNumber(_episode),
                onTap: () => _pickEpisode(l10n),
              ),
            ],
          ],
          const SizedBox(height: 16),
          Text(
            l10n.whatsWrong,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 8),
          SeerrTextField(
            controller: _messageController,
            hint: l10n.whatsWrong,
            maxLines: PlatformDetection.isTV ? 1 : 3,
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: _messageController,
            builder: (context, value, _) {
              final canSend = value.text.trim().isNotEmpty && !_submitting;
              return Row(
                children: [
                  Expanded(
                    child: SeerrDialogButton(
                      label: l10n.cancel,
                      onPressed: _submitting
                          ? null
                          : () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SeerrDialogButton(
                      label: l10n.submitReport,
                      primary: true,
                      busy: _submitting,
                      onPressed: canSend ? _submit : null,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption(int value, String label, {bool autofocus = false}) {
    final selected = _issueType == value;
    return FocusableWrapper(
      autofocus: autofocus,
      onSelect: () => setState(() => _issueType = value),
      borderRadius: 8,
      useBackgroundFocus: true,
      disableScale: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selected ? AppColorScheme.accent : Colors.white38,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickSeason(AppLocalizations l10n) async {
    final values = <int>[0, ..._seasonNumbers];
    final current = values.indexOf(_season);
    final picked = await showSeerrOptionPicker(
      context,
      title: l10n.season,
      labels: [
        l10n.allSeasons,
        for (final num in _seasonNumbers) l10n.seasonNumber(num),
      ],
      selectedIndex: current < 0 ? 0 : current,
    );
    if (picked == null || !mounted) return;
    setState(() {
      _season = values[picked];
      _episode = 0;
    });
  }

  Future<void> _pickEpisode(AppLocalizations l10n) async {
    final count = _episodeCount ?? 0;
    final picked = await showSeerrOptionPicker(
      context,
      title: l10n.episode,
      labels: [
        l10n.allEpisodes,
        for (var i = 1; i <= count; i++) l10n.episodeNumber(i),
      ],
      selectedIndex: _episode.clamp(0, count),
    );
    if (picked == null || !mounted) return;
    setState(() => _episode = picked);
  }
}
