import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:server_core/server_core.dart';

import '../../data/models/aggregated_item.dart';
import '../../l10n/app_localizations.dart';
import '../../util/focus/key_event_utils.dart';
import '../../util/platform_detection.dart';
import '../../auth/repositories/user_repository.dart';
import '../../auth/repositories/session_repository.dart';
import 'package:dio/dio.dart';
import 'adaptive/adaptive_dialog.dart';
import 'focus/focusable_wrapper.dart';
import 'overlay_sheet.dart';

class ImageDimensions {
  final double width;
  final double height;
  const ImageDimensions(this.width, this.height);
  double get aspectRatio => width / height;
}

class ChangeArtworkDialog extends StatefulWidget {
  final AggregatedItem item;

  const ChangeArtworkDialog({super.key, required this.item});

  static Future<bool?> show(
    BuildContext context, {
    required AggregatedItem item,
  }) {
    return showFocusRestoringDialog<bool>(
      context: context,
      builder: (_) => ChangeArtworkDialog(item: item),
    );
  }

  @override
  State<ChangeArtworkDialog> createState() => _ChangeArtworkDialogState();
}

class _ChangeArtworkDialogState extends State<ChangeArtworkDialog> {
  late AggregatedItem _item;
  late List<String> _supportedCategories;
  final Map<String, List<Map<String, dynamic>>> _remoteImages = {};
  final Map<String, bool> _loadingCategories = {};
  final Map<String, String?> _categoryErrors = {};
  final Set<String> _actionInProgress = {};
  bool _hasChanged = false;

  final Set<String> _deselectedSources = {};
  bool _onlyShowInterfaceLanguage = true;
  String _selectedResolution = 'All';
  String? _focusedCategory;

  final List<AggregatedItem> _history = [];
  int _historyIndex = -1;

  final FocusNode _clearAllFocusNode = FocusNode();
  final FocusNode _sourcesFocusNode = FocusNode();
  final FocusNode _languageFocusNode = FocusNode();
  final FocusNode _historyBackFocusNode = FocusNode();
  final FocusNode _historyForwardFocusNode = FocusNode();
  final FocusNode _closeFocusNode = FocusNode();
  final FocusNode _seriesFocusNode = FocusNode();
  final FocusNode _seasonFocusNode = FocusNode();

  bool get _isLibraryFolder =>
      _item.type?.toLowerCase() == 'collectionfolder' ||
      _item.type?.toLowerCase() == 'userview' ||
      _item.type?.toLowerCase() == 'folder' ||
      _item.type?.toLowerCase() == 'genre' ||
      _item.type?.toLowerCase() == 'musicgenre';

  final Map<String, ScrollController> _scrollControllers = {};
  final Map<String, FocusNode> _headerFocusNodes = {};
  final Map<String, FocusNode> _firstCardFocusNodes = {};

  ScrollController _getScrollController(String category) {
    return _scrollControllers.putIfAbsent(category, () => ScrollController());
  }

  FocusNode _getHeaderFocusNode(String category) {
    return _headerFocusNodes.putIfAbsent(category, () => FocusNode());
  }

  FocusNode _getFirstCardFocusNode(String category) {
    return _firstCardFocusNodes.putIfAbsent(category, () => FocusNode());
  }

