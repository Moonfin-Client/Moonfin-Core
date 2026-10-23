import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Plays the page's own item: the page replaces itself with autoPlay on.
void playItemOnScreen(BuildContext context) {
  final uri = GoRouterState.of(context).uri;
  context.replace(
    uri
        .replace(queryParameters: {...uri.queryParameters, 'autoPlay': 'true'})
        .toString(),
  );
}
