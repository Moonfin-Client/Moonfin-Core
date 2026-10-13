import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/util/interface_locale.dart';

void main() {
  const supported = [
    Locale('en'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
  ];
  test('Portuguese defaults to Portugal regardless of locale ordering', () {
    expect(
      resolveInterfaceLocale(const Locale('pt'), supported),
      const Locale('pt', 'PT'),
    );
    expect(
      resolveInterfaceLocale(const Locale('pt', 'AO'), supported),
      const Locale('pt', 'PT'),
    );
  });
  test(
    'Brazil stays explicit, including script and legacy underscore tags',
    () {
      expect(
        resolveInterfaceLocale(
          const Locale.fromSubtags(
            languageCode: 'pt',
            scriptCode: 'Latn',
            countryCode: 'BR',
          ),
          supported,
        ),
        const Locale('pt', 'BR'),
      );
      expect(
        interfaceLocaleOverride('pt_BR', supported),
        const Locale('pt', 'BR'),
      );
      expect(
        interfaceLocaleOverride('pt-Latn-BR', supported),
        const Locale('pt', 'BR'),
      );
    },
  );
  test('old preferences resolve to a visible picker selection', () {
    expect(interfaceLocaleOverride('pt', supported), const Locale('pt', 'PT'));
    expect(
      interfaceLocaleOverride('pt_PT', supported),
      const Locale('pt', 'PT'),
    );
    expect(supported.where(isVisibleInterfaceLocale), [
      const Locale('en'),
      const Locale('pt', 'BR'),
      const Locale('pt', 'PT'),
    ]);
  });
  test(
    'automatic and unsupported overrides fall back to system resolution',
    () {
      expect(interfaceLocaleOverride('system', supported), isNull);
      expect(interfaceLocaleOverride('invalid', supported), isNull);
      expect(
        resolveInterfaceLocale(const Locale('de'), supported),
        const Locale('en'),
      );
    },
  );
}
