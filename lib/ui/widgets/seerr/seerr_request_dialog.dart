import 'package:flutter/material.dart';
import 'package:moonfin/data/services/seerr/seerr_seasons.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../data/viewmodels/seerr_media_detail_view_model.dart';
import '../../../l10n/app_localizations.dart';
import 'seerr_advanced_request_options.dart';
import 'seerr_quota_row.dart';
import 'seerr_request_action.dart';
import 'seerr_status_dot.dart';
import 'seerr_tv_controls.dart';
import '../track_selector_dialog.dart';

/// Whether the sheet can offer a choice of track. Nothing to switch between
/// unless the viewer is allowed to ask for both, and offering one they cant
/// request would only fail on submit.
bool _hasQualityToggle(SeerrMediaDetailViewModel vm, bool qualityToggle) =>
    qualityToggle && vm.canRequest && vm.canRequest4k;

typedef _CinemaSelection = ({
  Map<String, dynamic> selection,
  SeerrQuotaDetail? quota,
});

/// Sends the selected seasons through Cinema Mode's shared request handler.
typedef SeerrCinemaSubmit = Future<void> Function(
  Map<String, dynamic> selection,
  SeerrQuotaDetail? quota,
);

/// Opens the request sheet for one quality track, titled for what is being
/// asked for.
///
/// With [qualityToggle] the sheet carries a quality switch, and [is4k] is only
/// where it starts. A title already in the library gets a button per track
/// instead, so it has no use for the switch.
Future<void> showSeerrRequestDialog({
  required BuildContext context,
  required SeerrMediaDetailViewModel vm,
  required bool is4k,
  bool qualityToggle = false,
  int? season,
  bool isContinuing = false,
  bool selectAllSeasons = true,
  bool showAdvancedOptions = true,
  Set<int> cinemaExcludedSeasons = const {},
  Set<int> cinemaExcluded4kSeasons = const {},
  SeerrCinemaSubmit? cinemaSubmit,
  ValueChanged<VoidCallback>? onDismissReady,
}) async {
  final s = vm.state;
  final l10n = AppLocalizations.of(context);
  final type = s.isTv ? l10n.series : l10n.movie;
  final choice = await showStyledPlayerDialog<_CinemaSelection>(
    context,
    // With a switch on the sheet the title stays neutral, since either track
    // can end up being the one asked for. Without one it has to say which.
    title: is4k && !_hasQualityToggle(vm, qualityToggle)
        ? l10n.requestSeriesOrMovie4k(type)
        : l10n.requestSeriesOrMovie(type),
    builder: (dialogContext) {
      final route = ModalRoute.of(dialogContext)!;
      onDismissReady?.call(() {
        final navigator = route.navigator;
        if (navigator == null || !route.isActive) return;
        // Close this request dialog and anything it opened, without dismissing a newer dialog.
        navigator.popUntil((candidate) => identical(candidate, route));
        navigator.pop();
      });
      return SeerrRequestDialog(
        vm: vm,
        isTv: s.isTv,
        is4k: is4k,
        qualityToggle: qualityToggle,
        seasons: s.tv?.seasons ?? const [],
        numberOfSeasons: s.numberOfSeasons ?? 0,
        season: season,
        isContinuing: isContinuing,
        selectAllSeasons: selectAllSeasons,
        showAdvancedOptions: showAdvancedOptions,
        cinemaExcludedSeasons: cinemaExcludedSeasons,
        cinemaExcluded4kSeasons: cinemaExcluded4kSeasons,
        isCinema: cinemaSubmit != null,
      );
    },
  );
  if (choice != null && cinemaSubmit != null) {
    await cinemaSubmit(choice.selection, choice.quota);
  }
}

/// Picks what to request before submitting it: which seasons for a series, and
/// the server and profile overrides for the viewers allowed to set them.
class SeerrRequestDialog extends StatefulWidget {
  final SeerrMediaDetailViewModel vm;
  final bool isTv;
  final bool is4k;
  final bool qualityToggle;
  final List<SeerrSeason> seasons;
  final int numberOfSeasons;
  final bool isContinuing;
  final bool selectAllSeasons;
  final bool showAdvancedOptions;
  final Set<int> cinemaExcludedSeasons;
  final Set<int> cinemaExcluded4kSeasons;
  final bool isCinema;

  /// Opens with just this season ticked, for a viewer who asked for one rather
  /// than for the whole run.
  final int? season;

