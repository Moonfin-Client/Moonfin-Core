# Entry redirect (fork addition)

This fork adds one feature on top of upstream Moonfin: a server added through
a stable name that answers with a redirect to a dynamic `host:port` (for
example VPN port forwarding behind a fixed name) keeps working when the
target moves, during playback too.

Everything of the feature lives in its own files. Upstream files only carry
short hooks, each marked with `entry redirect` in a comment, so
`git grep -n "entry redirect"` lists every place where upstream code calls in.

## Own files

| Area | File |
|---|---|
| Service: remembers and follows the entered address | `lib/entry_redirect/entry_redirect.dart` |
| Storage of the entered addresses (own key, takes over older builds) | `lib/entry_redirect/entry_address_store.dart` |
| Reachability check and player: follow while a stream is lost | `lib/entry_redirect/entry_redirect_connectivity.dart` |
| Wiring into the app | `lib/entry_redirect/entry_redirect_module.dart` |
| Media3 backend: rebase calls and stall events | `lib/playback/media3_server_rebase.dart` |
| AetherEngine backend (Apple): reports a dropped source at once | `lib/playback/aether_server_rebase.dart` |
| Player: keep playing or reopen after a move | `packages/playback_core/lib/src/playback_manager_server_rebase.dart` |
| HTTP: retry a request that couldn't connect at the new address | `packages/server_core/lib/src/network/server_moved_interceptor.dart` |
| HTTP: hooks the app sets | `packages/server_core/lib/src/network/server_moved.dart` |
| Android: data source that follows a move, stall watchdog | `packages/moonfin_native_video/android/src/main/kotlin/org/moonfin/nativevideo/ServerRebase.kt` |

Tests:

- `test/entry_redirect/`
- `test/playback/playback_manager_reconnect_entry_redirect.dart`
- `packages/server_core/test/server_moved_interceptor_test.dart`
- `packages/server_jellyfin/test/jellyfin_base_url_follow_test.dart`
- `packages/moonfin_native_video/android/src/test/kotlin/org/moonfin/nativevideo/ServerRebaseTest.kt`

## Hooks in upstream files

| File | Hook |
|---|---|
| `lib/di/injection.dart` | `registerEntryRedirect()` after the modules |
| `lib/auth/repositories/server_repository.dart` | `entryRedirect` field, `probeServer`, record after add, follow in `withCheckedType`, entry host counts as own host |
| `lib/data/services/connectivity_service.dart` | `onServerUnreachable` asked after failed pings, `activeServerId` |
| `lib/ui/screens/auth/server_select_screen.dart` | follow all entry addresses, refresh on a move |
| `lib/playback/media3_player_backend.dart` | `with Media3ServerRebase`, `serverStalled` event |
| `lib/playback/aether_backend.dart` | `with AetherServerRebase`, engine log line |
| `packages/playback_core/lib/src/playback_manager.dart` | `part` file, buffering, attach, seek, dispose |
| `packages/server_core/lib/src/network/configure_server_dio_io.dart` | adds the interceptor |
| `packages/server_core/lib/server_core.dart` | exports `server_moved.dart` |
| `packages/server_jellyfin/lib/src/...` | stream and image URLs read the current base URL (`baseUrlOf`) |
| `Media3VideoView.kt`, `Media3Bridge.kt` | data source factory, `rebaseServer` call, source set and clear |

Only servers added through a redirect are affected: for any other server the
hooks do nothing.
