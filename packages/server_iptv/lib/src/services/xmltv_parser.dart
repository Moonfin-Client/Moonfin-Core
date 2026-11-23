import 'package:flutter/foundation.dart' show compute;
import 'package:xml/xml.dart';

class XmltvProgram {
  final String channelId;
  final String title;
  final String? description;
  final DateTime startTime;
  final DateTime endTime;
  final String? category;
  final String? icon;
  final String? episodeTitle;

  const XmltvProgram({
    required this.channelId,
    required this.title,
    this.description,
    required this.startTime,
    required this.endTime,
    this.category,
    this.icon,
    this.episodeTitle,
  });
}

class XmltvParseResult {
  final List<XmltvProgram> programs;

  const XmltvParseResult({required this.programs});
}

class XmltvParser {
  /// Parses off the main isolate where there's one. Browsers have no
  /// isolates, so on web compute runs it inline.
  static Future<XmltvParseResult> parseInIsolate(String xmlContent) =>
      compute(parse, xmlContent);

  static XmltvParseResult parse(String xmlContent) {
    final document = XmlDocument.parse(xmlContent);
    final tv = document.rootElement;

    final programs = <XmltvProgram>[];
    for (final element in tv.childElements) {
      if (element.localName != 'programme') continue;
      final program = _parseProgram(element);
      if (program != null) programs.add(program);
    }
    return XmltvParseResult(programs: programs);
  }

  static XmltvProgram? _parseProgram(XmlElement element) {
    final channelId = element.getAttribute('channel');
    final startStr = element.getAttribute('start');
    final stopStr = element.getAttribute('stop');
    final title = element.getElement('title')?.innerText;

    if (channelId == null ||
        startStr == null ||
        stopStr == null ||
        title == null) {
      return null;
    }

    final startTime = _parseXmltvTime(startStr);
    final endTime = _parseXmltvTime(stopStr);
    if (startTime == null || endTime == null) return null;

    final description = element.getElement('desc')?.innerText;
    final category = element.getElement('category')?.innerText;
    final icon = element.getElement('icon')?.getAttribute('src');
    final episodeTitle = element.getElement('sub-title')?.innerText;

    return XmltvProgram(
      channelId: channelId,
      title: title,
      description: description,
      startTime: startTime,
      endTime: endTime,
      category: category,
      icon: icon,
      episodeTitle: episodeTitle,
    );
  }

  static DateTime? _parseXmltvTime(String timeStr) {
    // XMLTV format: "20260413120000 +0000" or "20260413120000"
    final parts = timeStr.trim().split(' ');
    final dateStr = parts[0];

    if (dateStr.length < 14) return null;

    try {
      final year = int.parse(dateStr.substring(0, 4));
      final month = int.parse(dateStr.substring(4, 6));
      final day = int.parse(dateStr.substring(6, 8));
      final hour = int.parse(dateStr.substring(8, 10));
      final minute = int.parse(dateStr.substring(10, 12));
      final second = int.parse(dateStr.substring(12, 14));

      if (parts.length > 1) {
        final offsetStr = parts[1];
        final offsetSign = offsetStr.startsWith('-') ? -1 : 1;
        final offsetClean = offsetStr.replaceAll(RegExp(r'[^0-9]'), '');
        if (offsetClean.length >= 4) {
          final offsetHours = int.parse(offsetClean.substring(0, 2));
          final offsetMinutes = int.parse(offsetClean.substring(2, 4));
          final offset =
              Duration(hours: offsetHours, minutes: offsetMinutes) * offsetSign;
          return DateTime.utc(
            year,
            month,
            day,
            hour,
            minute,
            second,
          ).subtract(offset);
        }
      }

      return DateTime.utc(year, month, day, hour, minute, second);
    } catch (_) {
      return null;
    }
  }
}
