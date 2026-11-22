import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_library.dart';
import '../../data/repositories/user_views_repository.dart';
import '../../l10n/app_localizations.dart';
import '../navigation/home_refresh_bus.dart';

/// 类似 Hills 的媒体库快速显示/隐藏管理对话框
Future<void> showLibraryQuickVisibilityDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) => const LibraryQuickVisibilityDialog(),
  );
}

class LibraryQuickVisibilityDialog extends StatefulWidget {
  const LibraryQuickVisibilityDialog({super.key});

  @override
  State<LibraryQuickVisibilityDialog> createState() =>
      _LibraryQuickVisibilityDialogState();
}

class _LibraryQuickVisibilityDialogState
    extends State<LibraryQuickVisibilityDialog> {
  final _viewsRepo = GetIt.instance<UserViewsRepository>();

  List<AggregatedLibrary>? _libraries;
  UserConfiguration? _config;
  bool _isLoading = true;
  bool _loadFailed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final results = await Future.wait([
        _viewsRepo.getAllViewsIncludingHidden(),
        _viewsRepo.getUserConfiguration(),
      ]);
      if (!mounted) return;
      setState(() {
        _libraries = results[0] as List<AggregatedLibrary>;
        _config = results[1] as UserConfiguration;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _loadFailed = true;
      });
    }
  }

  Future<void> _toggleVisibility(String libraryId) async {
    final config = _config;
    if (config == null) return;

    final myExcludes = List<String>.from(config.myMediaExcludes);
    final latestExcludes = List<String>.from(config.latestItemsExcludes);
    final isHidden = myExcludes.contains(libraryId);

    if (isHidden) {
      myExcludes.remove(libraryId);
      latestExcludes.remove(libraryId);
    } else {
      myExcludes.add(libraryId);
      if (!latestExcludes.contains(libraryId)) {
        latestExcludes.add(libraryId);
      }
    }

    final updated = config.copyWith(
      myMediaExcludes: myExcludes,
      latestItemsExcludes: latestExcludes,
    );
    setState(() => _config = updated);

    try {
      await _viewsRepo.updateUserConfiguration(updated);
      homeRefreshBus.request(newMediaBar: true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _config = config);
    }
  }

  Future<void> _restoreDefaults() async {
    final config = _config;
    if (config == null) return;

    final updated = config.copyWith(
      myMediaExcludes: const [],
      latestItemsExcludes: const [],
    );
    setState(() => _config = updated);

    try {
      await _viewsRepo.updateUserConfiguration(updated);
      homeRefreshBus.request(newMediaBar: true);
    } catch (_) {
      if (!mounted) return;
      setState(() => _config = config);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final config = _config;
    final libraries = _libraries;

    return Dialog(
      backgroundColor: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 420,
          maxHeight: 560,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 顶部标题与关闭按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '媒体库',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70, size: 20),
                    splashRadius: 18,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(color: Colors.white12, height: 1),
              const SizedBox(height: 8),

              // 列表区域
              Expanded(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white70,
                        ),
                      )
                    : _loadFailed
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  l10n.failedToLoadLibraries,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 8),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLoading = true;
                                      _loadFailed = false;
                                    });
                                    _load();
                                  },
                                  child: Text(l10n.retry),
                                ),
                              ],
                            ),
                          )
                        : (libraries == null || libraries.isEmpty)
                            ? Center(
                                child: Text(
                                  l10n.noLibrariesFound,
                                  style: const TextStyle(color: Colors.white54),
                                ),
                              )
                            : ListView.separated(
                                itemCount: libraries.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(color: Colors.white10, height: 1),
                                itemBuilder: (context, index) {
                                  final lib = libraries[index];
                                  final isVisible =
                                      config != null && !config.myMediaExcludes.contains(lib.id);

                                  return InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () => _toggleVisibility(lib.id),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          // 眼睛图标
                                          Icon(
                                            isVisible
                                                ? Icons.visibility_rounded
                                                : Icons.visibility_off_rounded,
                                            size: 20,
                                            color: isVisible
                                                ? Colors.white
                                                : Colors.white38,
                                          ),
                                          const SizedBox(width: 14),
                                          // 媒体库名称
                                          Expanded(
                                            child: Text(
                                              lib.name,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: isVisible
                                                    ? Colors.white
                                                    : Colors.white38,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          // 右侧拖动手柄 (类似 Hills 的 ≡ 图标)
                                          const Icon(
                                            Icons.reorder_rounded,
                                            size: 18,
                                            color: Colors.white24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
              ),

              const SizedBox(height: 8),
              const Divider(color: Colors.white12, height: 1),
              const SizedBox(height: 8),

              // 底部恢复默认按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (_isLoading || _loadFailed) ? null : _restoreDefaults,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                      backgroundColor: Colors.white.withValues(alpha: 0.08),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '恢复默认',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
