import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/services/recording_owners_service.dart';
import '../../../l10n/app_localizations.dart';
import 'recording_owner_badge.dart';

/// "Alex is recording this" for [others] (the owners other than the signed in
/// user), or null when there are none. One name, two names, or "N other
/// users". With [waiting], the "also waiting for this" wording used for
/// recordings that are not complete yet.
String? ownerLineText(
  AppLocalizations l10n,
  List<RecordingOwner> others, {
  bool waiting = false,
}) {
  switch (others.length) {
    case 0:
      return null;
    case 1:
      final name = others[0].name;
      return waiting
          ? l10n.ownerWaitingOne(name)
          : l10n.ownerRecordingOne(name);
    case 2:
      final first = others[0].name;
      final second = others[1].name;
      return waiting
          ? l10n.ownerWaitingTwo(first, second)
          : l10n.ownerRecordingTwo(first, second);
    default:
      final count = others.length;
      return waiting
          ? l10n.ownerWaitingMany(count)
          : l10n.ownerRecordingMany(count);
  }
}

/// Small pictures and the [ownerLineText] sentence, for a details or dialog
/// body. Renders nothing when [others] is empty.
class RecordingOwnerLine extends StatelessWidget {
  const RecordingOwnerLine({
    super.key,
    required this.others,
    this.waiting = false,
    this.style,
  });

  final List<RecordingOwner> others;
  final bool waiting;
  final TextStyle? style;

  static const _maxPictures = 3;

  @override
  Widget build(BuildContext context) {
    final text = ownerLineText(
      AppLocalizations.of(context),
      others,
      waiting: waiting,
    );
    if (text == null) return const SizedBox.shrink();
    final base =
        style ??
        DefaultTextStyle.of(context).style.copyWith(color: AppColorScheme.onBackground.withValues(alpha: 0.7));
    // Sized from the text, so it follows the user's font size.
    final avatar = (base.fontSize ?? 14) * 1.6;
    final step = avatar * 0.65;
    final shown = others.take(_maxPictures).toList();
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ExcludeSemantics(
          child: SizedBox(
            width: avatar + step * (shown.length - 1),
            height: avatar,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                for (var i = 0; i < shown.length; i++)
                  Positioned(
                    left: step * i,
                    child: RecordingOwnerAvatar(owner: shown[i], size: avatar),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(width: avatar * 0.4),
        Flexible(child: Text(text, style: base)),
      ],
    );
  }
}