  const SeerrRequestDialog({
    super.key,
    required this.vm,
    required this.isTv,
    required this.is4k,
    this.qualityToggle = false,
    required this.seasons,
    required this.numberOfSeasons,
    this.season,
    this.isContinuing = false,
    this.selectAllSeasons = true,
    this.showAdvancedOptions = true,
    this.cinemaExcludedSeasons = const {},
    this.cinemaExcluded4kSeasons = const {},
    this.isCinema = false,
  });

  @override
  State<SeerrRequestDialog> createState() => _SeerrRequestDialogState();
}

class _SeerrRequestDialogState extends State<SeerrRequestDialog> {
  late bool _allSeasons = widget.selectAllSeasons && widget.season == null;
  late bool _is4k = widget.is4k;
  bool _submitting = false;
  late final Set<int> _selectedSeasons = {?widget.season};
  late final SeerrAdvancedRequestController _advanced;

  /// The track being asked for, so flipping the switch redraws the sheet
  /// against the one the request will actually go out on.
  SeerrQualityStatus get _quality => widget.vm.state.quality(is4k: _is4k);

  Set<int> get _excludedSeasons => _is4k
      ? widget.cinemaExcluded4kSeasons
      : widget.cinemaExcludedSeasons;

  @override
  void initState() {
    super.initState();
    _advanced = SeerrAdvancedRequestController(
      isTv: widget.isTv,
      isAnime: widget.vm.state.isAnime,
      is4k: _is4k,
    );
    _applySavedPreferences(resetSelection: false);
    if (widget.showAdvancedOptions && widget.vm.canRequestAdvanced) {
      _advanced.load();
    }
    widget.vm.loadQuota();
    widget.vm.addListener(_onVmChanged);
  }

  @override
  void dispose() {
    widget.vm.removeListener(_onVmChanged);
    _advanced.dispose();
    super.dispose();
  }

  void _onVmChanged() {
    if (mounted) setState(() {});
  }

  /// The advanced options only fill a blank selection, so flipping the switch
  /// has to clear the old track's server, profile and folder first. Without
  /// that a 4K request would go out addressed to the HD server. Opening the
  /// sheet keeps whatever is already there, since nothing has been picked yet.
  void _applySavedPreferences({bool resetSelection = true}) {
    final vm = widget.vm;
    final is4k = _is4k;
    _advanced.applySavedPreferences(
      serverId: is4k ? vm.saved4kServerId : vm.savedServerId,
      profileId: is4k ? vm.saved4kProfileId : vm.savedProfileId,
      rootFolderId: is4k ? vm.saved4kRootFolderId : vm.savedRootFolderId,
      resetSelection: resetSelection,
      is4k: is4k,
    );
  }

  SeerrQuotaDetail? get _quotaDetail {
    final quota = widget.vm.state.quota;
    if (quota == null) return null;
    return widget.isTv ? quota.tv : quota.movie;
  }

  late final List<int> _seasonNumbers = seerrSeasonNumbersOf(
    widget.seasons,
    widget.numberOfSeasons,
  );

  Set<int> get _requestableSeasons => _seasonNumbers.toSet().difference({
    ..._quality.unavailableOrRequestedSeasons,
    ..._excludedSeasons,
  });

  bool get _hasSeasonSelection =>
      !widget.isCinema ||
      !widget.isTv ||
      (_allSeasons
          ? _excludedSeasons.isEmpty &&
              _requestableSeasons.isNotEmpty
          : _selectedSeasons.isNotEmpty &&
              _requestableSeasons.containsAll(_selectedSeasons));

  int get _seasonsNeeded {
    // Outside Cinema Mode, keep the existing All Seasons quota behavior. In Cinema Mode, count
    // only seasons that can still be requested.
    if (!widget.isCinema &&
        widget.isTv &&
        _allSeasons &&
        _seasonNumbers.isNotEmpty) {
      return _requestableSeasons.length.clamp(1, _seasonNumbers.length);
    }
    return seerrTvQuotaNeeded(
      allSeasons: _allSeasons,
      requestableSeasons: _requestableSeasons,
      selectedSeasons: _selectedSeasons,
    );
  }

  bool get _quotaBlocked =>
      seerrQuotaBlocked(_quotaDetail, widget.isTv ? _seasonsNeeded : 1);

