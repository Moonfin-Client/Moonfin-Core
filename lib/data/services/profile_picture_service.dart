import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:server_core/server_core.dart';

import '../../auth/repositories/user_repository.dart';
import '../../auth/store/authentication_store.dart';
import '../../util/image_mime.dart';

/// An image ready to send as a profile picture.
typedef ProfilePictureFile = ({Uint8List bytes, String contentType});

/// Why a picked file can't become the profile picture.
class ProfilePictureUnsupported implements Exception {
  const ProfilePictureUnsupported();
}

/// The longest side a converted picture keeps. Avatars are drawn at most
/// 180 px tall (twice that on a dense screen), so this leaves room to spare.
const _convertedMaxSide = 1024;

/// [bytes] as a file [rules] accepts: unchanged when the server takes its
/// type and size, otherwise decoded on the device, scaled down to
/// [_convertedMaxSide] and sent as PNG (an iPhone's HEIC photo, a TIFF, an
/// image over the size limit). Null when the device can't read it either.
Future<ProfilePictureFile?> prepareProfilePicture(
  Uint8List bytes,
  UserImageUpload rules,
) async {
  final type = imageContentTypeForBytes(bytes);
  if (type != null && rules.accepts(type, bytes.length)) {
    return (bytes: bytes, contentType: type);
  }
  if (!rules.contentTypes.contains('image/png')) return null;
  ui.ImmutableBuffer? buffer;
  ui.ImageDescriptor? descriptor;
  ui.Codec? codec;
  try {
    buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
    descriptor = await ui.ImageDescriptor.encoded(buffer);
    final scale = math.min(
      1.0,
      _convertedMaxSide / math.max(descriptor.width, descriptor.height),
    );
    codec = await descriptor.instantiateCodec(
      targetWidth: math.max(1, (descriptor.width * scale).round()),
      targetHeight: math.max(1, (descriptor.height * scale).round()),
    );
    final frame = await codec.getNextFrame();
    final data = await frame.image.toByteData(format: ui.ImageByteFormat.png);
    frame.image.dispose();
    if (data == null) return null;
    final png = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    if (!rules.accepts('image/png', png.length)) return null;
    return (bytes: png, contentType: 'image/png');
  } catch (_) {
    return null;
  } finally {
    codec?.dispose();
    descriptor?.dispose();
    buffer?.dispose();
  }
}

/// Changes the signed-in user's profile picture on their server, and keeps
/// the stored user's image tag in step so every avatar shows the new one.
class ProfilePictureService {
  ProfilePictureService(
    this._client,
    this._store,
    this._users, {
    required this.serverId,
    required this.userId,
  });

  final MediaServerClient _client;
  final AuthenticationStore _store;
  final UserRepository _users;
  final String serverId;
  final String userId;

  /// What the server takes, or null when this user can't change their
  /// picture there. A failed read counts as can't.
  Future<UserImageUpload?> rules() async {
    try {
      return await _client.usersApi.userImageUpload(userId);
    } catch (e) {
      ServerLog.network(
        'Profile picture support unreadable',
        level: ServerLogLevel.warning,
        error: e,
      );
      return null;
    }
  }

  /// Asks for an image file and prepares it for [rules]. Null when nothing
  /// was picked. Throws [ProfilePictureUnsupported] for a file that can't be
  /// used.
  Future<ProfilePictureFile?> pick(UserImageUpload rules) async {
    final result = await FilePicker.pickFiles(
      type: FileType.image,
      withData: true,
    );
    final file = result?.files.firstOrNull;
    if (file == null) return null;
    var bytes = file.bytes;
    if (bytes == null && file.path != null) {
      bytes = await File(file.path!).readAsBytes();
    }
    if (bytes == null) throw const ProfilePictureUnsupported();
    final prepared = await prepareProfilePicture(bytes, rules);
    if (prepared == null) throw const ProfilePictureUnsupported();
    return prepared;
  }

  Future<void> upload(ProfilePictureFile file) async {
    await _client.usersApi.uploadUserImage(
      userId,
      bytes: file.bytes,
      contentType: file.contentType,
    );
    await _refreshImageTag();
  }

  Future<void> remove() async {
    await _client.usersApi.deleteUserImage(userId);
    await _refreshImageTag();
  }

  /// Reads the user's new image tag and stores it. The avatar URLs carry the
  /// tag, so a new one loads the new picture instead of the cached one.
  Future<void> _refreshImageTag() async {
    final serverUser = await _client.usersApi.getCurrentUser();
    final stored = _store.getUser(serverId, userId);
    if (stored == null) return;
    final tag = serverUser.primaryImageTag;
    final updated = tag == null || tag.isEmpty
        ? stored.copyWith(clearImageTag: true)
        : stored.copyWith(imageTag: tag);
    await _store.putUser(updated);
    final current = _users.currentUser;
    if (current != null && current.id == userId) {
      _users.setCurrentUser(updated);
    }
  }
}
