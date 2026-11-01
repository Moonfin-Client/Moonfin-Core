package org.moonfin.nativevideo

import androidx.media3.common.ForwardingPlayer
import androidx.media3.common.Player

/** Routes even redundant MediaSession play/pause requests through viewer intent ownership. */
internal class SessionPlaybackIntentPlayer(val rawPlayer: Player) : ForwardingPlayer(rawPlayer) {
    private var isRequestCurrent: () -> Boolean = { false }
    private var onPlaybackRequest: (Boolean) -> Unit = {}

    fun updateRequestHandler(
        isCurrent: () -> Boolean,
        onRequest: (Boolean) -> Unit,
    ) {
        isRequestCurrent = isCurrent
        onPlaybackRequest = onRequest
    }

    override fun play() = dispatch(true)

    override fun pause() = dispatch(false)

    override fun setPlayWhenReady(playWhenReady: Boolean) = dispatch(playWhenReady)

    private fun dispatch(playWhenReady: Boolean) {
        if (isRequestCurrent()) onPlaybackRequest(playWhenReady)
    }
}
