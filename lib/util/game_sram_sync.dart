import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:server_core/server_core.dart';

import 'game_storage.dart';

/// Keeps a game's battery save (SRAM) in step with the server, stored under
/// the bare game id with the `sram` save kind.
///
/// The local copy is `<saveDir>/<gameId>.srm`, the file the native hosts read
/// and write. A `.synced` copy beside it holds the bytes the server last had.
/// When the local file differs from it, the server never got that progress,
/// either because an upload failed or because the session ended without an
/// exit, so the next launch uploads it instead of downloading over it.
class GameSramSync {
  GameSramSync(this._games, this._gameId, Directory saveDir)
    : file = File('${saveDir.path}/$_gameId.srm'),
      _synced = File('${saveDir.path}/$_gameId.srm.synced');

  /// Null when this platform has no local game storage, as on web.
  static Future<GameSramSync?> open(GamesApi games, String gameId) async {
    try {
      return GameSramSync(games, gameId, await GameStorage.saveDir());
    } catch (_) {
      return null;
    }
  }

  static const _timeout = Duration(seconds: 10);

  final GamesApi _games;
  final String _gameId;
  final File file;
  final File _synced;

  /// Runs before a launch. Uploads local progress the server never got, or
  /// when there is none and [download] is set, writes the server's copy to
  /// [file]. Returns true when the local copy has to win, so the caller must
  /// not load the server's copy either.
  Future<bool> prepare({bool download = true}) async {
    try {
      if (await file.exists()) {
        final local = await file.readAsBytes();
        if (local.isNotEmpty && !await _matches(_synced, local)) {
          await _upload(local);
          return true;
        }
      }
      if (!download) return false;
      final remote = await _games
          .getSave(_gameId, kind: 'sram')
          .timeout(_timeout);
      if (remote != null && remote.isNotEmpty) {
        await file.writeAsBytes(remote, flush: true);
        await _synced.writeAsBytes(remote, flush: true);
      }
      return false;
    } catch (e) {
      debugPrint('[GameSramSync] $_gameId prepare failed: $e');
      return true;
    }
  }

  /// Runs once the session has ended, with the battery save it left. Skips
  /// bytes the server already has, and keeps them in [file] first so a failed
  /// upload is retried on the next launch.
  Future<void> finish(List<int> bytes) async {
    if (bytes.isEmpty) return;
    try {
      if (await _matches(_synced, bytes)) return;
      if (!await _matches(file, bytes)) {
        await file.writeAsBytes(bytes, flush: true);
      }
      await _upload(bytes);
    } catch (e) {
      debugPrint('[GameSramSync] $_gameId finish failed: $e');
    }
  }

  /// Uploads [file] as it is now, for the native hosts that write it.
  Future<void> finishFromFile() async {
    try {
      if (await file.exists()) await finish(await file.readAsBytes());
    } catch (e) {
      debugPrint('[GameSramSync] $_gameId read failed: $e');
    }
  }

  Future<void> _upload(List<int> bytes) async {
    try {
      await _games.putSave(_gameId, bytes, kind: 'sram').timeout(_timeout);
      await _synced.writeAsBytes(bytes, flush: true);
    } catch (e) {
      debugPrint('[GameSramSync] $_gameId upload failed, kept for later: $e');
    }
  }

  static Future<bool> _matches(File file, List<int> bytes) async =>
      await file.exists() && listEquals(await file.readAsBytes(), bytes);
}
