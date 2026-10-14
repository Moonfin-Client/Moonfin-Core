import 'package:flutter_test/flutter_test.dart';
import 'package:moonfin/preference/home_section_config.dart';
import 'package:moonfin/preference/preference_constants.dart';

void main() {
  test('existing layouts gain On Now without enabling it or moving rows', () {
    final sections = HomeSectionConfig.fromJsonString(
      '[{"type":"livetv","enabled":true,"order":12}]',
    );
    final liveTv = sections.firstWhere((c) => c.type == HomeSectionType.liveTv);
    final onNow = sections.firstWhere((c) => c.type == HomeSectionType.onNow);

    expect(liveTv.enabled, isTrue);
    expect(liveTv.order, 12);
    expect(onNow.enabled, isFalse);
    expect(onNow.order, greaterThan(liveTv.order));
  });

  test('standalone On Now stays enabled when Live TV is disabled', () {
    final sections = HomeSectionConfig.fromJsonString(
      HomeSectionConfig.toJsonString(const [
        HomeSectionConfig(type: HomeSectionType.onNow, order: 0),
        HomeSectionConfig(
          type: HomeSectionType.liveTv,
          enabled: false,
          order: 1,
        ),
      ]),
    );

    expect(
      sections.firstWhere((c) => c.type == HomeSectionType.onNow).enabled,
      isTrue,
    );
    expect(
      sections.firstWhere((c) => c.type == HomeSectionType.liveTv).enabled,
      isFalse,
    );
    expect(sections.first.type, HomeSectionType.onNow);
  });
}
