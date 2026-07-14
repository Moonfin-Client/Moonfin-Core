import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
import '../../preference/preference_constants.dart';
import 'overlay_sheet.dart';

class PersonalRatingDialog extends StatefulWidget {
  final PersonalRatingStyle style;
  final double? rating;
  final bool? likes;
  final Future<void> Function(bool likes) onSetThumbRating;
  final Future<void> Function(double rating) onSetNumericRating;
  final Future<void> Function() onClearRating;

  const PersonalRatingDialog({
    super.key,
    required this.style,
    required this.rating,
    required this.likes,
    required this.onSetThumbRating,
    required this.onSetNumericRating,
    required this.onClearRating,
  });

  static Future<void> show(
    BuildContext context, {
    required PersonalRatingStyle style,
    required double? rating,
    required bool? likes,
    required Future<void> Function(bool likes) onSetThumbRating,
    required Future<void> Function(double rating) onSetNumericRating,
    required Future<void> Function() onClearRating,
  }) async {
    await showFocusRestoringDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (_) => PersonalRatingDialog(
        style: style,
        rating: rating,
        likes: likes,
        onSetThumbRating: onSetThumbRating,
        onSetNumericRating: onSetNumericRating,
        onClearRating: onClearRating,
      ),
    );
  }

  @override
  State<PersonalRatingDialog> createState() => _PersonalRatingDialogState();
}

class _PersonalRatingDialogState extends State<PersonalRatingDialog> {
  late double _draftRating;
  bool _ratingChanged = false;
  bool _saving = false;

  bool? get _displayLikes =>
      widget.likes ?? (widget.rating == null ? null : widget.rating! >= 6.5);

  @override
  void initState() {
    super.initState();
    _draftRating = _normalizedRating(widget.rating);
    _ratingChanged = widget.rating == null;
  }

  double _normalizedRating(double? rating) {
    if (rating == null || !rating.isFinite) return 0;
    return rating.clamp(0, 10).toDouble();
  }

  String _formatRating(AppLocalizations l10n, double value) =>
      NumberFormat.decimalPattern(l10n.localeName).format(value);

  Future<void> _submit(Future<void> Function() mutation) async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      await mutation();
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).personalRatingSaveFailed,
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Widget _buildThumbs(AppLocalizations l10n) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ThumbRatingButton(
              icon: Icons.thumb_up,
              label: l10n.like,
              selected: _displayLikes == true,
              onPressed: _saving
                  ? null
                  : () => _submit(() => widget.onSetThumbRating(true)),
            ),
            const SizedBox(width: 12),
            _ThumbRatingButton(
              icon: Icons.thumb_down,
              label: l10n.dislike,
              selected: _displayLikes == false,
              onPressed: _saving
                  ? null
                  : () => _submit(() => widget.onSetThumbRating(false)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStarsEditor(AppLocalizations l10n) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Focus(
          autofocus: true,
          onKeyEvent: (_, event) {
            if (_saving || event is! KeyDownEvent) {
              return KeyEventResult.ignored;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
                _draftRating > 0) {
              setState(() {
                _draftRating =
                    (_draftRating - 0.5).clamp(0, 10).toDouble();
                _ratingChanged = true;
              });
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
                _draftRating < 10) {
              setState(() {
                _draftRating =
                    (_draftRating + 0.5).clamp(0, 10).toDouble();
                _ratingChanged = true;
              });
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: Semantics(
            label: l10n.personalRatingOutOfFive(
              _formatRating(l10n, _draftRating / 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final remaining = _draftRating / 2 - index;
                final icon = remaining >= 0.75
                    ? Icons.star
                    : remaining >= 0.25
                    ? Icons.star_half
                    : Icons.star_border;
                return GestureDetector(
                  key: ValueKey('personal_rating_star_$index'),
                  behavior: HitTestBehavior.opaque,
                  onTapDown: _saving
                      ? null
                      : (details) {
                          final isHalf = details.localPosition.dx < 24;
                          setState(() {
                            _draftRating = (index + (isHalf ? 0.5 : 1)) * 2;
                            _ratingChanged = true;
                          });
                        },
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Icon(icon, size: 44, color: Colors.amber),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.personalRatingOutOfFive(_formatRating(l10n, _draftRating / 2)),
        ),
      ],
    );
  }

  Widget _buildNumericEditor(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          tooltip: l10n.decrease,
          onPressed: _saving || _draftRating <= 0
              ? null
              : () => setState(() {
                  _draftRating = (_draftRating.ceilToDouble() - 1)
                      .clamp(0, 10)
                      .toDouble();
                  _ratingChanged = true;
                }),
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 120,
          child: Text(
            l10n.personalRatingOutOfTen(_formatRating(l10n, _draftRating)),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        IconButton(
          tooltip: l10n.increase,
          onPressed: _saving || _draftRating >= 10
              ? null
              : () => setState(() {
                  _draftRating = (_draftRating.floorToDouble() + 1)
                      .clamp(0, 10)
                      .toDouble();
                  _ratingChanged = true;
                }),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isThumbs = widget.style == PersonalRatingStyle.thumbs;
    final content = switch (widget.style) {
      PersonalRatingStyle.thumbs => _buildThumbs(l10n),
      PersonalRatingStyle.stars => _buildStarsEditor(l10n),
      PersonalRatingStyle.numeric => _buildNumericEditor(l10n),
    };

    return AlertDialog(
      title: Text(l10n.rate),
      content: SizedBox(width: 320, child: content),
      actions: [
        if (widget.rating != null)
          TextButton.icon(
            onPressed: _saving ? null : () => _submit(widget.onClearRating),
            icon: const Icon(Icons.clear),
            label: Text(l10n.personalRatingClear),
          ),
        if (!isThumbs)
          FilledButton(
            onPressed: _saving || !_ratingChanged
                ? null
                : () => _submit(() => widget.onSetNumericRating(_draftRating)),
            child: Text(l10n.save),
          ),
      ],
    );
  }
}

class _ThumbRatingButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onPressed;

  const _ThumbRatingButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      label: label,
      selected: selected,
      button: true,
      child: IconButton(
        autofocus: icon == Icons.thumb_up,
        tooltip: label,
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: selected
              ? colorScheme.primaryContainer
              : Colors.transparent,
          foregroundColor: selected
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSurface,
          side: BorderSide(
            color: selected ? colorScheme.primary : colorScheme.outline,
          ),
        ),
        icon: Icon(icon, size: 28),
      ),
    );
  }
}
