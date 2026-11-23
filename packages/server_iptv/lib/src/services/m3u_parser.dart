import '../models/m3u_entry.dart';

final _attributePattern = RegExp(r'([\w-]+)="([^"]*)"');
final _vodExtensions = {
  '.mp4',
  '.mkv',
  '.avi',
  '.flv',
  '.wmv',
  '.mov',
  '.webm',
};

/// Top level so it can run in another isolate.
List<M3uEntry> parseM3u(String content) => M3uParser().parse(content);

class M3uParser {
  List<M3uEntry> parse(String content) {
    final lines = content
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .toList();
    if (lines.isEmpty) return [];

    final entries = <M3uEntry>[];
    String? currentExtinf;
    String? currentExtgrp;

    for (final line in lines) {
      if (line.startsWith('#EXTM3U')) continue;

      if (line.startsWith('#EXTINF:')) {
        currentExtinf = line;
        continue;
      }

      if (line.startsWith('#EXTGRP:')) {
        currentExtgrp = line.substring(8).trim();
        continue;
      }

      if (line.startsWith('#')) continue;

      if (currentExtinf != null) {
        final entry = _parseEntry(currentExtinf, line, currentExtgrp);
        if (entry != null) entries.add(entry);
      }

      currentExtinf = null;
      currentExtgrp = null;
    }

    return entries;
  }

  M3uEntry? _parseEntry(String extinf, String url, String? extgrp) {
    if (url.isEmpty) return null;

    final attrs = <String, String>{};
    var attrsEnd = 0;
    for (final match in _attributePattern.allMatches(extinf)) {
      attrs[match.group(1)!.toLowerCase()] = match.group(2)!;
      attrsEnd = match.end;
    }

    // The title starts at the first comma after the attributes, so commas
    // inside the title survive.
    final commaIdx = extinf.indexOf(',', attrsEnd);
    final name = commaIdx >= 0 ? extinf.substring(commaIdx + 1).trim() : '';
    if (name.isEmpty && attrs['tvg-name']?.isEmpty != false) return null;

    final groupTitle = attrs['group-title'] ?? extgrp;
    final channelNum = int.tryParse(
      attrs['tvg-chno'] ?? attrs['channel-number'] ?? '',
    );

    final lowerUrl = url.toLowerCase();
    final isVod = _vodExtensions.any((ext) => lowerUrl.endsWith(ext));

    return M3uEntry(
      name: name.isNotEmpty ? name : (attrs['tvg-name'] ?? ''),
      streamUrl: url,
      groupTitle: groupTitle,
      tvgId: attrs['tvg-id'],
      tvgLogo: attrs['tvg-logo'],
      channelNumber: channelNum,
      isVod: isVod,
      attributes: attrs,
    );
  }
}
