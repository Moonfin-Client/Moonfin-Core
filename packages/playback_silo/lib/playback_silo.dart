/// Playback for Silo servers.
///
/// Silo decides the route on the server: the client posts its codec evidence
/// to `POST /api/v2/playback/start` and gets back one plan (delivery, signed
/// stream URL, subtitles, timeline, session id), then reports sequenced
/// progress and an idempotent stop against that session.
library;

export 'src/silo_plugin.dart';
export 'src/silo_capabilities_translator.dart';
export 'src/silo_playback_context.dart';
export 'src/silo_plan_mapper.dart';
export 'src/silo_playback_sessions.dart';
export 'src/silo_subtitles.dart';
export 'src/silo_media_stream_resolver.dart';
export 'src/silo_play_session_service.dart';
