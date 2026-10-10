import 'package:server_core/server_core.dart';

/// Thrown by a Silo API surface that is planned but not implemented yet.
///
/// Every class in this file is scaffolding for the step named in its
/// [SiloNotImplementedError.step] (see the Silo support plan linked from the
/// tracking issue) and is deleted when that step lands. They exist so the client can be constructed
/// and wired into the app before every API is translated.
class SiloNotImplementedError extends UnimplementedError {
  final String api;
  final String step;

  SiloNotImplementedError(this.api, String member, this.step)
    : super('Silo $api.$member is not implemented yet (plan $step)');
}

abstract class _Pending {
  String get _api;
  String get _step;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    final name = invocation.memberName
        .toString()
        .replaceFirst('Symbol("', '')
        .replaceFirst('")', '')
        .replaceFirst('=', '');
    throw SiloNotImplementedError(_api, name, _step);
  }
}



class SiloPendingAuthApi extends _Pending implements AuthApi {
  @override
  String get _api => 'AuthApi';
  @override
  String get _step => '§4 (step 3: sign-in and profiles)';
}

class SiloPendingUsersApi extends _Pending implements UsersApi {
  @override
  String get _api => 'UsersApi';
  @override
  String get _step => '§4 (step 3: sign-in and profiles)';
}

class SiloPendingItemsApi extends _Pending implements ItemsApi {
  @override
  String get _api => 'ItemsApi';
  @override
  String get _step => '§6.6 (step 4: browsing)';
}

class SiloPendingUserViewsApi extends _Pending implements UserViewsApi {
  @override
  String get _api => 'UserViewsApi';
  @override
  String get _step => '§6.5 (step 4)';
}

class SiloPendingUserLibraryApi extends _Pending implements UserLibraryApi {
  @override
  String get _api => 'UserLibraryApi';
  @override
  String get _step => '§6.7 (step 5)';
}

class SiloPendingDisplayPreferencesApi extends _Pending
    implements DisplayPreferencesApi {
  @override
  String get _api => 'DisplayPreferencesApi';
  @override
  String get _step => '§6.8 (step 5)';
}

class SiloPendingPlaybackApi extends _Pending implements PlaybackApi {
  @override
  String get _api => 'PlaybackApi';
  @override
  String get _step => '§7 (step 6: playback)';
}

class SiloPendingSessionApi extends _Pending implements SessionApi {
  @override
  String get _api => 'SessionApi';
  @override
  String get _step => '§6.9';
}

/// Image URLs are built synchronously while widgets render, so this stub
/// answers with no URL (the UI shows its placeholder) instead of throwing.
/// Replaced by the image registry in §5.6 (step 4).
class SiloPendingImageApi implements ImageApi {
  const SiloPendingImageApi();

  @override
  String getPrimaryImageUrl(String itemId, {int? maxWidth, int? maxHeight, String? tag}) => '';
  @override
  String getBackdropImageUrl(String itemId, {int? maxWidth, int? index, String? tag}) => '';
  @override
  String getLogoImageUrl(String itemId, {int? maxWidth, String? tag}) => '';
  @override
  String getBannerImageUrl(String itemId, {int? maxWidth, String? tag}) => '';
  @override
  String getThumbImageUrl(String itemId, {int? maxWidth, String? tag}) => '';
  @override
  String getChapterImageUrl(String itemId, {required int index, int? maxWidth, String? tag}) => '';
  @override
  String getUserImageUrl(String userId) => '';
  @override
  String getTrickplayTileImageUrl(String itemId, {required int width, required int index, String? mediaSourceId}) => '';
}
