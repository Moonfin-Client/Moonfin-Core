import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../util/platform_detection.dart';
import '../../../widgets/adaptive/adaptive_dialog.dart';
import '../../detail/modern/widgets/details_tab_bar.dart';
import '../providers/admin_user_providers.dart';
import '../widgets/admin_form_styles.dart';
import '../widgets/filesystem_browser.dart';

class AdminLibraryEditScreen extends ConsumerStatefulWidget {
  final String libraryId;
  const AdminLibraryEditScreen({super.key, required this.libraryId});

  @override
  ConsumerState<AdminLibraryEditScreen> createState() =>
      _AdminLibraryEditScreenState();
}

class _AdminLibraryEditScreenState
    extends ConsumerState<AdminLibraryEditScreen> {
  int _selectedTab = 0;
  final _tabFocusNodes = <int, FocusNode>{};
  late final MediaServerClient _client;

  VirtualFolderInfo? _library;
  late List<String> _paths;
  late Map<String, dynamic> _options;
  Map<String, dynamic> _available = const {};
  List<Map<String, dynamic>> _cultures = const [];
  List<Map<String, dynamic>> _countries = const [];

  bool _loading = true;
  bool _saving = false;
  String? _error;
  bool _showBrowser = false;

  @override
  void initState() {
    super.initState();
    _client = GetIt.instance<MediaServerClient>();
    _paths = [];
    _options = {};
    _loadLibrary();
  }

  FocusNode _tabNode(int index) {
    return _tabFocusNodes.putIfAbsent(
        index, () => FocusNode(debugLabel: 'admin_library_tab_$index'));
  }

  @override
  void dispose() {
    for (final node in _tabFocusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> _loadLibrary() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final folders = await _client.adminLibraryApi.getVirtualFolders();
      if (!mounted) return;
      final lib = folders.firstWhere(
        (f) => f.itemId == widget.libraryId,
        orElse: () => throw Exception('Library not found'),
      );
      // Language/country lists are optional; degrade to empty on older servers.
      final cultures = await _client.adminSystemApi
          .getCultures()
          .catchError((_) => <Map<String, dynamic>>[]);
      final countries = await _client.adminSystemApi
          .getCountries()
          .catchError((_) => <Map<String, dynamic>>[]);
      final available = await _client.adminLibraryApi
          .getAvailableLibraryOptions(lib.collectionType)
          .catchError((_) => <String, dynamic>{});
      if (!mounted) return;
      setState(() {
        _library = lib;
        _paths = List<String>.from(lib.locations);
        _options = Map<String, dynamic>.from(lib.libraryOptions ?? {});
        _available = available;
        _cultures = cultures;
        _countries = countries;
        _seedDownloaderOptions();
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _addPath(String path) async {
    if (_paths.contains(path)) return;
    setState(() => _saving = true);
    try {
      await _client.adminLibraryApi.addMediaPath(_library!.name, path);
      setState(() => _paths.add(path));
      ref.invalidate(adminLibrariesProvider);
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminAddPathFailed(e.toString()))),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _saving = false;
          _showBrowser = false;
        });
      }
    }
  }

  Future<void> _removePath(String path) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog.adaptive(
        title: Text(l10n.adminRemovePath),
        content: Text(l10n.adminRemovePathConfirm(path)),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.remove),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() => _saving = true);
    try {
      await _client.adminLibraryApi
          .removeMediaPath(_library!.name, path, refreshLibrary: true);
      setState(() => _paths.remove(path));
      ref.invalidate(adminLibrariesProvider);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminRemovePathFailed(e.toString()))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _saveOptions() async {
    setState(() => _saving = true);
    try {
      await _client.adminLibraryApi
          .updateLibraryOptions(widget.libraryId, _options);
      ref.invalidate(adminLibrariesProvider);
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminLibraryOptionsSaved)),
        );
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adminLibraryOptionsSaveFailed(e.toString()))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  // ---- Downloaders (metadata / image / subtitle / lyric fetchers + savers) --

  List<Map<String, dynamic>> _availableList(String key) {
    final raw = _available[key];
    if (raw is List) {
      return raw
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }
    return const [];
  }

  /// Ensures [name] is present in [list] exactly when [present] is true.
  void _setMembership(List<String> list, String name, bool present) {
    if (present) {
      if (!list.contains(name)) list.add(name);
    } else {
      list.remove(name);
    }
  }

  /// The library's stored per-type option map for [type], creating it (and
  /// preserving any existing entries and their other fields) if absent.
  Map<String, dynamic> _typeOptionsFor(String type) {
    final list = (_options['TypeOptions'] as List?)?.whereType<Map>().toList() ??
        const <Map>[];
    for (final t in list) {
      if (t['Type'] == type) return t.cast<String, dynamic>();
    }
    final created = <String, dynamic>{'Type': type};
    _options['TypeOptions'] = [
      ...list.map((e) => e.cast<String, dynamic>()),
      created,
    ];
    return created;
  }

  /// Orders [available] provider maps by [order] (configured names first), then
  /// any remaining in their available order.
  List<Map<String, dynamic>> _ordered(
      List<Map<String, dynamic>> available, List<String> order) {
    final byName = {
      for (final p in available) (p['Name']?.toString() ?? ''): p,
    };
    final result = <Map<String, dynamic>>[];
    for (final name in order) {
      final p = byName.remove(name);
      if (p != null) result.add(p);
    }
    result.addAll(byName.values);
    return result;
  }

  List<String> _names(List<Map<String, dynamic>> plugins) => plugins
      .map((p) => p['Name']?.toString() ?? '')
      .where((n) => n.isNotEmpty)
      .toList();

  List<String> _defaultEnabled(List<Map<String, dynamic>> plugins) => plugins
      .where((p) => p['DefaultEnabled'] == true)
      .map((p) => p['Name'].toString())
      .toList();

  /// Writes the effective enabled/order arrays into [_options] so the tab reads
  /// and writes them directly and saving needs no extra reconciliation.
  void _seedDownloaderOptions() {
    if (_available.isEmpty) return;

    final savers = _availableList('MetadataSavers');
    if (savers.isNotEmpty) {
      _options['MetadataSavers'] =
          (_options['MetadataSavers'] as List?)?.map((e) => e.toString()).toList() ??
              _defaultEnabled(savers);
    }

    _seedGlobalFetchers(
        'SubtitleFetchers', 'SubtitleFetcherOrder', 'DisabledSubtitleFetchers');
    _seedGlobalFetchers(
        'LyricFetchers', 'LyricFetcherOrder', 'DisabledLyricFetchers');

    for (final typeOpt in _availableList('TypeOptions')) {
      final type = typeOpt['Type']?.toString();
      if (type == null) continue;
      final stored = _typeOptionsFor(type);
      _seedTypeFetchers(stored, typeOpt, 'MetadataFetchers', 'MetadataFetcherOrder');
      _seedTypeFetchers(stored, typeOpt, 'ImageFetchers', 'ImageFetcherOrder');
    }
  }

  void _seedGlobalFetchers(
      String availKey, String orderKey, String disabledKey) {
    final avail = _availableList(availKey);
    if (avail.isEmpty) return;
    final order =
        (_options[orderKey] as List?)?.map((e) => e.toString()).toList() ??
            const <String>[];
    _options[orderKey] = _names(_ordered(avail, order));
    _options[disabledKey] =
        (_options[disabledKey] as List?)?.map((e) => e.toString()).toList() ??
            avail
                .where((p) => p['DefaultEnabled'] != true)
                .map((p) => p['Name'].toString())
                .toList();
  }

  void _seedTypeFetchers(Map<String, dynamic> stored,
      Map<String, dynamic> typeOpt, String enabledKey, String orderKey) {
    final avail = (typeOpt[enabledKey] as List?)
            ?.whereType<Map>()
            .map((e) => e.cast<String, dynamic>())
            .toList() ??
        const <Map<String, dynamic>>[];
    if (avail.isEmpty) return;
    final order =
        (stored[orderKey] as List?)?.map((e) => e.toString()).toList() ??
            const <String>[];
    stored[orderKey] = _names(_ordered(avail, order));
    stored[enabledKey] =
        (stored[enabledKey] as List?)?.map((e) => e.toString()).toList() ??
            _defaultEnabled(avail);
  }

  Widget _buildDownloadersTab() {
    final l10n = AppLocalizations.of(context);
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    final savers = _availableList('MetadataSavers');
    final subs = _availableList('SubtitleFetchers');
    final lyrics = _availableList('LyricFetchers');
    final types = _availableList('TypeOptions');
    final hasAny = savers.isNotEmpty ||
        subs.isNotEmpty ||
        lyrics.isNotEmpty ||
        types.isNotEmpty;

    if (!hasAny) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(l10n.adminLibNoDownloaders, textAlign: TextAlign.center),
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(16, 4, 16, bottomSafe + 40),
      children: [
        for (final t in types)
          if ((t['MetadataFetchers'] as List?)?.isNotEmpty ?? false) ...[
            adminSectionLabel(
                context, l10n.adminLibMetadataDownloadersFor(t['Type'].toString()),
                icon: Icons.cloud_download_outlined),
            _typeFetcherList(t, meta: true),
          ],
        if (savers.isNotEmpty) ...[
          adminSectionLabel(context, l10n.adminLibMetadataSavers,
              icon: Icons.save_outlined),
          _saverList(savers),
        ],
        for (final t in types)
          if ((t['ImageFetchers'] as List?)?.isNotEmpty ?? false) ...[
            adminSectionLabel(
                context, l10n.adminLibImageFetchersFor(t['Type'].toString()),
                icon: Icons.image_outlined),
            _typeFetcherList(t, meta: false),
          ],
        if (subs.isNotEmpty) ...[
          adminSectionLabel(context, l10n.adminLibSubtitleDownloaders,
              icon: Icons.subtitles_outlined),
          _globalFetcherList('SubtitleFetcherOrder', 'DisabledSubtitleFetchers'),
        ],
        if (lyrics.isNotEmpty) ...[
          adminSectionLabel(context, l10n.adminLibLyricDownloaders,
              icon: Icons.lyrics_outlined),
          _globalFetcherList('LyricFetcherOrder', 'DisabledLyricFetchers'),
        ],
        const SizedBox(height: AppSpacing.spaceXl),
        adminSaveButton(label: l10n.save, saving: _saving, onPressed: _saveOptions),
      ],
    );
  }

  Widget _typeFetcherList(Map<String, dynamic> availType, {required bool meta}) {
    final type = availType['Type'].toString();
    final stored = _typeOptionsFor(type);
    final orderKey = meta ? 'MetadataFetcherOrder' : 'ImageFetcherOrder';
    final enabledKey = meta ? 'MetadataFetchers' : 'ImageFetchers';
    final order =
        (stored[orderKey] as List?)?.map((e) => e.toString()).toList() ??
            const <String>[];
    final enabled = ((stored[enabledKey] as List?) ?? const [])
        .map((e) => e.toString())
        .toSet();
    return _providerList(
      names: order,
      isEnabled: enabled.contains,
      onToggle: (name, value) => setState(() {
        final list = List<String>.from(stored[enabledKey] as List? ?? const []);
        _setMembership(list, name, value);
        stored[enabledKey] = list;
      }),
      onMove: (index, delta) =>
          _moveInList(stored, orderKey, order, index, delta),
    );
  }

  Widget _globalFetcherList(String orderKey, String disabledKey) {
    final order =
        (_options[orderKey] as List?)?.map((e) => e.toString()).toList() ??
            const <String>[];
    final disabled = ((_options[disabledKey] as List?) ?? const [])
        .map((e) => e.toString())
        .toSet();
    return _providerList(
      names: order,
      isEnabled: (name) => !disabled.contains(name),
      onToggle: (name, value) => setState(() {
        final list = List<String>.from(_options[disabledKey] as List? ?? const []);
        _setMembership(list, name, !value);
        _options[disabledKey] = list;
      }),
      onMove: (index, delta) =>
          _moveInList(_options, orderKey, order, index, delta),
    );
  }

  Widget _saverList(List<Map<String, dynamic>> savers) {
    final enabled = ((_options['MetadataSavers'] as List?) ?? const [])
        .map((e) => e.toString())
        .toSet();
    return _providerList(
      names: _names(savers),
      isEnabled: enabled.contains,
      onToggle: (name, value) => setState(() {
        final list =
            List<String>.from(_options['MetadataSavers'] as List? ?? const []);
        _setMembership(list, name, value);
        _options['MetadataSavers'] = list;
      }),
    );
  }

  void _moveInList(Map<String, dynamic> owner, String orderKey,
      List<String> current, int index, int delta) {
    final target = index + delta;
    if (target < 0 || target >= current.length) return;
    setState(() {
      final list = List<String>.from(owner[orderKey] as List? ?? current);
      final moved = list.removeAt(index);
      list.insert(target, moved);
      owner[orderKey] = list;
    });
  }

  Widget _providerList({
    required List<String> names,
    required bool Function(String) isEnabled,
    required void Function(String name, bool enabled) onToggle,
    void Function(int index, int delta)? onMove,
  }) {
    return adminGlassGroup(
      context,
      children: [
        for (var i = 0; i < names.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Row(
              children: [
                Checkbox(
                  value: isEnabled(names[i]),
                  onChanged: (v) => onToggle(names[i], v ?? false),
                ),
                Expanded(
                  child: Text(names[i], style: const TextStyle(fontSize: 15)),
                ),
                if (onMove != null) ...[
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_up),
                    visualDensity: VisualDensity.compact,
                    onPressed: i > 0 ? () => onMove(i, -1) : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    visualDensity: VisualDensity.compact,
                    onPressed: i < names.length - 1 ? () => onMove(i, 1) : null,
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.adminLibraryLoadFailed,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(_error!, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 16),
            FilledButton.tonal(
                onPressed: _loadLibrary, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: adminScreenHeader(
            context,
            title: _library!.name,
            subtitle: _library!.collectionType,
            icon: Icons.folder_open,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: DetailsTabBar(
            segmented: true,
            wrap: PlatformDetection.useMobileUi,
            labels: [
              l10n.adminLibraryTabPaths,
              l10n.adminLibraryTabOptions,
              l10n.adminLibraryTabDownloaders,
            ],
            selectedIndex: _selectedTab,
            onSelect: (i) => setState(() => _selectedTab = i),
            focusNodeFor: _tabNode,
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedTab,
            children: [
              _buildPathsTab(),
              _buildOptionsTab(),
              _buildDownloadersTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPathsTab() {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ..._paths.map((path) => ListTile(
              leading: const Icon(Icons.folder),
              title: Text(path,
                  style:
                      const TextStyle(fontFamily: 'monospace', fontSize: 13)),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: _saving ? null : () => _removePath(path),
              ),
              dense: true,
            )),
        if (_paths.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(l10n.adminNoMediaPaths),
          ),
        const Divider(),
        if (!_showBrowser)
          Align(
            alignment: Alignment.centerLeft,
            child: FilledButton.icon(
              onPressed: () => setState(() => _showBrowser = true),
              icon: const Icon(Icons.add),
              label: Text(l10n.adminAddPath),
            ),
          )
        else ...[
          Row(
            children: [
              Text(l10n.adminBrowseFilesystem,
                  style: Theme.of(context).textTheme.titleSmall),
              const Spacer(),
              TextButton(
                onPressed: () => setState(() => _showBrowser = false),
                child: Text(l10n.cancel),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 350,
            child: FilesystemBrowser(onPathSelected: _addPath),
          ),
        ],
      ],
    );
  }

  Widget _buildOptionsTab() {
    final l10n = AppLocalizations.of(context);
    final type = _library!.collectionType;
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    return ListView(
      padding: EdgeInsets.fromLTRB(16, 8, 16, bottomSafe + 40),
      children: [
        adminSection(
          context,
          title: l10n.adminLibrarySectionGeneral,
          icon: Icons.tune,
          children: [
            _optionSwitch('EnableRealtimeMonitor', l10n.adminLibRealtimeMonitor,
                subtitle: l10n.adminLibRealtimeMonitorHint),
            _optionSwitch(
                'EnableArchiveMediaFiles', l10n.adminLibArchiveMediaFiles),
            if (type == 'homevideos' || type == 'photos' || type == 'mixed')
              _optionSwitch('EnablePhotos', l10n.adminLibEnablePhotos),
            _optionSwitch('SaveLocalMetadata', l10n.adminLibSaveLocalMetadata),
          ],
        ),
        adminSectionLabel(context, l10n.adminLibrarySectionMetadata,
            icon: Icons.language),
        _buildMetadataLanguage(),
        const SizedBox(height: 12),
        _buildMetadataCountry(),
        const SizedBox(height: 12),
        _buildRefreshInterval(l10n),
        adminSection(
          context,
          title: l10n.adminLibrarySectionEmbedded,
          icon: Icons.data_object,
          children: [
            _optionSwitch('EnableEmbeddedTitles', l10n.adminLibEmbeddedTitles),
            _optionSwitch('EnableEmbeddedExtrasTitles',
                l10n.adminLibEmbeddedExtrasTitles),
            if (type == 'tvshows')
              _optionSwitch('EnableEmbeddedEpisodeInfos',
                  l10n.adminLibEmbeddedEpisodeInfos),
          ],
        ),
        const SizedBox(height: 12),
        _buildEmbeddedSubtitles(l10n),
        adminSection(
          context,
          title: l10n.adminLibrarySectionSubtitles,
          icon: Icons.subtitles_outlined,
          children: [
            _optionSwitch('SkipSubtitlesIfEmbeddedSubtitlesPresent',
                l10n.adminLibSkipIfEmbeddedSubs),
            _optionSwitch('SkipSubtitlesIfAudioTrackMatches',
                l10n.adminLibSkipIfAudioMatches),
            _optionSwitch(
                'RequirePerfectSubtitleMatch', l10n.adminLibRequirePerfectMatch),
            _optionSwitch(
                'SaveSubtitlesWithMedia', l10n.adminLibSaveSubtitlesWithMedia),
          ],
        ),
        adminSection(
          context,
          title: l10n.adminLibrarySectionImages,
          icon: Icons.image_outlined,
          children: [
            _optionSwitch('EnableChapterImageExtraction',
                l10n.adminLibChapterImageExtraction),
            _optionSwitch('ExtractChapterImagesDuringLibraryScan',
                l10n.adminLibChapterImagesDuringScan),
            _optionSwitch(
                'EnableTrickplayImageExtraction', l10n.adminLibTrickplayExtraction),
            _optionSwitch('ExtractTrickplayImagesDuringLibraryScan',
                l10n.adminLibTrickplayDuringScan),
            _optionSwitch(
                'SaveTrickplayWithMedia', l10n.adminLibSaveTrickplayWithMedia),
          ],
        ),
        if (type == 'tvshows')
          adminSection(
            context,
            title: l10n.adminLibrarySectionSeries,
            icon: Icons.live_tv,
            children: [
              _optionSwitch('EnableAutomaticSeriesGrouping',
                  l10n.adminLibAutomaticSeriesGrouping),
            ],
          ),
        if (type == 'tvshows') ...[
          const SizedBox(height: 12),
          _buildSeasonZeroName(l10n),
        ],
        if (type == 'music')
          adminSection(
            context,
            title: l10n.adminLibrarySectionMusic,
            icon: Icons.music_note,
            children: [
              _optionSwitch('EnableLUFSScan', l10n.adminLibLufsScan),
              _optionSwitch('PreferNonstandardArtistsTag',
                  l10n.adminLibPreferNonstandardArtist),
            ],
          ),
        if (type == 'movies' || type == 'mixed')
          adminSection(
            context,
            title: l10n.adminLibrarySectionMovies,
            icon: Icons.movie_outlined,
            children: [
              _optionSwitch('AutomaticallyAddToCollection',
                  l10n.adminLibAutoAddToCollection),
            ],
          ),
        const SizedBox(height: 24),
        adminSaveButton(
          label: l10n.adminSaveOptions,
          saving: _saving,
          onPressed: _saveOptions,
        ),
      ],
    );
  }

  Widget _optionSwitch(String key, String title, {String? subtitle}) {
    return adminSwitchRow(
      title: title,
      subtitle: subtitle,
      value: _options[key] as bool? ?? false,
      onChanged: (v) => setState(() => _options[key] = v),
    );
  }

  Widget _buildRefreshInterval(AppLocalizations l10n) {
    final current = (_options['AutomaticRefreshIntervalDays'] as num?)?.toInt() ?? 0;
    const days = [0, 30, 60, 90, 120, 180, 360];
    final value = days.contains(current) ? current : 0;
    return DropdownButtonFormField<int>(
      initialValue: value,
      decoration: adminInputDecoration(label: l10n.adminLibRefreshInterval),
      items: days
          .map((d) => DropdownMenuItem(
                value: d,
                child: Text(d == 0
                    ? l10n.adminLibRefreshNever
                    : l10n.adminLibRefreshDays(d)),
              ))
          .toList(),
      onChanged: (v) =>
          setState(() => _options['AutomaticRefreshIntervalDays'] = v),
    );
  }

  Widget _buildEmbeddedSubtitles(AppLocalizations l10n) {
    final current =
        _options['AllowEmbeddedSubtitles']?.toString() ?? 'AllowAll';
    final options = <(String, String)>[
      ('AllowAll', l10n.adminLibEmbeddedAllowAll),
      ('AllowText', l10n.adminLibEmbeddedAllowText),
      ('AllowImage', l10n.adminLibEmbeddedAllowImage),
      ('AllowNone', l10n.adminLibEmbeddedAllowNone),
    ];
    final value = options.any((o) => o.$1 == current) ? current : 'AllowAll';
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration:
          adminInputDecoration(label: l10n.adminLibAllowEmbeddedSubtitles),
      items: options
          .map((o) => DropdownMenuItem(value: o.$1, child: Text(o.$2)))
          .toList(),
      onChanged: (v) => setState(() => _options['AllowEmbeddedSubtitles'] = v),
    );
  }

  Widget _buildSeasonZeroName(AppLocalizations l10n) {
    return TextFormField(
      key: ValueKey('season_zero_${_options['SeasonZeroDisplayName']}'),
      initialValue: _options['SeasonZeroDisplayName'] as String? ?? '',
      decoration: adminInputDecoration(label: l10n.adminLibSeasonZeroName),
      onChanged: (v) => _options['SeasonZeroDisplayName'] = v,
    );
  }

  Widget _buildMetadataLanguage() {
    final l10n = AppLocalizations.of(context);
    final current = _options['PreferredMetadataLanguage'] as String? ?? '';
    if (_cultures.isEmpty) {
      return TextFormField(
        initialValue: current,
        decoration: adminInputDecoration(
          label: l10n.adminPreferredMetadataLanguage,
          hint: l10n.adminMetadataLanguageHint,
        ),
        onChanged: (v) => _options['PreferredMetadataLanguage'] = v,
      );
    }
    return _codeDropdown(
      label: l10n.adminPreferredMetadataLanguage,
      key: 'PreferredMetadataLanguage',
      rawItems: _cultures.map((c) => (
            (c['TwoLetterISOLanguageName'] ?? c['ThreeLetterISOLanguageName'])
                ?.toString(),
            (c['DisplayName'] ?? c['Name'])?.toString(),
          )),
    );
  }

  Widget _buildMetadataCountry() {
    final l10n = AppLocalizations.of(context);
    final current = _options['MetadataCountryCode'] as String? ?? '';
    if (_countries.isEmpty) {
      return TextFormField(
        initialValue: current,
        decoration: adminInputDecoration(
          label: l10n.adminMetadataCountryCode,
          hint: l10n.adminMetadataCountryHint,
        ),
        onChanged: (v) => _options['MetadataCountryCode'] = v,
      );
    }
    return _codeDropdown(
      label: l10n.adminMetadataCountryCode,
      key: 'MetadataCountryCode',
      rawItems: _countries.map((c) => (
            (c['TwoLetterISORegionName'] ?? c['Name'])?.toString(),
            (c['DisplayName'] ?? c['Name'])?.toString(),
          )),
    );
  }

  Widget _codeDropdown({
    required String label,
    required String key,
    required Iterable<(String?, String?)> rawItems,
  }) {
    return adminCodeDropdown(
      label: label,
      defaultLabel: AppLocalizations.of(context).adminLibDefault,
      current: _options[key] as String? ?? '',
      rawItems: rawItems,
      onChanged: (v) => setState(() => _options[key] = v),
    );
  }
}
