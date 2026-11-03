import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/l10n/app_localizations.dart';
import 'package:playback_silo/playback_silo.dart';

/// The Silo strings are written for translators: Weblate shows each
/// string's description and placeholders, and translates from app_en.arb.
void main() {
  final arb =
      jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
          as Map<String, dynamic>;
  final siloKeys = [
    for (final key in arb.keys)
      if (!key.startsWith('@') && key.startsWith('silo')) key,
  ];

  test('there are Silo strings', () {
    expect(siloKeys, isNotEmpty);
  });

  test('every Silo string has a description', () {
    final missing = [
      for (final key in siloKeys)
        if (((arb['@$key'] as Map?)?['description'] as String? ?? '')
            .trim()
            .isEmpty)
          key,
    ];
    expect(missing, isEmpty);
  });

  test('every placeholder a Silo string uses is declared', () {
    final undeclared = <String>[];
    for (final key in siloKeys) {
      final text = arb[key] as String;
      final declared =
          ((arb['@$key'] as Map?)?['placeholders'] as Map?)?.keys.toSet() ??
          const <Object?>{};
      // The first word after each opening brace that isn't plural text.
      for (final match in RegExp(r'\{(\w+)[,}]').allMatches(text)) {
        final name = match.group(1)!;
        if (!declared.contains(name)) undeclared.add('$key: $name');
      }
    }
    expect(undeclared, isEmpty);
  });

  test("the player's Silo refusals match their English strings", () {
    // The player recognizes playback_silo's fixed texts and shows the
    // translated string instead, so both must stay the same in English.
    final en = lookupAppLocalizations(const Locale('en'));
    expect(en.siloPlaybackUnavailable, siloPlaybackUnavailableMessage);
    expect(en.siloPlaybackUpdateRequired, siloUpgradeRequiredMessage);
    expect(en.siloPlaybackEndedOnServer, siloEndedOnServerMessage);
  });
}