  void _scrollRow(String category, {required bool forward}) {
    final controller = _getScrollController(category);
    if (!controller.hasClients) return;
    final double offset = controller.offset;
    final double maxScrollExtent = controller.position.maxScrollExtent;
    const double scrollAmount = 300.0;
    final double targetOffset = forward
        ? (offset + scrollAmount).clamp(0.0, maxScrollExtent)
        : (offset - scrollAmount).clamp(0.0, maxScrollExtent);
    controller.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  void _focusFirstItem() {
    if (_supportedCategories.isNotEmpty) {
      final firstCategory = _supportedCategories[0];
      final node = _getFirstCardFocusNode(firstCategory);
      node.requestFocus();
    }
  }

  void _resetScroll(String category) {
    final controller = _getScrollController(category);
    if (controller.hasClients && controller.offset > 0) {
      controller.jumpTo(0.0);
    }
  }

  void _handleNavigateDownFromHeader(String category) {
    _resetScroll(category);
    final focusNode = _getFirstCardFocusNode(category);
    focusNode.requestFocus();
  }

  void _handleNavigateUpFromHeader(String category) {
    final index = _supportedCategories.indexOf(category);
    if (index > 0) {
      final prevCategory = _supportedCategories[index - 1];
      _resetScroll(prevCategory);
      final focusNode = _getFirstCardFocusNode(prevCategory);
      focusNode.requestFocus();
    } else {
      _getFirstFilterFocusNode().requestFocus();
    }
  }

  void _handleNavigateUpFromCard(String category) {
    if (_focusedCategory != null) return;
    final focusNode = _getHeaderFocusNode(category);
    focusNode.requestFocus();
    _resetScroll(category);
  }

  void _handleNavigateDownFromCard(String category) {
    if (_focusedCategory != null) return;
    final index = _supportedCategories.indexOf(category);
    if (index < _supportedCategories.length - 1) {
      final nextCategory = _supportedCategories[index + 1];
      final focusNode = _getHeaderFocusNode(nextCategory);
      focusNode.requestFocus();
      _resetScroll(category);
    }
  }

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    _history.add(_item);
    _historyIndex = 0;
    _supportedCategories = _getSupportedImageTypes(_item.type);
    for (final category in _supportedCategories) {
      _fetchRemoteImages(category);
    }
    _refreshItemMetadata();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusFirstItem();
      _checkLibrariesWriteAccess();
    });
  }

  @override
  void dispose() {
    _clearAllFocusNode.dispose();
    _sourcesFocusNode.dispose();
    _languageFocusNode.dispose();
    _historyBackFocusNode.dispose();
    _historyForwardFocusNode.dispose();
    _closeFocusNode.dispose();
    _seriesFocusNode.dispose();
    _seasonFocusNode.dispose();
    for (final controller in _scrollControllers.values) {
      controller.dispose();
    }
    for (final node in _headerFocusNodes.values) {
      node.dispose();
    }
    for (final node in _firstCardFocusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> _refreshItemMetadata() async {
    try {
      final client = GetIt.instance<MediaServerClient>();
      final updatedRaw = await client.itemsApi.getItem(_item.id);
      if (mounted) {
        setState(() {
          _item = AggregatedItem(
            id: _item.id,
            serverId: _item.serverId,
            rawData: updatedRaw,
          );
          if (_historyIndex >= 0 && _historyIndex < _history.length) {
            _history[_historyIndex] = _item;
          }
        });
      }
    } catch (e) {
      debugPrint('Failed to refresh item metadata: $e');
    }
  }

  Future<void> _navigateToItem(String itemId) async {
    setState(() {
      _focusedCategory = null;
    });

    try {
      final client = GetIt.instance<MediaServerClient>();
      final updatedRaw = await client.itemsApi.getItem(itemId);
      final newItem = AggregatedItem(
        id: itemId,
        serverId: _item.serverId,
        rawData: updatedRaw,
      );

      if (_historyIndex < _history.length - 1) {
        _history.removeRange(_historyIndex + 1, _history.length);
      }

      _history.add(newItem);
      _historyIndex = _history.length - 1;

      if (!mounted) return;
      _loadItem(newItem);
    } catch (e) {
      debugPrint('Failed to load item: $e');
    }
  }

  void _loadItem(AggregatedItem item) {
    setState(() {
      _item = item;
      _supportedCategories = _getSupportedImageTypes(_item.type);
      _remoteImages.clear();
      _loadingCategories.clear();
      _categoryErrors.clear();
    });

    for (final category in _supportedCategories) {
      _fetchRemoteImages(category);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusFirstItem();
    });
  }

  void _goBack() {
    if (_historyIndex > 0) {
      setState(() {
        _historyIndex--;
        _focusedCategory = null;
        _loadItem(_history[_historyIndex]);
      });
    }
  }

  void _goForward() {
    if (_historyIndex < _history.length - 1) {
      setState(() {
        _historyIndex++;
        _focusedCategory = null;
        _loadItem(_history[_historyIndex]);
      });
    }
  }

  Set<String> get _availableSources {
    final sources = <String>{};
    for (final list in _remoteImages.values) {
      for (final img in list) {
        final provider = img['ProviderName'] as String?;
        if (provider != null && provider.isNotEmpty) {
          sources.add(provider);
        }
      }
    }
    return sources;
  }

  bool _shouldShowImageByLanguage(
    Map<String, dynamic> remoteImage,
    String interfaceLang,
  ) {
    if (!_onlyShowInterfaceLanguage) return true;
    final imgLang = (remoteImage['Language'] as String?)?.toLowerCase();
    if (imgLang == null || imgLang.isEmpty) return true;
    return imgLang == interfaceLang ||
        imgLang == 'all' ||
        imgLang == 'none' ||
        imgLang == 'mul';
  }

  List<String> _getSupportedImageTypes(String? itemType) {
    final type = itemType?.toLowerCase();
    switch (type) {
      case 'movie':
        return const [
          'Primary',
          'Backdrop',
          'Banner',
          'Logo',
          'Thumb',
          'Art',
          'Disc',
        ];
      case 'series':
        return const ['Primary', 'Backdrop', 'Banner', 'Logo', 'Thumb', 'Art'];
      case 'season':
        return const ['Primary', 'Backdrop', 'Banner'];
      case 'episode':
        return const ['Primary'];
      case 'musicvideo':
        return const ['Primary', 'Backdrop', 'Banner', 'Logo', 'Thumb'];
      case 'trailer':
        return const ['Primary', 'Backdrop', 'Thumb'];
      case 'boxset':
        return const ['Primary', 'Backdrop', 'Banner', 'Logo', 'Thumb'];
      case 'playlist':
        return const ['Primary', 'Backdrop'];
      case 'musicartist':
        return const ['Primary', 'Backdrop', 'Banner', 'Logo'];
      case 'musicalbum':
        return const ['Primary', 'Backdrop', 'Disc'];
      case 'audio':
        return const ['Primary'];
      case 'book':
      case 'audiobook':
        return const ['Primary'];
      case 'folder':
      case 'collectionfolder':
      case 'userview':
      case 'genre':
      case 'musicgenre':
        return const ['Primary', 'Backdrop', 'Thumb'];
      default:
        return const ['Primary', 'Backdrop'];
    }
  }

  String _getCategoryDisplayName(String category, AppLocalizations l10n) {
    switch (category) {
      case 'Primary':
        return _item.type?.toLowerCase() == 'episode'
            ? l10n.thumbnailCategory
            : l10n.posterCategory;
      case 'Backdrop':
        return l10n.backdropsCategory;
      case 'Banner':
        return l10n.bannerCategory;
      case 'Logo':
        return l10n.logoCategory;
      case 'Thumb':
        return l10n.thumbnailCategory;
      case 'Art':
        return l10n.artCategory;
      case 'Disc':
        return l10n.discArtCategory;
      case 'Screenshot':
        return l10n.screenshotCategory;
      case 'Box':
        return l10n.boxCoverCategory;
      case 'BoxRear':
        return l10n.boxRearCoverCategory;
      case 'Menu':
        return l10n.menuArtCategory;
      default:
        return category;
    }
  }

  String _getConfirmItemName(String category, AppLocalizations l10n) {
    switch (category) {
      case 'Primary':
        return _item.type?.toLowerCase() == 'episode'
            ? l10n.confirmItemThumbnail
            : l10n.confirmItemPoster;
      case 'Backdrop':
        return l10n.confirmItemBackdrop;
      case 'Banner':
        return l10n.confirmItemBanner;
      case 'Logo':
        return l10n.confirmItemLogo;
      case 'Thumb':
        return l10n.confirmItemThumbnail;
      case 'Art':
        return l10n.confirmItemArt;
      case 'Disc':
        return l10n.confirmItemDiscArt;
      case 'Screenshot':
        return l10n.confirmItemScreenshot;
      case 'Box':
        return l10n.confirmItemBoxCover;
      case 'BoxRear':
        return l10n.confirmItemBoxRearCover;
      case 'Menu':
        return l10n.confirmItemMenuArt;
      default:
        return category.toLowerCase();
    }
  }

  String _getResolutionDisplayName(String resolution, AppLocalizations l10n) {
    switch (resolution) {
      case 'All':
        return l10n.resolutionAll;
      case 'High (1080p+)':
        return l10n.resolutionHigh;
      case 'Medium (720p)':
        return l10n.resolutionMedium;
      case 'Low (<720p)':
        return l10n.resolutionLow;
      default:
        return resolution;
    }
  }

  ImageDimensions _getImageDimensions(String category) {
    if (category == 'Primary' && _item.type?.toLowerCase() == 'episode') {
      return const ImageDimensions(
        200,
        112.5,
      ); // 16:9 for episode primary images
    }
    switch (category) {
      case 'Primary':
        return const ImageDimensions(100, 150);
      case 'Backdrop':
      case 'Thumb':
      case 'Thumbnail':
      case 'Screenshot':
        return const ImageDimensions(200, 112.5); // 16:9
      case 'Banner':
        return const ImageDimensions(240, 48); // 5:1
      case 'Logo':
      case 'Art':
        return const ImageDimensions(160, 64); // ~2.5:1
      case 'Disc':
        return const ImageDimensions(120, 120); // 1:1
      default:
        return const ImageDimensions(100, 150);
    }
  }

  List<String> _getCurrentTags(String category) {
    if (category == 'Backdrop') {
      return _item.backdropImageTags;
    }
    final tag = (_item.rawData['ImageTags'] as Map?)?[category] as String?;
    return tag != null ? [tag] : [];
  }

  String _getCurrentImageUrl(String category, String tag, {int? imageIndex}) {
    final client = GetIt.instance<MediaServerClient>();
    final indexParam = imageIndex != null ? '&imageIndex=$imageIndex' : '';
    return '${client.baseUrl}/Items/${_item.id}/Images/$category?tag=$tag&maxWidth=300$indexParam';
  }

  Future<void> _checkLibrariesWriteAccess() async {
    final isAdmin = GetIt.instance<UserRepository>().currentUser?.isAdministrator ?? false;
    if (!isAdmin) return;

    final sessionRepo = GetIt.instance<SessionRepository>();
    if (sessionRepo.hasCheckedWriteAccess) return;

    final client = GetIt.instance<MediaServerClient>();
    final token = client.accessToken;
    if (token == null) return;

    final dio = Dio();
    configureServerDio(dio);
    try {
      final response = await dio.get(
        '${client.baseUrl}/Moonfin/Libraries/CheckWriteAccess',
        options: Options(headers: {
          'Authorization': 'MediaBrowser Token="$token"',
        }),
      );
      sessionRepo.hasCheckedWriteAccess = true;

      final data = response.data;
      if (data is List) {
        final reports = data.cast<Map<String, dynamic>>();
        final itemPath = _item.rawData['Path'] as String?;
        if (itemPath != null && itemPath.isNotEmpty) {
          Map<String, dynamic>? matchingFailedReport;
          String? matchingFailedPath;

          for (final report in reports) {
            final failedPaths = report['FailedPaths'] as List?;
            if (failedPaths != null) {
              for (final path in failedPaths) {
                if (path is String && itemPath.startsWith(path)) {
                  matchingFailedReport = report;
                  matchingFailedPath = path;
                  break;
                }
              }
            }
            if (matchingFailedReport != null) break;
          }

          if (matchingFailedReport != null && mounted) {
            final libraryName = matchingFailedReport['LibraryName'] ?? 'Library';
            final l10n = AppLocalizations.of(context);
            await _showWriteAccessWarningDialog(
              l10n.libraryWriteAccessProactiveBody(libraryName.toString(), matchingFailedPath ?? ''),
            );
          }
        }
      }
    } catch (e) {
      debugPrint('[Moonfin] Failed to check libraries write access: $e');
    } finally {
      dio.close(force: true);
    }
  }

  Future<void> _handleActionError(dynamic error, String actionName) async {
    bool isLocalMetadataEnabled = false;
    try {
      final client = GetIt.instance<MediaServerClient>();
      final folders = await client.adminLibraryApi.getVirtualFolders();
      final itemPath = _item.rawData['Path'] as String?;
      if (itemPath != null && itemPath.isNotEmpty) {
        for (final folder in folders) {
          if (folder.locations.any((loc) => itemPath.startsWith(loc))) {
            isLocalMetadataEnabled =
                folder.libraryOptions?['SaveLocalMetadata'] as bool? ?? false;
            break;
          }
        }
      }
    } catch (e) {
      debugPrint('Failed to check virtual folders: $e');
    }

    if (!mounted) return;

    if (isLocalMetadataEnabled) {
      final l10n = AppLocalizations.of(context);
      await _showWriteAccessWarningDialog(l10n.libraryWriteAccessReactiveBody);
    } else {
      final l10n = AppLocalizations.of(context);
      final message = switch (actionName) {
        'download' => l10n.imageDownloadFailed(error.toString()),
        'delete' => l10n.imageDeleteFailed(error.toString()),
        'clear' => l10n.clearAllArtworkFailed(error.toString()),
        'upload' => l10n.imageUploadFailed(error.toString()),
        _ => error.toString(),
      };
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> _showWriteAccessWarningDialog(String bodyText) async {
    final l10n = AppLocalizations.of(context);
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColorScheme.surface,
        title: Text(l10n.libraryWriteAccessWarningTitle),
        content: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bodyText),
                const SizedBox(height: 12),
                Text(
                  l10n.libraryWriteAccessHowToFix,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(l10n.libraryWriteAccessFixSteps),
              ],
            ),
          ),
        ),
        actions: [
          FocusableWrapper(
            autofocus: true,
            borderRadius: 8,
            suppressFocusGlow: true,
            onSelect: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                l10n.dismiss,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchRemoteImages(String category) async {
    if (!mounted) return;
    final isGenre = _item.type?.toLowerCase() == 'genre' ||
        _item.type?.toLowerCase() == 'musicgenre';
    if (isGenre) {
      setState(() {
        _remoteImages[category] = const [];
        _loadingCategories[category] = false;
      });
      return;
    }
    setState(() {
      _loadingCategories[category] = true;
      _categoryErrors[category] = null;
    });

    try {
      final client = GetIt.instance<MediaServerClient>();
      final result = await client.adminItemsApi.getRemoteImages(
        _item.id,
        imageType: ImageType.fromServerString(category),
        includeAllLanguages: true,
      );
      final list = result['Images'] as List? ?? [];
      if (mounted) {
        setState(() {
          _remoteImages[category] = list.cast<Map<String, dynamic>>();
          _loadingCategories[category] = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _categoryErrors[category] = e.toString();
          _loadingCategories[category] = false;
        });
      }
    }
  }

  Future<void> _downloadImage(
    String category,
    Map<String, dynamic> remoteImage,
  ) async {
    final url = remoteImage['Url'] as String?;
    if (url == null || url.isEmpty) return;

    setState(() {
      _actionInProgress.add(category);
    });

    try {
      final client = GetIt.instance<MediaServerClient>();
      await client.adminItemsApi.downloadRemoteImage(
        _item.id,
        imageType: ImageType.fromServerString(category),
        imageUrl: url,
      );

      final updatedRaw = await client.itemsApi.getItem(_item.id);
      if (mounted) {
        setState(() {
          _item = AggregatedItem(
            id: _item.id,
            serverId: _item.serverId,
            rawData: updatedRaw,
          );
          if (_historyIndex >= 0 && _historyIndex < _history.length) {
            _history[_historyIndex] = _item;
          }
          _hasChanged = true;
          _actionInProgress.remove(category);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _actionInProgress.remove(category);
        });
        await _handleActionError(e, 'download');
      }
    }
  }

  Future<bool> _showConfirmClear(String category) async {
    final l10n = AppLocalizations.of(context);
    final cleanDisplayName = _getConfirmItemName(category, l10n);
    final message = l10n.confirmClearMessage(cleanDisplayName);

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        backgroundColor: AppColorScheme.surface,
        title: Text(l10n.confirmClear),
        content: Text(message),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.no),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              l10n.yes,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Future<void> _deleteImage(String category, {int? imageIndex}) async {
    final confirm = await _showConfirmClear(category);
    if (!confirm) return;

    setState(() {
      _actionInProgress.add(category);
    });

    try {
      final client = GetIt.instance<MediaServerClient>();
      await client.adminItemsApi.deleteItemImage(
        _item.id,
        imageType: ImageType.fromServerString(category),
        imageIndex: imageIndex,
      );

      final updatedRaw = await client.itemsApi.getItem(_item.id);
      if (mounted) {
        setState(() {
          _item = AggregatedItem(
            id: _item.id,
            serverId: _item.serverId,
            rawData: updatedRaw,
          );
          if (_historyIndex >= 0 && _historyIndex < _history.length) {
            _history[_historyIndex] = _item;
          }
          _hasChanged = true;
          _actionInProgress.remove(category);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _actionInProgress.remove(category);
        });
        await _handleActionError(e, 'delete');
      }
    }
  }

  Future<void> _clearAllArtwork() async {
    final l10n = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        backgroundColor: AppColorScheme.surface,
        title: Text(l10n.confirmClearAll),
        content: Text(l10n.clearAllArtworkWarning),
        actions: [
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.no),
          ),
          adaptiveDialogAction(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              l10n.yes,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() {
      _actionInProgress.addAll(_supportedCategories);
    });

    try {
      final client = GetIt.instance<MediaServerClient>();
      for (final category in _supportedCategories) {
        final tags = _getCurrentTags(category);
        if (tags.isEmpty) continue;

        if (category == 'Backdrop') {
          for (int i = tags.length - 1; i >= 0; i--) {
            await client.adminItemsApi.deleteItemImage(
              _item.id,
              imageType: ImageType.backdrop,
              imageIndex: i,
            );
          }
        } else {
          await client.adminItemsApi.deleteItemImage(
            _item.id,
            imageType: ImageType.fromServerString(category),
            imageIndex: null,
          );
        }
      }

      final updatedRaw = await client.itemsApi.getItem(_item.id);
      if (mounted) {
        setState(() {
          _item = AggregatedItem(
            id: _item.id,
            serverId: _item.serverId,
            rawData: updatedRaw,
          );
          if (_historyIndex >= 0 && _historyIndex < _history.length) {
            _history[_historyIndex] = _item;
          }
          _hasChanged = true;
          _actionInProgress.clear();
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _actionInProgress.clear();
        });
        await _handleActionError(e, 'clear');
      }
    }
  }

  Future<void> _uploadLocalImage(String category) async {
    final l10n = AppLocalizations.of(context);
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.image,
        withData: true,
      );

      if (result == null || result.files.isEmpty) return;

      final file = result.files.first;
      var fileBytes = file.bytes;

      if (fileBytes == null && file.path != null) {
        fileBytes = await File(file.path!).readAsBytes();
      }

      if (fileBytes == null) {
        throw 'Could not read file bytes';
      }

      setState(() {
        _actionInProgress.add(category);
      });

      final extension = file.extension?.toLowerCase() ?? 'jpg';
      final mimeType = extension == 'png'
          ? 'image/png'
          : (extension == 'webp' ? 'image/webp' : 'image/jpeg');

      final client = GetIt.instance<MediaServerClient>();
      await client.adminItemsApi.uploadItemImage(
        _item.id,
        imageType: ImageType.fromServerString(category),
        bytes: fileBytes,
        contentType: mimeType,
      );

      if (mounted) {
        _fetchRemoteImages(category);
        setState(() {
          _hasChanged = true;
          _actionInProgress.remove(category);
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.imageUploadSuccess)));
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _actionInProgress.remove(category);
        });
        await _handleActionError(e, 'upload');
      }
    }
  }

  Widget _buildPathTitle(ThemeData theme) {
    final seriesName = _item.rawData['SeriesName'] as String?;
    final seriesId = _item.rawData['SeriesId']?.toString();
    final seasonName = _item.rawData['SeasonName'] as String?;
    final seasonId = _item.rawData['SeasonId']?.toString();

    final textStyle = theme.textTheme.bodyMedium?.copyWith(
      color: AppColorScheme.onSurface.withValues(alpha: 0.6),
    );

    final linkStyle = theme.textTheme.bodyMedium?.copyWith(
      color: AppColorScheme.accent,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    );

    final parts = <Widget>[];

    if (_item.type?.toLowerCase() == 'episode') {
      final hasSeries = seriesName != null && seriesName.isNotEmpty;
      final hasSeason = seasonName != null && seasonName.isNotEmpty;

      if (hasSeries) {
        parts.add(
          _buildLink(
            seriesName,
            seriesId,
            linkStyle,
            textStyle,
            focusNode: _seriesFocusNode,
            onNavigateDown: () => _getFirstFilterFocusNode().requestFocus(),
            onNavigateRight: () {
              if (hasSeason) {
                _seasonFocusNode.requestFocus();
              } else {
                _historyBackFocusNode.requestFocus();
              }
            },
            onNavigateUp: () => _historyBackFocusNode.requestFocus(),
            onNavigateLeft: () {},
          ),
        );
        parts.add(Text(' \\ ', style: textStyle));
      }
      if (hasSeason) {
        parts.add(
          _buildLink(
            seasonName,
            seasonId,
            linkStyle,
            textStyle,
            focusNode: _seasonFocusNode,
            onNavigateDown: () => _getFirstFilterFocusNode().requestFocus(),
            onNavigateLeft: () {
              if (hasSeries) {
                _seriesFocusNode.requestFocus();
              }
            },
            onNavigateRight: () => _historyBackFocusNode.requestFocus(),
            onNavigateUp: () => _historyBackFocusNode.requestFocus(),
          ),
        );
        parts.add(Text(' \\ ', style: textStyle));
      }
      parts.add(
        Text(
          _item.name,
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else if (_item.type?.toLowerCase() == 'season') {
      final hasSeries = seriesName != null && seriesName.isNotEmpty;

      if (hasSeries) {
        parts.add(
          _buildLink(
            seriesName,
            seriesId,
            linkStyle,
            textStyle,
            focusNode: _seriesFocusNode,
            onNavigateDown: () => _getFirstFilterFocusNode().requestFocus(),
            onNavigateRight: () => _historyBackFocusNode.requestFocus(),
            onNavigateUp: () => _historyBackFocusNode.requestFocus(),
            onNavigateLeft: () {},
          ),
        );
        parts.add(Text(' \\ ', style: textStyle));
      }
      parts.add(
        Text(
          _item.name,
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      parts.add(
        Text(
          _item.name,
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: parts);
  }

  Widget _buildLink(
    String label,
    String? targetId,
    TextStyle? activeStyle,
    TextStyle? inactiveStyle, {
    FocusNode? focusNode,
    VoidCallback? onNavigateLeft,
    VoidCallback? onNavigateRight,
    VoidCallback? onNavigateUp,
    VoidCallback? onNavigateDown,
  }) {
    if (targetId == null || targetId.isEmpty) {
      return Text(label, style: inactiveStyle);
    }
    return FocusableWrapper(
      focusNode: focusNode,
      borderRadius: 4,
      disableScale: true,
      useBackgroundFocus: true,
      focusColor: AppColorScheme.accent,
      suppressFocusGlow: true,
      onSelect: () => _navigateToItem(targetId),
      onNavigateLeft: onNavigateLeft,
      onNavigateRight: onNavigateRight,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: Text(label, style: activeStyle),
      ),
    );
  }

  FocusNode _getFirstFilterFocusNode() {
    final sources = _availableSources;
    if (sources.isNotEmpty) {
      return _sourcesFocusNode;
    }
    if (!_isLibraryFolder) {
      return _languageFocusNode;
    }
    return _clearAllFocusNode;
  }

  void _handleNavigateUpFromFilters() {
    final seriesName = _item.rawData['SeriesName'] as String?;
    final seasonName = _item.rawData['SeasonName'] as String?;
    if (_item.type?.toLowerCase() == 'episode') {
      if (seriesName != null && seriesName.isNotEmpty) {
        _seriesFocusNode.requestFocus();
      } else if (seasonName != null && seasonName.isNotEmpty) {
        _seasonFocusNode.requestFocus();
      } else {
        _historyBackFocusNode.requestFocus();
      }
    } else if (_item.type?.toLowerCase() == 'season') {
      if (seriesName != null && seriesName.isNotEmpty) {
        _seriesFocusNode.requestFocus();
      } else {
        _historyBackFocusNode.requestFocus();
      }
    } else {
      _historyBackFocusNode.requestFocus();
    }
  }

  void _handleNavigateDownFromFilters() {
    if (_supportedCategories.isNotEmpty) {
      _getHeaderFocusNode(_supportedCategories[0]).requestFocus();
    }
  }

  void _showSourcesDialog() {
    final l10n = AppLocalizations.of(context);
    final sources = _availableSources.toList()..sort();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog.adaptive(
              backgroundColor: AppColorScheme.surface,
              title: Text(l10n.sources),
              content: SizedBox(
                width: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sources.length,
                  itemBuilder: (context, index) {
                    final src = sources[index];
                    final isSelected = !_deselectedSources.contains(src);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: FocusableWrapper(
                        borderRadius: 8,
                        autofocus: index == 0,
                        suppressFocusGlow: true,
                        onSelect: () {
                          setState(() {
                            if (isSelected) {
                              _deselectedSources.add(src);
                            } else {
                              _deselectedSources.remove(src);
                            }
                          });
                          setDialogState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              IgnorePointer(
                                child: Checkbox(
                                  value: isSelected,
                                  onChanged: (val) {},
                                  activeColor: AppColorScheme.accent,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  src,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                FocusableWrapper(
                  borderRadius: 8,
                  suppressFocusGlow: true,
                  onSelect: () => Navigator.pop(dialogContext),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      l10n.cancel,
                      style: TextStyle(
                        color: AppColorScheme.accent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints(
          minWidth: PlatformDetection.isTV ? 450 : 280,
          maxWidth: PlatformDetection.isTV
              ? (MediaQuery.of(context).size.width * 0.95).clamp(800.0, 1100.0)
              : (MediaQuery.of(context).size.width * 0.95).clamp(280.0, 850.0),
          maxHeight: PlatformDetection.isTV
              ? (MediaQuery.of(context).size.height * 0.85).clamp(550.0, 850.0)
              : (MediaQuery.of(context).size.height * 0.9).clamp(320.0, 650.0),
        ),
        decoration: BoxDecoration(
          color: AppColorScheme.surface.withValues(alpha: 0.95),
          borderRadius: AppRadius.circular(24),
          border: Border.fromBorderSide(
            ThemeRegistry.active.borders.chipBorder,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: PlatformDetection.isTV ? 24 : 16,
          horizontal: PlatformDetection.isTV ? 24 : 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.changeArtwork,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildPathTitle(theme),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FocusableWrapper(
                      focusNode: _historyBackFocusNode,
                      disableScale: true,
                      borderRadius: 8,
                      suppressFocusGlow: true,
                      onSelect: _historyIndex > 0 ? _goBack : null,
                      onNavigateDown: () =>
                          _getFirstFilterFocusNode().requestFocus(),
                      onNavigateLeft: () {
                        final seriesName =
                            _item.rawData['SeriesName'] as String?;
                        final seasonName =
                            _item.rawData['SeasonName'] as String?;
                        if (_item.type?.toLowerCase() == 'episode') {
                          if (seasonName != null && seasonName.isNotEmpty) {
                            _seasonFocusNode.requestFocus();
                          } else if (seriesName != null &&
                              seriesName.isNotEmpty) {
                            _seriesFocusNode.requestFocus();
                          }
                        } else if (_item.type?.toLowerCase() == 'season') {
                          if (seriesName != null && seriesName.isNotEmpty) {
                            _seriesFocusNode.requestFocus();
                          }
                        }
                      },
                      onNavigateRight: () =>
                          _historyForwardFocusNode.requestFocus(),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.chevron_left,
                          color: _historyIndex > 0
                              ? Colors.white
                              : Colors.white24,
                        ),
                      ),
                    ),
                    FocusableWrapper(
                      focusNode: _historyForwardFocusNode,
                      disableScale: true,
                      borderRadius: 8,
                      suppressFocusGlow: true,
                      onSelect: _historyIndex < _history.length - 1
                          ? _goForward
                          : null,
                      onNavigateDown: () =>
                          _getFirstFilterFocusNode().requestFocus(),
                      onNavigateLeft: () =>
                          _historyBackFocusNode.requestFocus(),
                      onNavigateRight: () => _closeFocusNode.requestFocus(),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.chevron_right,
                          color: _historyIndex < _history.length - 1
                              ? Colors.white
                              : Colors.white24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FocusableWrapper(
                      focusNode: _closeFocusNode,
                      disableScale: true,
                      borderRadius: 8,
                      suppressFocusGlow: true,
                      onSelect: () => Navigator.pop(context, _hasChanged),
                      onNavigateDown: () =>
                          _getFirstFilterFocusNode().requestFocus(),
                      onNavigateLeft: () =>
                          _historyForwardFocusNode.requestFocus(),
                      onNavigateRight:
                          () {}, // Block focus leaving to the right
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildFilters(),
            const SizedBox(height: 16),
            const Divider(height: 1, thickness: 1, color: Colors.white10),
            const SizedBox(height: 8),
            Expanded(
              child: _focusedCategory == null
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _supportedCategories
                            .map((category) => _buildCategorySection(category))
                            .toList(),
                      ),
                    )
                  : _buildCategoryGridView(_focusedCategory!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourcesFilterButton(Set<String> sources) {
    return FocusableWrapper(
      focusNode: _sourcesFocusNode,
      onSelect: _showSourcesDialog,
      borderRadius: 8,
      suppressFocusGlow: true,
      onNavigateLeft: () {}, // Block focus leaving to the left
      onNavigateRight: () {
        if (!_isLibraryFolder) {
          _languageFocusNode.requestFocus();
        } else {
          _clearAllFocusNode.requestFocus();
        }
      },
      onNavigateUp: _handleNavigateUpFromFilters,
      onNavigateDown: _handleNavigateDownFromFilters,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.filter_list, color: Colors.white, size: 18),
            const SizedBox(width: 6),
            const Text(
              'Sources',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageFilterCheckbox(
    AppLocalizations l10n,
    Set<String> sources,
  ) {
    return FocusableWrapper(
      focusNode: _languageFocusNode,
      onSelect: () {
        setState(() {
          _onlyShowInterfaceLanguage = !_onlyShowInterfaceLanguage;
        });
      },
      borderRadius: 8,
      suppressFocusGlow: true,
      onNavigateLeft: () {
        if (sources.isNotEmpty) {
          _sourcesFocusNode.requestFocus();
        }
      },
      onNavigateRight: () => _clearAllFocusNode.requestFocus(),
      onNavigateUp: _handleNavigateUpFromFilters,
      onNavigateDown: _handleNavigateDownFromFilters,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IgnorePointer(
              child: Checkbox(
                value: _onlyShowInterfaceLanguage,
                onChanged: (val) {},
                activeColor: AppColorScheme.accent,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              l10n.onlyShowInterfaceLanguage,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClearAllArtworkButton(
    AppLocalizations l10n,
    Set<String> sources,
  ) {
    return FocusableWrapper(
      key: const ValueKey('clear_all_artwork_button'),
      focusNode: _clearAllFocusNode,
      onSelect: _clearAllArtwork,
      borderRadius: 8,
      suppressFocusGlow: true,
      onNavigateLeft: () {
        if (!_isLibraryFolder) {
          _languageFocusNode.requestFocus();
        } else if (sources.isNotEmpty) {
          _sourcesFocusNode.requestFocus();
        }
      },
      onNavigateRight: () {}, // Block focus leaving to the right
      onNavigateUp: _handleNavigateUpFromFilters,
      onNavigateDown: _handleNavigateDownFromFilters,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.delete_outline, color: Colors.redAccent, size: 18),
            const SizedBox(width: 6),
            Text(
              l10n.clearAllArtworkButton,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    final l10n = AppLocalizations.of(context);
    final sources = _availableSources;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isPortraitMobile =
        screenWidth < 600 ||
        MediaQuery.of(context).orientation == Orientation.portrait;

    if (isPortraitMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (sources.isNotEmpty) ...[
            _buildSourcesFilterButton(sources),
            const SizedBox(height: 8),
          ],
          if (!_isLibraryFolder) ...[
            _buildLanguageFilterCheckbox(l10n, sources),
            const SizedBox(height: 8),
          ],
          _buildClearAllArtworkButton(l10n, sources),
        ],
      );
    }

    return Wrap(
      spacing: 16,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (sources.isNotEmpty) _buildSourcesFilterButton(sources),
        if (!_isLibraryFolder) _buildLanguageFilterCheckbox(l10n, sources),
        _buildClearAllArtworkButton(l10n, sources),
      ],
    );
  }

  Widget _buildCategoryGridView(String category) {
    final l10n = AppLocalizations.of(context);
    final currentTags = _getCurrentTags(category);
    final isCategoryLoading = _loadingCategories[category] ?? false;
    final isActionLoading = _actionInProgress.contains(category);
    final remoteList = _remoteImages[category] ?? [];
    final error = _categoryErrors[category];
    final dims = _getImageDimensions(category);
    final interfaceLang = Localizations.localeOf(
      context,
    ).languageCode.toLowerCase();

    final filteredRemoteList = remoteList.where((img) {
      if (!_shouldShowImageByLanguage(img, interfaceLang)) {
        return false;
      }
      final provider = img['ProviderName'] as String? ?? '';
      if (provider.isNotEmpty && _deselectedSources.contains(provider)) {
        return false;
      }
      final width = img['Width'] as int? ?? 0;
      final height = img['Height'] as int? ?? 0;
      if (_selectedResolution == 'High (1080p+)') {
        if (width < 1920 && height < 1080) return false;
      } else if (_selectedResolution == 'Medium (720p)') {
        if (width >= 1920 || height >= 1080) return false;
        if (width < 1280 && height < 720) return false;
      } else if (_selectedResolution == 'Low (<720p)') {
        if (width >= 1280 || height >= 720) return false;
      }
      return true;
    }).toList();

    final currentCount = currentTags.isEmpty ? 1 : currentTags.length;
    final totalCount =
        currentCount +
        (isCategoryLoading
            ? 1
            : (error != null ? 0 : filteredRemoteList.length));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                final categoryToFocus = _focusedCategory;
                setState(() {
                  _focusedCategory = null;
                });
                if (categoryToFocus != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _getHeaderFocusNode(categoryToFocus).requestFocus();
                  });
                }
              },
            ),
            const SizedBox(width: 8),
            Text(
              _getCategoryDisplayName(category, l10n),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            if (!PlatformDetection.isTV) ...[
              FocusableWrapper(
                onSelect: () => _uploadLocalImage(category),
                borderRadius: 8,
                onNavigateRight: () {}, // Block focus leaving to the right
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.upload_file,
                        color: AppColorScheme.accent,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        l10n.uploadButton,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColorScheme.accent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
            if (isActionLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
          ],
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 8),
              Text(
                l10n.resolutionLabel,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(width: 8),
              ...['All', 'High (1080p+)', 'Medium (720p)', 'Low (<720p)'].map((
                res,
              ) {
                final selected = _selectedResolution == res;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(_getResolutionDisplayName(res, l10n)),
                    selected: selected,
                    onSelected: (val) {
                      if (val) {
                        setState(() {
                          _selectedResolution = res;
                        });
                      }
                    },
                    selectedColor: AppColorScheme.onSurface.withValues(
                      alpha: 0.2,
                    ),
                    backgroundColor: AppColorScheme.onSurface.withValues(
                      alpha: 0.06,
                    ),
                    labelStyle: TextStyle(
                      color: selected
                          ? AppColorScheme.onSurface
                          : AppColorScheme.onSurface.withValues(alpha: 0.5),
                      fontSize: 12,
                    ),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.circular(16),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: dims.width * 1.3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: dims.width / (dims.height + 40),
            ),
            itemCount: totalCount,
            itemBuilder: (context, i) {
              if (i < currentCount) {
                if (currentTags.isEmpty) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: _buildCurrentCard(category, null, dims),
                  );
                }
                return Align(
                  alignment: Alignment.topCenter,
                  child: _buildCurrentCard(
                    category,
                    currentTags[i],
                    dims,
                    imageIndex: category == 'Backdrop' ? i : null,
                  ),
                );
              }

              if (isCategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              }

              final remoteIdx = i - currentCount;
              final remoteImage = filteredRemoteList[remoteIdx];
              return Align(
                alignment: Alignment.topCenter,
                child: _buildRemoteCard(
                  category,
                  remoteImage,
                  dims,
                  isActionLoading,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection(String category) {
    final l10n = AppLocalizations.of(context);
    final currentTags = _getCurrentTags(category);
    final isCategoryLoading = _loadingCategories[category] ?? false;
    final isActionLoading = _actionInProgress.contains(category);
    final remoteList = _remoteImages[category] ?? [];
    final error = _categoryErrors[category];
    final dims = _getImageDimensions(category);
    final interfaceLang = Localizations.localeOf(
      context,
    ).languageCode.toLowerCase();

    final filteredRemoteList = remoteList.where((img) {
      if (!_shouldShowImageByLanguage(img, interfaceLang)) {
        return false;
      }
      final provider = img['ProviderName'] as String? ?? '';
      if (provider.isNotEmpty && _deselectedSources.contains(provider)) {
        return false;
      }
      return true;
    }).toList();

    final currentCount = currentTags.isEmpty ? 1 : currentTags.length;
    final totalCount =
        currentCount +
        (isCategoryLoading
            ? 1
            : (error != null ? 0 : filteredRemoteList.length));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FocusableWrapper(
                    focusNode: _getHeaderFocusNode(category),
                    autoScroll: PlatformDetection.isTV,
                    scrollAlignment: PlatformDetection.isTV ? 0.15 : 0.5,
                    suppressFocusGlow: true,
                    onNavigateUp: () => _handleNavigateUpFromHeader(category),
                    onNavigateDown: () =>
                        _handleNavigateDownFromHeader(category),
                    onNavigateLeft: () {}, // Block focus leaving to the left
                    onSelect: () {
                      setState(() {
                        _focusedCategory = category;
                        _selectedResolution = 'All';
                      });
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _getFirstCardFocusNode(category).requestFocus();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _getCategoryDisplayName(category, l10n),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.chevron_right,
                            size: 18,
                            color: Colors.white54,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (isActionLoading)
                    const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!PlatformDetection.isTV) ...[
                    FocusableWrapper(
                      onSelect: () => _uploadLocalImage(category),
                      autoScroll: PlatformDetection.isTV,
                      scrollAlignment: PlatformDetection.isTV ? 0.15 : 0.5,
                      suppressFocusGlow: true,
                      borderRadius: 8,
                      onNavigateUp: () => _handleNavigateUpFromHeader(category),
                      onNavigateDown: () =>
                          _handleNavigateDownFromHeader(category),
                      onNavigateLeft: () =>
                          _getHeaderFocusNode(category).requestFocus(),
                      onNavigateRight:
                          () {}, // Block focus leaving to the right
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.upload_file,
                              color: AppColorScheme.accent,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              l10n.uploadButton,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColorScheme.accent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  if (PlatformDetection.isDesktop) ...[
                    ExcludeFocus(
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () => _scrollRow(category, forward: false),
                        color: AppColorScheme.accent,
                        iconSize: 22,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ExcludeFocus(
                      child: IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () => _scrollRow(category, forward: true),
                        color: AppColorScheme.accent,
                        iconSize: 22,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: dims.height + 72,
          child: ListView.builder(
            controller: _getScrollController(category),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 8,
              right: 32,
              top: 8,
              bottom: 8,
            ),
            clipBehavior: Clip.hardEdge,
            itemCount: totalCount,
            itemBuilder: (context, i) {
              final isFirst = (i == 0);
              final isLast = (i == totalCount - 1);
              final cardNode = isFirst
                  ? _getFirstCardFocusNode(category)
                  : null;
              KeyEventResult keyHandler(FocusNode node, KeyEvent event) =>
                  consumeIfEdge(
                    event,
                    atLeftEdge: isFirst,
                    atRightEdge: isLast,
                  );
              final alignmentPolicy = isFirst
                  ? ScrollPositionAlignmentPolicy.keepVisibleAtStart
                  : ScrollPositionAlignmentPolicy.explicit;

              if (i < currentCount) {
                if (currentTags.isEmpty) {
                  return _buildCurrentCard(
                    category,
                    null,
                    dims,
                    focusNode: cardNode,
                    onKeyEvent: keyHandler,
                    scrollAlignment: isFirst ? 0.0 : 0.5,
                    alignmentPolicy: alignmentPolicy,
                  );
                }
                return _buildCurrentCard(
                  category,
                  currentTags[i],
                  dims,
                  imageIndex: category == 'Backdrop' ? i : null,
                  focusNode: cardNode,
                  onKeyEvent: keyHandler,
                  scrollAlignment: isFirst ? 0.0 : 0.5,
                  alignmentPolicy: alignmentPolicy,
                );
              }

              if (isCategoryLoading) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CircularProgressIndicator(
                      color: AppColorScheme.accent,
                      strokeWidth: 2,
                    ),
                  ),
                );
              }

              final remoteIdx = i - currentCount;
              final remoteImage = filteredRemoteList[remoteIdx];
              return _buildRemoteCard(
                category,
                remoteImage,
                dims,
                isActionLoading,
                onKeyEvent: keyHandler,
                scrollAlignment: isFirst ? 0.0 : 0.5,
                alignmentPolicy: alignmentPolicy,
              );
            },
          ),
        ),
        const Divider(height: 24, thickness: 1, color: Colors.white10),
      ],
    );
  }

  Widget _buildCardWrapper({
    required String category,
    required ImageDimensions dims,
    required Widget child,
    required VoidCallback? onSelect,
    FocusNode? focusNode,
    FocusOnKeyEventCallback? onKeyEvent,
    double scrollAlignment = 0.5,
    ScrollPositionAlignmentPolicy alignmentPolicy =
        ScrollPositionAlignmentPolicy.explicit,
  }) {
    final isGridView = _focusedCategory != null;

    return AspectRatio(
      aspectRatio: dims.aspectRatio,
      child: FocusableWrapper(
        borderRadius: 8,
        autoScroll: PlatformDetection.isTV,
        suppressFocusGlow: true,
        focusNode: focusNode,
        onKeyEvent: onKeyEvent,
        scrollAlignment: PlatformDetection.isTV ? 0.15 : scrollAlignment,
        alignmentPolicy: alignmentPolicy,
        onNavigateUp: isGridView
            ? null
            : () => _handleNavigateUpFromCard(category),
        onNavigateDown: isGridView
            ? null
            : () => _handleNavigateDownFromCard(category),
        onSelect: onSelect,
        child: child,
      ),
    );
  }

  Widget _buildCurrentCard(
    String category,
    String? tag,
    ImageDimensions dims, {
    int? imageIndex,
    FocusNode? focusNode,
    FocusOnKeyEventCallback? onKeyEvent,
    double scrollAlignment = 0.5,
    ScrollPositionAlignmentPolicy alignmentPolicy =
        ScrollPositionAlignmentPolicy.explicit,
  }) {
    final l10n = AppLocalizations.of(context);
    final isGridView = _focusedCategory != null;
    final double? cardWidth = isGridView ? null : dims.width;
    final isActionLoading = _actionInProgress.contains(category);

    Widget childWidget;
    VoidCallback? selectCallback;

    if (tag == null) {
      selectCallback = null;
      childWidget = Container(
        decoration: BoxDecoration(
          borderRadius: AppRadius.circular(8),
          border: Border.all(
            color: Colors.white24,
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.image_not_supported,
              color: Colors.white30,
              size: 28,
            ),
            const SizedBox(height: 6),
            Text(
              l10n.missing,
              style: const TextStyle(fontSize: 12, color: Colors.white30),
            ),
          ],
        ),
      );
    } else {
      final imageUrl = _getCurrentImageUrl(
        category,
        tag,
        imageIndex: imageIndex,
      );
      selectCallback = isActionLoading
          ? null
          : () => _deleteImage(category, imageIndex: imageIndex);
      childWidget = ClipRRect(
        borderRadius: AppRadius.circular(8),
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                memCacheWidth:
                    (dims.width * MediaQuery.devicePixelRatioOf(context))
                        .round(),
                placeholder: (context, url) => Container(
                  color: Colors.white12,
                  child: const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.white12,
                  child: const Icon(Icons.broken_image, color: Colors.white24),
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 14),
              ),
            ),
            Positioned(
              top: 4,
              left: 4,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: selectCallback,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    final cardWidget = _buildCardWrapper(
      category: category,
      dims: dims,
      child: childWidget,
      onSelect: selectCallback,
      focusNode: focusNode,
      onKeyEvent: onKeyEvent,
      scrollAlignment: scrollAlignment,
      alignmentPolicy: alignmentPolicy,
    );

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [cardWidget],
      ),
    );
  }

  String _getOptimizedRemoteImageUrl(
    String url,
    String category, {
    int? targetWidth,
  }) {
    if (url.isEmpty) return url;

    // 1. TMDB Optimization
    if (url.contains('image.tmdb.org/t/p/original/')) {
      if (targetWidth != null) {
        if (category == 'Backdrop' ||
            category == 'Thumb' ||
            category == 'Screenshot') {
          if (targetWidth <= 780) {
            return url.replaceAll('/original/', '/w780/');
          } else {
            return url.replaceAll('/original/', '/w1280/');
          }
        } else if (category == 'Primary') {
          if (targetWidth <= 342) {
            return url.replaceAll('/original/', '/w342/');
          } else if (targetWidth <= 500) {
            return url.replaceAll('/original/', '/w500/');
          } else {
            return url.replaceAll('/original/', '/w780/');
          }
        } else if (category == 'Logo' || category == 'Art') {
          if (targetWidth <= 300) {
            return url.replaceAll('/original/', '/w300/');
          } else {
            return url.replaceAll('/original/', '/w500/');
          }
        }
      } else {
        if (category == 'Backdrop' ||
            category == 'Thumb' ||
            category == 'Screenshot') {
          return url.replaceAll('/original/', '/w780/');
        } else if (category == 'Primary') {
          return url.replaceAll('/original/', '/w342/');
        } else if (category == 'Logo' || category == 'Art') {
          return url.replaceAll('/original/', '/w300/');
        }
      }
    }

    // 2. Jellyfin/Emby server proxy optimization
    final client = GetIt.instance<MediaServerClient>();
    final isJellyfinUrl = url.startsWith('/') || url.startsWith(client.baseUrl);
    if (isJellyfinUrl) {
      final separator = url.contains('?') ? '&' : '?';
      final int width =
          targetWidth ??
          ((category == 'Backdrop' ||
                  category == 'Thumb' ||
                  category == 'Screenshot')
              ? 780
              : 342);
      if (!url.contains('maxWidth=') && !url.contains('width=')) {
        return '$url${separator}maxWidth=$width&quality=80';
      }
    }

    return url;
  }

  void _showZoomPreviewDialog(
    String category,
    Map<String, dynamic> remoteImage,
    ImageDimensions dims,
  ) {
    final l10n = AppLocalizations.of(context);
    final provider = remoteImage['ProviderName'] as String? ?? 'Unknown';
    final width = remoteImage['Width'] as int?;
    final height = remoteImage['Height'] as int?;
    final resolutionStr = (width != null && height != null)
        ? '${width}x$height'
        : '';
    final url = remoteImage['Url'] as String;

    showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        double? loadedAspectRatio;
        bool isResolvingStarted = false;

        return StatefulBuilder(
          builder: (dialogContext, setStateDialog) {
            final double parentWidth = PlatformDetection.isTV
                ? (MediaQuery.of(dialogContext).size.width * 0.95).clamp(
                    800.0,
                    1100.0,
                  )
                : (MediaQuery.of(dialogContext).size.width * 0.95).clamp(
                    320.0,
                    850.0,
                  );
            final double parentHeight = PlatformDetection.isTV
                ? (MediaQuery.of(dialogContext).size.height * 0.85).clamp(
                    550.0,
                    850.0,
                  )
                : (MediaQuery.of(dialogContext).size.height * 0.85).clamp(
                    320.0,
                    650.0,
                  );

            // Target image dimensions: scaled to fit nicely inside the parent container
            final double maxImageWidth = parentWidth * 0.7;
            final double maxImageHeight = parentHeight * 0.65;

            // Calculate aspect ratio dynamically from image data, falling back to category defaults
            final double defaultAspectRatio =
                (width != null && height != null && height > 0)
                ? width / height
                : dims.aspectRatio;

            final double imageAspectRatio =
                loadedAspectRatio ?? defaultAspectRatio;

            // Calculate bounded dimensions maintaining aspect ratio
            double targetWidth = maxImageWidth;
            double targetHeight = targetWidth / imageAspectRatio;
            if (targetHeight > maxImageHeight) {
              targetHeight = maxImageHeight;
              targetWidth = targetHeight * imageAspectRatio;
            }

            final double dialogWidth = (targetWidth + 32).clamp(
              (320.0).clamp(0.0, parentWidth - 64),
              (parentWidth - 64).clamp(0.0, double.infinity),
            );
            final previewUrl = _getOptimizedRemoteImageUrl(
              url,
              category,
              targetWidth: targetWidth.round(),
            );

            // Resolve the actual aspect ratio once
            if (!isResolvingStarted) {
              isResolvingStarted = true;
              final imageProvider = CachedNetworkImageProvider(previewUrl);
              final imageStream = imageProvider.resolve(
                const ImageConfiguration(),
              );
              ImageStreamListener? listener;
              listener = ImageStreamListener(
                (ImageInfo info, bool _) {
                  final int imgW = info.image.width;
                  final int imgH = info.image.height;
                  if (imgH > 0) {
                    loadedAspectRatio = imgW / imgH;
                    if (dialogContext.mounted) {
                      setStateDialog(() {});
                    }
                  }
                  if (listener != null) {
                    imageStream.removeListener(listener);
                  }
                },
                onError: (dynamic exception, StackTrace? stackTrace) {
                  if (listener != null) {
                    imageStream.removeListener(listener);
                  }
                },
              );
              imageStream.addListener(listener);
            }

            return Align(
              alignment: Alignment.center,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: dialogWidth,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColorScheme.surface,
                    borderRadius: AppRadius.circular(16),
                    border: Border.all(color: Colors.white10, width: 1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Preview: $provider',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (resolutionStr.isNotEmpty)
                            Text(
                              resolutionStr,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white38,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Image
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: targetWidth,
                          height: targetHeight,
                          decoration: BoxDecoration(
                            borderRadius: AppRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: AppRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: previewUrl,
                              fit: BoxFit.contain,
                              memCacheWidth:
                                  (targetWidth *
                                          MediaQuery.devicePixelRatioOf(
                                            dialogContext,
                                          ))
                                      .round()
                                      .clamp(100, 1280),
                              placeholder: (context, url) => AspectRatio(
                                aspectRatio: imageAspectRatio,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => AspectRatio(
                                aspectRatio: imageAspectRatio,
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.white30,
                                    size: 48,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Action Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Download Button
                          FocusableWrapper(
                            autofocus: true,
                            borderRadius: 8,
                            suppressFocusGlow: true,
                            focusColor: AppColorScheme.accent,
                            onNavigateUp: () {},
                            onNavigateDown: () {},
                            onSelect: () {
                              Navigator.pop(dialogContext, true);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.download,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    l10n.download,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Cancel Button
                          FocusableWrapper(
                            borderRadius: 8,
                            suppressFocusGlow: true,
                            focusColor: Colors.white12,
                            onNavigateUp: () {},
                            onNavigateDown: () {},
                            onSelect: () {
                              Navigator.pop(dialogContext, false);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                l10n.cancel,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).then((shouldDownload) {
      if (shouldDownload == true) {
        _downloadImage(category, remoteImage);
      }
    });
  }

  Widget _buildRemoteCard(
    String category,
    Map<String, dynamic> remoteImage,
    ImageDimensions dims,
    bool isActionLoading, {
    FocusNode? focusNode,
    FocusOnKeyEventCallback? onKeyEvent,
    double scrollAlignment = 0.5,
    ScrollPositionAlignmentPolicy alignmentPolicy =
        ScrollPositionAlignmentPolicy.explicit,
  }) {
    final provider = remoteImage['ProviderName'] as String? ?? '';
    final width = remoteImage['Width'] as int?;
    final height = remoteImage['Height'] as int?;
    final rating = remoteImage['CommunityRating'] as num?;
    final votes = remoteImage['VoteCount'] as int?;

    final url = remoteImage['Url'] as String;
    final thumbUrl = _getOptimizedRemoteImageUrl(
      (remoteImage['ThumbnailUrl'] as String?) ?? url,
      category,
    );

    final isGridView = _focusedCategory != null;
    final double? cardWidth = isGridView ? null : dims.width;

    final cardWidget = _buildCardWrapper(
      category: category,
      dims: dims,
      child: ClipRRect(
        borderRadius: AppRadius.circular(8),
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: thumbUrl,
                fit: BoxFit.cover,
                memCacheWidth:
                    (dims.width * MediaQuery.devicePixelRatioOf(context))
                        .round(),
                placeholder: (context, url) => Container(
                  color: Colors.white12,
                  child: const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.white12,
                  child: const Icon(Icons.broken_image, color: Colors.white24),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                    stops: const [0.6, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onSelect: isActionLoading
          ? null
          : () => _showZoomPreviewDialog(category, remoteImage, dims),
      focusNode: focusNode,
      onKeyEvent: onKeyEvent,
      scrollAlignment: scrollAlignment,
      alignmentPolicy: alignmentPolicy,
    );

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          cardWidget,
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  provider,
                  style: const TextStyle(fontSize: 10, color: Colors.white38),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (rating != null && rating > 0) ...[
                const SizedBox(width: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 10,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      votes != null ? '$votes' : rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
          if (width != null && height != null) ...[
            const SizedBox(height: 2),
            Text(
              '${width}x$height',
              style: const TextStyle(fontSize: 10, color: Colors.white38),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
