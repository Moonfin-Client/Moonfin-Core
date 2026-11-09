import 'dart:convert';
import 'dart:io';

/// Compares the old and new harness output and exits 1 on any difference.
void main(List<String> args) {
  final old = (jsonDecode(File(args[0]).readAsStringSync()) as Map).cast<String, Object?>();
  final now = (jsonDecode(File(args[1]).readAsStringSync()) as Map).cast<String, Object?>();
  final perFunction = <String, int>{};
  final differences = <String>[];
  for (final key in {...old.keys, ...now.keys}) {
    final function = key.split('|').first;
    perFunction[function] = (perFunction[function] ?? 0) + 1;
    if (!old.containsKey(key) || !now.containsKey(key) || old[key] != now[key]) {
      differences.add('$key\n  old: ${old[key]}\n  new: ${now[key]}');
    }
  }
  perFunction.forEach((function, count) => stdout.writeln('$function: $count cases'));
  stdout.writeln('total: ${old.length} old, ${now.length} new, ${differences.length} different');
  for (final d in differences.take(20)) {
    stdout.writeln(d);
  }
  if (differences.isNotEmpty) exitCode = 1;
}
