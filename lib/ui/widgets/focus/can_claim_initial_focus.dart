import 'package:flutter/widgets.dart';

/// Whether a screen may take focus for itself right now.
///
/// False while something sits on top of it. A modal takes the focus with it,
/// and a screen underneath that grabs it back pulls the remote out from under
/// whatever the user is actually looking at.
///
/// A context with no route counts as claimable, so a widget pumped on its own
/// keeps the behaviour it had.
bool canClaimInitialFocus(BuildContext context) =>
    ModalRoute.isCurrentOf(context) ?? true;
