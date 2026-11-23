/// Stable, URL-safe string IDs for IPTV catalog items.
///
/// Every ID the IPTV backend emits is a string of the form
/// `iptv_{kind}_{tail}`. Library ids end in a word, genre ids in a hash and
/// the rest in row numbers, so IDs survive router paths and every `Id` field
/// in the item maps stays a string.
library;

const _prefix = 'iptv';

/// Pseudo-library ids (the IPTV "user views").
class IptvLibraryIds {
  static const live = 'iptv_lib_live';
  static const movies = 'iptv_lib_movies';
  static const shows = 'iptv_lib_shows';

  static const all = [live, movies, shows];
}

sealed class IptvId {
  const IptvId();

  String encode();

  static IptvId? tryParse(String id) {
    final parts = id.split('_');
    if (parts.length < 3 || parts.first != _prefix) return null;
    final kind = parts[1];
    final nums = parts.sublist(2).map(int.tryParse).toList();

    switch (kind) {
      case 'ch':
        if (nums.length == 2 && !nums.contains(null)) {
          return IptvChannelId(playlistId: nums[0]!, channelRowId: nums[1]!);
        }
      case 'vod':
        if (nums.length == 2 && !nums.contains(null)) {
          return IptvVodId(playlistId: nums[0]!, vodRowId: nums[1]!);
        }
      case 'ser':
        if (nums.length == 2 && !nums.contains(null)) {
          return IptvSeriesId(playlistId: nums[0]!, vodRowId: nums[1]!);
        }
      case 'sea':
        if (nums.length == 3 && !nums.contains(null)) {
          return IptvSeasonId(
            playlistId: nums[0]!,
            vodRowId: nums[1]!,
            seasonNumber: nums[2]!,
          );
        }
      case 'ep':
        if (nums.length == 2 && !nums.contains(null)) {
          return IptvEpisodeId(playlistId: nums[0]!, episodeRowId: nums[1]!);
        }
      case 'prog':
        if (nums.length == 2 && !nums.contains(null)) {
          return IptvProgramId(programRowId: nums[0]!, channelRowId: nums[1]!);
        }
      case 'rec':
        if (nums.length == 1 && nums[0] != null) {
          return IptvRecordingId(recordingRowId: nums[0]!);
        }
      case 'timer':
        if (nums.length == 1 && nums[0] != null) {
          return IptvTimerId(scheduleRowId: nums[0]!);
        }
      case 'lib':
        // Library ids carry a word tail like `iptv_lib_live`, not a number.
        if (IptvLibraryIds.all.contains(id)) {
          return IptvLibraryId(id);
        }
    }
    return null;
  }
}

class IptvChannelId extends IptvId {
  final int playlistId;
  final int channelRowId;
  const IptvChannelId({required this.playlistId, required this.channelRowId});

  @override
  String encode() => '${_prefix}_ch_${playlistId}_$channelRowId';
}

class IptvVodId extends IptvId {
  final int playlistId;
  final int vodRowId;
  const IptvVodId({required this.playlistId, required this.vodRowId});

  @override
  String encode() => '${_prefix}_vod_${playlistId}_$vodRowId';
}

/// A VOD row flagged `isSeries`. The id points at the series row itself.
class IptvSeriesId extends IptvId {
  final int playlistId;
  final int vodRowId;
  const IptvSeriesId({required this.playlistId, required this.vodRowId});

  @override
  String encode() => '${_prefix}_ser_${playlistId}_$vodRowId';
}

class IptvSeasonId extends IptvId {
  final int playlistId;
  final int vodRowId;
  final int seasonNumber;
  const IptvSeasonId({
    required this.playlistId,
    required this.vodRowId,
    required this.seasonNumber,
  });

  @override
  String encode() => '${_prefix}_sea_${playlistId}_${vodRowId}_$seasonNumber';
}

class IptvEpisodeId extends IptvId {
  final int playlistId;
  final int episodeRowId;
  const IptvEpisodeId({required this.playlistId, required this.episodeRowId});

  @override
  String encode() => '${_prefix}_ep_${playlistId}_$episodeRowId';
}

/// A guide program as shown on one channel. Twin channels that share a guide
/// share program rows, so the channel says which one a timer or catchup uses.
class IptvProgramId extends IptvId {
  final int programRowId;
  final int channelRowId;
  const IptvProgramId({required this.programRowId, required this.channelRowId});

  @override
  String encode() => '${_prefix}_prog_${programRowId}_$channelRowId';
}

class IptvRecordingId extends IptvId {
  final int recordingRowId;
  const IptvRecordingId({required this.recordingRowId});

  @override
  String encode() => '${_prefix}_rec_$recordingRowId';
}

class IptvTimerId extends IptvId {
  final int scheduleRowId;
  const IptvTimerId({required this.scheduleRowId});

  @override
  String encode() => '${_prefix}_timer_$scheduleRowId';
}

class IptvLibraryId extends IptvId {
  final String id;
  const IptvLibraryId(this.id);

  @override
  String encode() => id;
}
