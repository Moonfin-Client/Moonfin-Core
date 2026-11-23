/// Data layer of the local IPTV (Xtream/M3U) catalog backend: database,
/// models, repositories, credential store and import/EPG services.
library;

export 'src/credentials/iptv_credential_store.dart';
export 'src/db/iptv_database.dart';
export 'src/models/m3u_entry.dart';
export 'src/models/xtream_models.dart';
export 'src/repositories/channel_repository.dart';
export 'src/repositories/epg_repository.dart';
export 'src/repositories/personalization_repository.dart';
export 'src/repositories/playlist_repository.dart';
export 'src/repositories/recordings_repository.dart';
export 'src/repositories/reminders_repository.dart';
export 'src/repositories/vod_repository.dart';
export 'src/repositories/watch_state_repository.dart';
export 'src/services/duplicate_detection_service.dart';
export 'src/services/playlist_health_check_service.dart';
export 'src/services/tmdb_service.dart';
export 'src/services/catchup_url_builder.dart';
export 'src/services/epg_service.dart';
export 'src/services/m3u_parser.dart';
export 'src/services/playlist_service.dart';
export 'src/services/stream_url_builder.dart';
export 'src/services/vod_title.dart';
