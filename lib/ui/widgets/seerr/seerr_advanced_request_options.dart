import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';

import '../../../data/repositories/seerr_repository.dart';
import '../../../data/services/seerr/seerr_api_models.dart';
import '../../../l10n/app_localizations.dart';
import '../focus/focusable_wrapper.dart';
import 'seerr_tv_controls.dart';

/// Holds the Radarr/Sonarr server, profile, and root folder selection for a
/// request, including the saved-preference and anime defaults. Shared by the
/// single request dialog and the collection request sheet.
class SeerrAdvancedRequestController extends ChangeNotifier {
  final bool isTv;
  final bool isAnime;
  bool is4k;

  List<SeerrServiceServerDetails>? servers;
  bool loading = false;

  int? selectedServerId;
  int? selectedProfileId;
  int? selectedRootFolderId;

  String? _savedServerId;
  String? _savedProfileId;
  String? _savedRootFolderId;

  SeerrAdvancedRequestController({
    required this.isTv,
    this.isAnime = false,
    this.is4k = false,
  });

  Future<void> load() async {
    loading = true;
    notifyListeners();
    try {
      final repo = await GetIt.instance.getAsync<SeerrRepository>();
      if (isTv) {
        final sonarrServers = await repo.getSonarrServers();
        servers = await Future.wait(
          sonarrServers.map((s) => repo.getSonarrServerDetails(s.id)),
        );
      } else {
        final radarrServers = await repo.getRadarrServers();
        servers = await Future.wait(
          radarrServers.map((s) => repo.getRadarrServerDetails(s.id)),
        );
      }
      _applySavedPreferences();
    } catch (_) {
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  /// Called on init and whenever the 4K toggle flips, with the saved defaults
  /// for the now-active flavor.
  void applySavedPreferences({
    String? serverId,
    String? profileId,
    String? rootFolderId,
    bool resetSelection = false,
    bool? is4k,
  }) {
    if (is4k != null) {
      this.is4k = is4k;
    }
    _savedServerId = serverId;
    _savedProfileId = profileId;
    _savedRootFolderId = rootFolderId;
    if (resetSelection) {
      selectedServerId = null;
      selectedProfileId = null;
      selectedRootFolderId = null;
    }
    _applySavedPreferences();
    notifyListeners();
  }

  void _applySavedPreferences() {
    if (_savedServerId != null && _savedServerId!.isNotEmpty) {
      selectedServerId ??= int.tryParse(_savedServerId!);
    }
    if (_savedProfileId != null && _savedProfileId!.isNotEmpty) {
      selectedProfileId ??= int.tryParse(_savedProfileId!);
    }
    if (_savedRootFolderId != null && _savedRootFolderId!.isNotEmpty) {
      selectedRootFolderId ??= int.tryParse(_savedRootFolderId!);
    }
    _applyServerDefaults();
  }

  void _applyServerDefaults() {
    final server = activeServer;
    if (server == null) return;
    selectedServerId ??= server.server.id;

    final int? animeProfileId = server.server.activeAnimeProfileId;
    final String? animeDir = server.server.activeAnimeDirectory;

    if (isAnime && animeProfileId != null) {
      selectedProfileId ??= animeProfileId;
    } else {
      selectedProfileId ??= server.server.activeProfileId;
    }

    final String dir;
    if (isAnime && animeDir != null && animeDir.isNotEmpty) {
      dir = animeDir;
    } else {
      dir = server.server.activeDirectory;
    }

    if (selectedRootFolderId == null && dir.isNotEmpty) {
      final match = server.rootFolders.where((f) => f.path == dir).firstOrNull;
      if (match != null) selectedRootFolderId = match.id;
    }
  }

  SeerrServiceServerDetails? _findDefaultServer() {
    if (servers == null || servers!.isEmpty) return null;

    // 1. Try to find a server that matches both is4k and isDefault
    final primaryMatch = servers!
        .where((s) => s.server.is4k == is4k && s.server.isDefault)
        .firstOrNull;
    if (primaryMatch != null) return primaryMatch;

    // 2. Try to find any server that matches is4k
    final secondaryMatch = servers!
        .where((s) => s.server.is4k == is4k)
        .firstOrNull;
    if (secondaryMatch != null) return secondaryMatch;

    // 3. Fall back to the first server in the list
    return servers!.first;
  }

  SeerrServiceServerDetails? get activeServer {
    if (servers == null || servers!.isEmpty) return null;
    if (selectedServerId == null) return _findDefaultServer();
    return servers!
            .where((s) => s.server.id == selectedServerId)
            .firstOrNull ??
        _findDefaultServer();
  }

  int? get effectiveServerId =>
      selectedServerId ?? activeServer?.server.id;

  int? get effectiveProfileId {
    if (selectedProfileId != null) return selectedProfileId;
    final server = activeServer;
    if (server == null) return null;
    final int? animeProfileId = server.server.activeAnimeProfileId;
    if (isAnime && animeProfileId != null) return animeProfileId;
    return server.server.activeProfileId;
  }

  String? get effectiveRootFolderPath {
    final server = activeServer;
    if (server == null) return null;

    if (selectedRootFolderId != null) {
      return server.rootFolders
          .where((f) => f.id == selectedRootFolderId)
          .firstOrNull
          ?.path;
    }

    final String? animeDir = server.server.activeAnimeDirectory;
    final String dir;
    if (isAnime && animeDir != null && animeDir.isNotEmpty) {
      dir = animeDir;
    } else {
      dir = server.server.activeDirectory;
    }

    if (dir.isNotEmpty) {
      final match = server.rootFolders.where((f) => f.path == dir).firstOrNull;
      if (match != null) return match.path;
    }

    return server.rootFolders.firstOrNull?.path;
  }

  void onServerChanged(int? value) {
    selectedServerId = value;
    selectedProfileId = null;
    selectedRootFolderId = null;
    _applyServerDefaults();
    notifyListeners();
  }

  void onProfileChanged(int? value) {
    selectedProfileId = value;
    notifyListeners();
  }

  void onRootFolderChanged(int? value) {
    selectedRootFolderId = value;
    notifyListeners();
  }
}

/// The advanced options section with server, quality profile, and root folder
/// pickers, driven by a [SeerrAdvancedRequestController]. Uses d-pad friendly
/// rows and list pickers instead of Material dropdowns so it works on TV.
class SeerrAdvancedRequestOptions extends StatefulWidget {
  final SeerrAdvancedRequestController controller;

  const SeerrAdvancedRequestOptions({super.key, required this.controller});

  @override
  State<SeerrAdvancedRequestOptions> createState() =>
      _SeerrAdvancedRequestOptionsState();
}

class _SeerrAdvancedRequestOptionsState
    extends State<SeerrAdvancedRequestOptions> {
  bool _expanded = false;

  SeerrAdvancedRequestController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final headerColor = AppColorScheme.onSurface.withValues(alpha: 0.7);
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FocusableWrapper(
            onSelect: () => setState(() => _expanded = !_expanded),
            borderRadius: 8,
            useBackgroundFocus: true,
            disableScale: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.advancedOptions,
                      style: TextStyle(color: headerColor),
                    ),
                  ),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: headerColor,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded) ...[
            const SizedBox(height: 8),
            if (controller.loading)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              )
            else if (controller.servers != null &&
                controller.servers!.isNotEmpty) ...[
              _buildPickerRow<SeerrServiceServerDetails>(
                label: l10n.server,
                items: controller.servers ?? const [],
                idOf: (s) => s.server.id,
                labelOf: _serverLabel,
                selectedId: controller.selectedServerId,
                onChanged: controller.onServerChanged,
              ),
              const SizedBox(height: 12),
              _buildPickerRow<SeerrQualityProfile>(
                label: l10n.qualityProfile,
                items: controller.activeServer?.profiles ?? const [],
                idOf: (p) => p.id,
                labelOf: (p) => p.name,
                selectedId: controller.selectedProfileId,
                onChanged: controller.onProfileChanged,
              ),
              const SizedBox(height: 12),
              _buildPickerRow<SeerrRootFolder>(
                label: l10n.rootFolder,
                items: controller.activeServer?.rootFolders ?? const [],
                idOf: (f) => f.id,
                labelOf: (f) => f.path,
                selectedId: controller.selectedRootFolderId,
                onChanged: controller.onRootFolderChanged,
              ),
            ] else
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  l10n.noServiceServersConfigured,
                  style: TextStyle(
                    color: AppColorScheme.onSurface.withValues(alpha: 0.54),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  String _serverLabel(SeerrServiceServerDetails s) =>
      '${s.server.name}${s.server.is4k ? " (4K)" : ""}';

  Widget _buildPickerRow<T>({
    required String label,
    required List<T> items,
    required int Function(T) idOf,
    required String Function(T) labelOf,
    required int? selectedId,
    required ValueChanged<int?> onChanged,
  }) {
    final resolvedId = selectedId ?? (items.isEmpty ? null : idOf(items.first));
    final selected = items.where((e) => idOf(e) == resolvedId).firstOrNull ??
        items.firstOrNull;
    return SeerrSelectorRow(
      label: label,
      value: selected == null ? '' : labelOf(selected),
      onTap: () async {
        final ids = [for (final e in items) idOf(e)];
        final current = ids.indexOf(resolvedId ?? -1);
        final picked = await showSeerrOptionPicker(
          context,
          title: label,
          labels: [for (final e in items) labelOf(e)],
          selectedIndex: current < 0 ? 0 : current,
        );
        if (picked != null) onChanged(ids[picked]);
      },
    );
  }
}
