import 'package:flutter/foundation.dart';

final homeRefreshBus = HomeRefreshBus();

class HomeRefreshBus extends ValueNotifier<int> {
  HomeRefreshBus() : super(0);

  bool _pendingRefresh = false;

  void request() {
    value = value + 1;
  }

  void requestAfterNavigation() {
    _pendingRefresh = true;
  }

  void requestNowOrAfterNavigation() {
    if (hasListeners) {
      request();
    } else {
      requestAfterNavigation();
    }
  }

  bool consumePending() {
    if (!_pendingRefresh) {
      return false;
    }
    _pendingRefresh = false;
    return true;
  }
}
