package org.moonfin.nativevideo

import androidx.media3.session.MediaSession
import androidx.media3.session.MediaSessionService

class MoonfinMediaSessionService : MediaSessionService() {
    override fun onCreate() {
        super.onCreate()
        Media3SessionController.bindService(this)
    }

    override fun onDestroy() {
        Media3SessionController.unbindService(this)
        super.onDestroy()
    }

    override fun onGetSession(controllerInfo: MediaSession.ControllerInfo): MediaSession? {
        return Media3SessionController.currentSession()
    }

    fun registerSession(session: MediaSession?) {
        if (session == null) {
            return
        }
        if (!isSessionAdded(session)) {
            addSession(session)
        }
    }

    fun unregisterSession(session: MediaSession?) {
        if (session == null) {
            return
        }
        if (isSessionAdded(session)) {
            removeSession(session)
        }
    }
}
