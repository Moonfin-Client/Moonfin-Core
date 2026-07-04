import '../models/admin_models.dart';

abstract class AdminLibraryApi {
  Future<List<VirtualFolderInfo>> getVirtualFolders();
  Future<void> addVirtualFolder({
    required String name,
    String? collectionType,
    List<String>? paths,
    bool refreshLibrary = false,
  });
  Future<void> removeVirtualFolder(String name, {bool refreshLibrary = false});
  Future<void> renameVirtualFolder(
    String name,
    String newName, {
    bool refreshLibrary = false,
  });
  Future<void> addMediaPath(String libraryName, String path);
  Future<void> updateMediaPath(
    String libraryName,
    Map<String, dynamic> pathInfo,
  );
  Future<void> removeMediaPath(
    String libraryName,
    String path, {
    bool refreshLibrary = false,
  });
  Future<void> updateLibraryOptions(
    String libraryId,
    Map<String, dynamic> options,
  );
  Future<void> refreshLibrary();
  Future<List<String>> getPhysicalPaths();
  Future<List<VirtualFolderInfo>> getMediaFolders();

  /// Available metadata/image/subtitle/lyric fetchers and savers for a library
  /// content type, used to build the downloader-ordering UI. Returned as a raw
  /// map (`MetadataSavers`, `SubtitleFetchers`, `TypeOptions[]`, ...).
  Future<Map<String, dynamic>> getAvailableLibraryOptions(String? contentType);
}
