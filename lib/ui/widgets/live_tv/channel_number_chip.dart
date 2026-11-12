import 'package:flutter/widgets.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../theme/app_theme_controller.dart';

/// A channel's number on an accent pill, as the mobile guide's Now/Next cards
/// show it after the channel's name. Search shows the same chip under the
/// channel's name, where a movie shows its year, so a number looks the same
/// wherever it turns up.
///
/// The fill and corners come from the active theme, and the font from the
/// theme's body text around it. The digits' colour is not from the theme: it
/// is the literal the guide's chip has always had, kept so the guide looks the
/// same as before this chip was shared.
class ChannelNumberChip extends StatelessWidget {
  final String number;

  const ChannelNumberChip(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    // The accent is read off the theme registry rather than the tree, so the
    // chip subscribes to theme changes itself instead of waiting on whatever
    // built it to rebuild.
    context.dependOnInheritedWidgetOfExactType<AppThemeScope>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColorScheme.accent,
        borderRadius: AppRadius.circular(8),
      ),
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Color(0xFF062430),
        ),
      ),
    );
  }
}
