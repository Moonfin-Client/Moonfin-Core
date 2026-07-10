/// Playback core abstraction layer.
///
/// Provides the plugin-based playback architecture supporting
/// multiple backends and server integrations.
library;

export 'src/playback_manager.dart';
export 'src/playback_arbiter.dart';
export 'src/player_backend.dart';
export 'src/player_service.dart';
export 'src/queue_service.dart';
export 'src/player_state.dart';
export 'src/media_stream_resolver.dart';
export 'src/track_ordinal_mapper.dart';
export 'src/stream_resolution_result.dart';
export 'src/web_platform.dart';
