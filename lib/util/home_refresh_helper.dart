import 'dart:async';

import 'package:get_it/get_it.dart';

import '../ui/screens/home/home_view_model.dart';

Timer? _followUpTimer;

/// Every image URL carries the server's image tag, so fresh rows are enough to
/// pick up new artwork and the image caches can stay where they are.
void refreshHomeRows({bool followUp = false}) {
  _reload();
  if (!followUp) return;

  // The server keeps downloading remote artwork after it answers, so the first
  // rows can still carry the old tag. A second pass picks up the new one.
  _followUpTimer?.cancel();
  _followUpTimer = Timer(const Duration(milliseconds: 2500), _reload);
}

void _reload() {
  if (!GetIt.instance.isRegistered<HomeViewModel>()) return;
  final home = GetIt.instance<HomeViewModel>();
  // Callers reach here from dispose, where the tree is locked and the
  // notifyListeners inside load would throw.
  scheduleMicrotask(() => home.load(forceRefresh: true));
}
