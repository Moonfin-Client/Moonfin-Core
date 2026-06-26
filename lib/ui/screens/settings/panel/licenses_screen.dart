part of '../settings_side_panel.dart';

class _LicensesScreen extends StatefulWidget {
  const _LicensesScreen();

  @override
  State<_LicensesScreen> createState() => _LicensesScreenState();
}

class _LicensesScreenState extends State<_LicensesScreen> {
  final _firstLicenseFocusNode = FocusNode(debugLabel: 'LicensesFirstItem');
  late final Future<List<_LicensePackageData>> _licensesFuture;

  @override
  void initState() {
    super.initState();
    _licensesFuture = _loadLicenses();
  }

  @override
  void dispose() {
    _firstLicenseFocusNode.dispose();
    super.dispose();
  }

  Future<List<_LicensePackageData>> _loadLicenses() async {
    final licenseBlocksByPackage = <String, List<String>>{};

    await for (final entry in LicenseRegistry.licenses) {
      final text = _licenseText(entry.paragraphs);
      if (text.isEmpty) continue;

      for (final package in entry.packages) {
        final normalized = package.trim();
        if (normalized.isEmpty) continue;
        if (normalized.toLowerCase() == 'moonfin') continue;
        licenseBlocksByPackage.putIfAbsent(normalized, () => []).add(text);
      }
    }

    final packages =
        licenseBlocksByPackage.entries
            .map(
              (entry) => _LicensePackageData(
                packageName: entry.key,
                blocks: List<String>.unmodifiable(entry.value),
              ),
            )
            .toList()
          ..sort(
            (a, b) => a.packageName.toLowerCase().compareTo(
              b.packageName.toLowerCase(),
            ),
          );

    return packages;
  }

  String _licenseText(Iterable<LicenseParagraph> paragraphs) {
    final buffer = StringBuffer();
    for (final paragraph in paragraphs) {
      final text = paragraph.text.trimRight();
      if (text.isEmpty) {
        buffer.writeln();
        continue;
      }
      final indent = '  ' * paragraph.indent;
      for (final line in text.split('\n')) {
        buffer.writeln('$indent${line.trimRight()}');
      }
      buffer.writeln();
    }
    return buffer.toString().trim();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return RequestInitialFocus(
      targetNode: PlatformDetection.isTV ? _firstLicenseFocusNode : null,
      child: Scaffold(
        appBar: buildSettingsAppBar(context, Text(l10n.settingsLicenses)),
        body: FutureBuilder<List<_LicensePackageData>>(
          future: _licensesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            final packages = snapshot.data ?? const <_LicensePackageData>[];
            return ListView(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    l10n.settingsPoweredByFlutter,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                for (final entry in packages)
                  _TvSettingsListTile(
                    focusNode: identical(entry, packages.firstOrNull)
                        ? _firstLicenseFocusNode
                        : null,
                    autofocus: identical(entry, packages.firstOrNull),
                    leading: const Icon(Icons.description_outlined),
                    title: Text(entry.packageName),
                    subtitle: Text(
                      l10n.settingsLicenseNoticesCount(entry.blocks.length),
                    ),
                    onTap: () => context.pushSettingsScreen(
                      _LicenseDetailScreen(entry: entry),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LicenseDetailScreen extends StatefulWidget {
  final _LicensePackageData entry;

  const _LicenseDetailScreen({required this.entry});

  @override
  State<_LicenseDetailScreen> createState() => _LicenseDetailScreenState();
}

class _LicenseDetailScreenState extends State<_LicenseDetailScreen> {
  final _scrollController = ScrollController();
  final _scrollFocusNode = FocusNode(debugLabel: 'LicenseDetailScroll');

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollFocusNode.dispose();
    super.dispose();
  }

  KeyEventResult _onScrollKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (!_scrollController.hasClients) return KeyEventResult.ignored;

    const delta = 120.0;
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _scrollBy(delta);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      _scrollBy(-delta);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _scrollBy(double delta) {
    final position = _scrollController.position;
    final target = (position.pixels + delta).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RequestInitialFocus(
      targetNode: PlatformDetection.isTV ? _scrollFocusNode : null,
      child: Scaffold(
        appBar: buildSettingsAppBar(context, Text(widget.entry.packageName)),
        body: Focus(
          focusNode: _scrollFocusNode,
          onKeyEvent: _onScrollKey,
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              itemCount: widget.entry.blocks.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  widget.entry.blocks[index],
                  style: const TextStyle(height: 1.45),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LicensePackageData {
  final String packageName;
  final List<String> blocks;

  const _LicensePackageData({required this.packageName, required this.blocks});
}
