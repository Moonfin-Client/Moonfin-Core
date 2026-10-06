import 'package:jellyfin_preference/jellyfin_preference.dart';

import '../util/platform_detection.dart';
import 'user_preferences.dart';

/// How one row of buttons is arranged, kept per kind of device. A phone and a
/// TV want very different rows, and these settings follow the user between
/// devices, so each keeps its own arrangement rather than the last one edited
/// winning.
class ButtonLayout {
  const ButtonLayout({
    required this.hiddenTv,
    required this.hiddenMobile,
    required this.hiddenDesktop,
    this.orderTv,
    this.orderMobile,
    this.orderDesktop,
  });

  /// These hold the buttons switched off rather than the ones left on, so a
  /// button the app starts offering later shows up for people who already have
  /// a list.
  final Preference<String> hiddenTv;
  final Preference<String> hiddenMobile;
  final Preference<String> hiddenDesktop;

  /// Left out for a row that can only be switched on and off, which keeps the
  /// order it was declared in.
  final Preference<String>? orderTv;
  final Preference<String>? orderMobile;
  final Preference<String>? orderDesktop;

  bool get isReorderable =>
      orderTv != null && orderMobile != null && orderDesktop != null;

  Preference<String> get hiddenPreference =>
      _forThisDevice(hiddenTv, hiddenMobile, hiddenDesktop);

  /// Only meaningful when [isReorderable].
  Preference<String> get orderPreference =>
      _forThisDevice(orderTv!, orderMobile!, orderDesktop!);

  Set<String> hidden(UserPreferences prefs) =>
      _ids(prefs.get(hiddenPreference)).toSet();

  /// [all] rearranged into the order the user put this device's buttons in.
  /// Anything they never placed, such as a button added since they last
  /// touched this, follows the placed button it was declared after, so it
  /// lands where it belongs rather than at the end of the row.
  List<T> ordered<T>(
    List<T> all,
    String Function(T) idOf,
    UserPreferences prefs,
  ) {
    if (!isReorderable) return all;
    final stored = _ids(prefs.get(orderPreference));
    if (stored.isEmpty) return all;

    final placed = <String, int>{
      for (var i = 0; i < stored.length; i++) stored[i]: i,
    };
    final ranked = <({int rank, int declared, T item})>[];
    var carried = -1;
    for (var i = 0; i < all.length; i++) {
      carried = placed[idOf(all[i])] ?? carried;
      ranked.add((rank: carried, declared: i, item: all[i]));
    }
    ranked.sort((a, b) {
      final byRank = a.rank.compareTo(b.rank);
      return byRank != 0 ? byRank : a.declared.compareTo(b.declared);
    });
    return [for (final entry in ranked) entry.item];
  }

  Preference<String> _forThisDevice(
    Preference<String> tv,
    Preference<String> mobile,
    Preference<String> desktop,
  ) {
    if (PlatformDetection.useLeanbackUi) return tv;
    if (PlatformDetection.useMobileUi) return mobile;
    return desktop;
  }

  static List<String> _ids(String stored) =>
      stored.split(',').where((id) => id.isNotEmpty).toList();
}
