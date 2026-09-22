import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../util/error_message.dart';
import '../../../../util/platform_detection.dart';
import '../widgets/admin_form_styles.dart';

class AdminLogViewerScreen extends StatefulWidget {
  final String fileName;

  const AdminLogViewerScreen({
    super.key,
    required this.fileName,
  });

  @override
  State<AdminLogViewerScreen> createState() => _AdminLogViewerScreenState();
}

class _AdminLogViewerScreenState extends State<AdminLogViewerScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _loading = true;
  String? _error;
  String _content = '';
  String _query = '';
  String? _levelFilter;

  AdminSystemApi get _api => GetIt.instance<MediaServerClient>().adminSystemApi;

  @override
  void initState() {
    super.initState();
    _loadLog();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadLog() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final text = await _api.getLogFileContent(widget.fileName);
      if (!mounted) return;
      setState(() {
        _content = text;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = describeError(e, AppLocalizations.of(context));
        _loading = false;
      });
    }
  }

  List<String> get _lines {
    final all = _content.replaceAll('\r\n', '\n').split('\n');
    final q = _query.trim().toLowerCase();
    return all.where((line) {
      if (q.isNotEmpty && !line.toLowerCase().contains(q)) return false;
      if (_levelFilter != null &&
          !line.toUpperCase().contains('[$_levelFilter]')) {
        return false;
      }
      return true;
    }).toList();
  }

  Future<void> _copyAll() async {
    await Clipboard.setData(ClipboardData(text: _content));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).adminLogCopied)),
    );
  }

  /// The name to save under, always as .txt. Android's MimeTypeMap has no
  /// entry for .log, so a log saved under its own name ends up a type nothing
  /// offers to open, and the web picker rejects a name with no extension.
  String _saveFileName() {
    final name = widget.fileName.trim();
    if (name.isEmpty) return 'log.txt';
    final lower = name.toLowerCase();
    if (lower.endsWith('.txt')) return name;
    if (lower.endsWith('.log')) {
      return '${name.substring(0, name.length - 4)}.txt';
    }
    return '$name.txt';
  }

  Future<void> _saveToFile() async {
    final l10n = AppLocalizations.of(context);
    final fileName = _saveFileName();

    try {
      // The picker writes the file itself on every platform, so the content
      // goes out with the call. Android and iOS refuse it without the bytes.
      final path = await FilePicker.saveFile(
        dialogTitle: l10n.adminSaveLogFile,
        fileName: fileName,
        bytes: Uint8List.fromList(utf8.encode(_content)),
      );
      if (!mounted) return;
      // Web hands the blob to the browser and always answers null, so null
      // only means cancelled everywhere else.
      if (path == null && !PlatformDetection.isWeb) return;
      // Only desktop answers a path worth showing. Android gives back the
      // document uri it wrote to and web gives back nothing.
      final saved = PlatformDetection.isDesktop && path != null
          ? path
          : fileName;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminSavedTo(saved))),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.adminSaveFailed(describeError(e, l10n)))),
      );
    }
  }

  Color _lineColor(ThemeData theme, String line) {
    final upper = line.toUpperCase();
    if (upper.contains('[ERR]')) return AppColorScheme.statusRequested;
    if (upper.contains('[WRN]')) return AppColorScheme.statusPending;
    if (upper.contains('[INF]')) return AppColorScheme.statusAvailable;
    if (upper.contains('[DBG]')) {
      return AppColorScheme.onSurface.withValues(alpha: 0.6);
    }
    return theme.colorScheme.onSurface;
  }

  TextSpan _buildLineSpan({
    required String line,
    required TextStyle baseStyle,
    required TextStyle highlightStyle,
  }) {
    final q = _query.trim();
    if (q.isEmpty) {
      return TextSpan(text: line, style: baseStyle);
    }

    final lowerLine = line.toLowerCase();
    final lowerQuery = q.toLowerCase();
    final spans = <TextSpan>[];
    var start = 0;

    while (true) {
      final index = lowerLine.indexOf(lowerQuery, start);
      if (index < 0) {
        if (start < line.length) {
          spans.add(TextSpan(text: line.substring(start), style: baseStyle));
        }
        break;
      }

      if (index > start) {
        spans.add(TextSpan(text: line.substring(start, index), style: baseStyle));
      }

      final end = index + lowerQuery.length;
      spans.add(TextSpan(text: line.substring(index, end), style: highlightStyle));
      start = end;
    }

    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context).adminLogViewerLoadFailed(widget.fileName)),
            const SizedBox(height: 8),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton.tonal(
              onPressed: _loadLog,
              child: Text(AppLocalizations.of(context).retry),
            ),
          ],
        ),
      );
    }

    final lines = _lines;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: adminScreenHeader(
                  context,
                  title: widget.fileName,
                  icon: Icons.description_outlined,
                ),
              ),
              IconButton(
                tooltip: AppLocalizations.of(context).copy,
                onPressed: _copyAll,
                icon: const Icon(Icons.copy_all),
              ),
              if (!PlatformDetection.isTV)
                IconButton(
                  tooltip: AppLocalizations.of(context).save,
                  onPressed: _saveToFile,
                  icon: const Icon(Icons.download),
                ),
              IconButton(
                tooltip: AppLocalizations.of(context).refresh,
                onPressed: _loadLog,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _query = value),
            decoration: adminInputDecoration(
              hint: AppLocalizations.of(context).adminSearchInLog,
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(
          height: 38,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              for (final (label, filter) in <(String, String?)>[
                ('All', null),
                ('ERR', 'ERR'),
                ('WRN', 'WRN'),
                ('INF', 'INF'),
                ('DBG', 'DBG'),
              ])
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: FilterChip(
                    label: Text(label),
                    selected: _levelFilter == filter,
                    onSelected: (_) => setState(() => _levelFilter = filter),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              if (_query.isNotEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      AppLocalizations.of(context).adminLogViewerMatches(lines.length),
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: lines.isEmpty
              ? Center(child: Text(AppLocalizations.of(context).adminLogViewerNoMatches))
              : ListView.builder(
                  itemCount: lines.length,
                  itemBuilder: (context, index) {
                    final line = lines[index];
                    final color = _lineColor(theme, line);
                    final base = TextStyle(
                      color: color,
                      fontFamily: 'monospace',
                      fontSize: 12,
                      height: 1.35,
                    );
                    final highlight = base.copyWith(
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      fontWeight: FontWeight.w700,
                    );

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 48,
                            child: Text(
                              '${index + 1}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 11,
                                color: theme.colorScheme.outlineVariant,
                                fontFamily: 'monospace',
                                height: 1.35,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SelectableText.rich(
                              _buildLineSpan(
                                line: line,
                                baseStyle: base,
                                highlightStyle: highlight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