  void _submit() {
    if (_submitting || !_hasSeasonSelection || _quotaBlocked) return;

    List<int>? seasons;
    if (widget.isTv && !_allSeasons) {
      seasons = _selectedSeasons.toList()..sort();
      if (seasons.isEmpty) return;
    }

    setState(() => _submitting = true);

    if (widget.isCinema) {
      Navigator.of(context).pop<_CinemaSelection>((
        selection: {
          'allSeasons': _allSeasons,
          'seasons': seasons ?? <int>[],
          'is4k': _is4k,
        },
        quota: _quotaDetail,
      ));
    } else {
      widget.vm.submitRequest(
        is4k: _is4k,
        seasons: seasons,
        allSeasons: widget.isTv && _allSeasons,
        profileId: widget.showAdvancedOptions
            ? _advanced.effectiveProfileId
            : null,
        rootFolder: widget.showAdvancedOptions
            ? _advanced.effectiveRootFolderPath
            : null,
        serverId: widget.showAdvancedOptions
            ? _advanced.effectiveServerId
            : null,
      );
      if (mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final quotaRow = _buildQuotaRow(l10n);
    final showToggle = _hasQualityToggle(widget.vm, widget.qualityToggle);
    final children = <Widget>[];
    if (widget.isTv && widget.isContinuing && _quality.isFullyAvailable) {
      final green = seerrStatusColor(SeerrMediaStatus.available);
      children.add(
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: green.withValues(alpha: 0.15),
            borderRadius: AppRadius.circular(8),
            border: Border.all(color: green.withValues(alpha: 0.4)),
          ),
          child: Row(
            children: [
              Icon(Icons.autorenew, color: green, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l10n.seerrSeriesContinuing,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (showToggle) {
      children.add(
        SeerrToggleRow(
          title: l10n.uhd4k,
          value: _is4k,
          autofocus: true,
          onChanged: (v) => setState(() {
            _is4k = v;
            if (widget.isCinema) {
              _allSeasons = false;
              _selectedSeasons.clear();
            }
            _applySavedPreferences();
          }),
        ),
      );
    }
    if (widget.isTv) {
      children.add(const Divider(color: Colors.white12));
      children.add(_buildSeasonSelector(autofocusAll: !showToggle));
    }
    if (widget.showAdvancedOptions && widget.vm.canRequestAdvanced) {
      children.add(const Divider(color: Colors.white12));
      children.add(SeerrAdvancedRequestOptions(controller: _advanced));
    }
    if (quotaRow != null) {
      children.add(const SizedBox(height: 12));
      children.add(quotaRow);
    }
    children.add(const SizedBox(height: 20));
    children.add(
      Row(
        children: [
          Expanded(
            child: SeerrDialogButton(
              label: l10n.cancel,
              onPressed: _submitting ? null : () => Navigator.of(context).pop(),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SeerrDialogButton(
              label: l10n.submitRequest,
              primary: true,
              primaryColor: const Color(0xFF6366F1),
              busy: _submitting,
              onPressed: !_hasSeasonSelection || _quotaBlocked || _submitting
                  ? null
                  : _submit,
            ),
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget? _buildQuotaRow(AppLocalizations l10n) {
    final detail = _quotaDetail;
    if (detail == null || detail.isUnlimited) return null;
    final limit = detail.limit ?? 0;
    final remaining = detail.remaining ?? 0;
    final blocked = _quotaBlocked;
    final label = blocked
        ? l10n.requestErrorQuota
        : widget.isTv
        ? l10n.seasonQuotaRemaining(remaining, limit)
        : l10n.movieQuotaRemaining(remaining, limit);
    return SeerrQuotaRow(label: label, blocked: blocked);
  }

  Widget _buildSeasonSelector({bool autofocusAll = false}) {
    final l10n = AppLocalizations.of(context);
    final seasonNumbers = _seasonNumbers;
    final quality = _quality;
    final unselectable = {
      ...quality.unavailableOrRequestedSeasons,
      ..._excludedSeasons,
    };
    final available = quality.availableSeasons;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeerrToggleRow(
          title: l10n.allSeasons,
          value: _allSeasons,
          checkbox: true,
          autofocus: autofocusAll,
          onChanged: _excludedSeasons.isNotEmpty
              ? null
              : (v) => setState(() {
                  _allSeasons = v;
                  if (_allSeasons) _selectedSeasons.clear();
                }),
        ),
        if (!_allSeasons && seasonNumbers.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: seasonNumbers.map((seasonNumber) {
                final taken = unselectable.contains(seasonNumber);
                final selected = _selectedSeasons.contains(seasonNumber);
                return SeerrChoiceChip(
                  label: l10n.seasonChip(seasonNumber),
                  selected: selected,
                  isAvailable: available.contains(seasonNumber),
                  onSelected: taken
                      ? null
                      : (v) => setState(() {
                          if (v) {
                            _selectedSeasons.add(seasonNumber);
                          } else {
                            _selectedSeasons.remove(seasonNumber);
                          }
                        }),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
