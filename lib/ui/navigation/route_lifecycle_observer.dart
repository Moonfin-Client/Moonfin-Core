import 'package:flutter/widgets.dart';

final routeLifecycleObserver = RouteObserver<ModalRoute<dynamic>>();

// A keyboard/dialog can cover an editor without ending its page's session.
final pageRouteLifecycleObserver = RouteObserver<PageRoute<dynamic>>();
