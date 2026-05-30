package org.moonfin.nativevideo

import android.content.Context
import android.content.Intent
import androidx.media3.common.Player
import androidx.media3.session.MediaSession
import androidx.media3.session.SessionResult

object Media3SessionController {
    private const val SESSION_ID = "moonfin_media3_session"

    private val sessionCallback = object : MediaSession.Callback {
        override fun onConnect(
            session: MediaSession,
            controller: MediaSession.ControllerInfo,
        ): MediaSession.ConnectionResult {
            val playerCommands = MediaSession.ConnectionResult.DEFAULT_PLAYER_COMMANDS
                .buildUpon()
                .add(Player.COMMAND_SEEK_TO_NEXT)
                .add(Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM)
                .add(Player.COMMAND_SEEK_TO_PREVIOUS)
                .add(Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM)
                .build()
            return MediaSession.ConnectionResult.accept(
                MediaSession.ConnectionResult.DEFAULT_SESSION_COMMANDS,
                playerCommands,
            )
        }

        override fun onPlayerCommandRequest(
            session: MediaSession,
            controller: MediaSession.ControllerInfo,
            playerCommand: Int,
        ): Int {
            return when (playerCommand) {
                Player.COMMAND_SEEK_TO_NEXT,
                Player.COMMAND_SEEK_TO_NEXT_MEDIA_ITEM,
                Player.COMMAND_SEEK_TO_NEXT_WINDOW,
                -> {
                    if (!uiMetadataBoolean("hasNext")) {
                        SessionResult.RESULT_ERROR_NOT_SUPPORTED
                    } else {
                        emitActivityAction("next")
                        SessionResult.RESULT_SUCCESS
                    }
                }

                Player.COMMAND_SEEK_TO_PREVIOUS,
                Player.COMMAND_SEEK_TO_PREVIOUS_MEDIA_ITEM,
                Player.COMMAND_SEEK_TO_PREVIOUS_WINDOW,
                -> {
                    if (!uiMetadataBoolean("hasPrevious")) {
                        SessionResult.RESULT_ERROR_NOT_SUPPORTED
                    } else {
                        emitActivityAction("previous")
                        SessionResult.RESULT_SUCCESS
                    }
                }

                else -> SessionResult.RESULT_SUCCESS
            }
        }
    }

    @Volatile
    private var mediaSession: MediaSession? = null

    @Volatile
    private var activePlayer: Player? = null

    @Volatile
    private var activeService: MoonfinMediaSessionService? = null

    @Synchronized
    fun attachPlayer(context: Context, player: Player) {
        val existingSession = mediaSession
        if (existingSession == null) {
            val appContext = context.applicationContext
            val sessionActivityIntent = appContext.packageManager.getLaunchIntentForPackage(
                appContext.packageName,
            )?.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP)
            val sessionBuilder = MediaSession.Builder(appContext, player)
                .setId(SESSION_ID)
                .setCallback(sessionCallback)
            if (sessionActivityIntent != null) {
                val sessionActivity = android.app.PendingIntent.getActivity(
                    appContext,
                    0,
                    sessionActivityIntent,
                    android.app.PendingIntent.FLAG_UPDATE_CURRENT or
                        android.app.PendingIntent.FLAG_IMMUTABLE,
                )
                sessionBuilder.setSessionActivity(sessionActivity)
            }
            mediaSession = sessionBuilder.build()
            runCatching {
                appContext.startService(Intent(appContext, MoonfinMediaSessionService::class.java))
            }
            activeService?.registerSession(mediaSession)
            activePlayer = player
            return
        }

        if (activePlayer !== player) {
            runCatching {
                existingSession.setPlayer(player)
            }
            activePlayer = player
        }
    }

    @Synchronized
    fun bindService(service: MoonfinMediaSessionService) {
        activeService = service
        service.registerSession(mediaSession)
    }

    @Synchronized
    fun unbindService(service: MoonfinMediaSessionService) {
        if (activeService === service) {
            activeService = null
        }
    }

    @Synchronized
    fun currentSession(): MediaSession? = mediaSession

    @Synchronized
    fun releaseForPlayer(player: Player) {
        if (activePlayer !== player) {
            return
        }
        activeService?.unregisterSession(mediaSession)
        runCatching {
            mediaSession?.release()
        }
        mediaSession = null
        activePlayer = null
    }

    private fun uiMetadataBoolean(key: String): Boolean {
        return Media3Bridge.activeUiMetadata()[key] as? Boolean ?: false
    }

    private fun emitActivityAction(action: String) {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "activityAction",
                "action" to action,
            ),
        )
    }
}
