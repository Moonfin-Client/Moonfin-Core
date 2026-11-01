package org.moonfin.nativevideo

import androidx.media3.common.Player
import java.lang.reflect.Proxy
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class SessionPlaybackIntentPlayerTest {
    private class PlayerProbe {
        var playWhenReady = false
        var forwardedCalls = 0

        val player: Player = Proxy.newProxyInstance(
            Player::class.java.classLoader,
            arrayOf(Player::class.java),
        ) { proxy, method, args ->
            when (method.name) {
                "getPlayWhenReady" -> playWhenReady
                "play", "pause", "setPlayWhenReady" -> {
                    forwardedCalls++
                    if (method.name == "play") playWhenReady = true
                    if (method.name == "pause") playWhenReady = false
                    if (method.name == "setPlayWhenReady") playWhenReady = args!![0] as Boolean
                    null
                }
                "equals" -> proxy === args?.get(0)
                "hashCode" -> System.identityHashCode(proxy)
                "toString" -> "PlayerProbe"
                else -> when (method.returnType) {
                    java.lang.Boolean.TYPE -> false
                    java.lang.Integer.TYPE -> 0
                    java.lang.Long.TYPE -> 0L
                    java.lang.Float.TYPE -> 0f
                    java.lang.Double.TYPE -> 0.0
                    else -> null
                }
            }
        } as Player
    }

    @Test
    fun `redundant media session pauses still reach the viewer intent callback`() {
        val probe = PlayerProbe()
        val wrapper = SessionPlaybackIntentPlayer(probe.player)
        val requests = mutableListOf<Boolean>()
        wrapper.updateRequestHandler(isCurrent = { true }, onRequest = requests::add)

        wrapper.pause()
        wrapper.setPlayWhenReady(false)

        assertEquals(listOf(false, false), requests)
        assertFalse(probe.playWhenReady)
        assertEquals(0, probe.forwardedCalls)
    }

    @Test
    fun `media session play during correction updates intent without touching raw player`() {
        val probe = PlayerProbe()
        val session = DisplayRateSession()
        session.beginSource(3, playWhenReady = false)
        session.beginCorrection(3)
        val wrapper = SessionPlaybackIntentPlayer(probe.player)
        wrapper.updateRequestHandler(
            isCurrent = { session.isCurrent(3) && probe.player === wrapper.rawPlayer },
            onRequest = { playWhenReady -> session.requestPlayback(playWhenReady) },
        )

        wrapper.play()

        assertTrue(session.desiredPlayWhenReady)
        assertTrue(session.correctionHolding)
        assertFalse(probe.playWhenReady)
        assertEquals(0, probe.forwardedCalls)
    }

    @Test
    fun `same raw player can receive refreshed source guard and stale callback is rejected`() {
        val probe = PlayerProbe()
        val session = DisplayRateSession()
        session.beginSource(4, playWhenReady = true)
        val wrapper = SessionPlaybackIntentPlayer(probe.player)
        var oldRequests = 0
        var currentRequests = 0
        wrapper.updateRequestHandler(
            isCurrent = { session.isCurrent(4) },
            onRequest = { oldRequests++ },
        )
        session.beginSource(5, playWhenReady = true)
        wrapper.pause()
        assertEquals(0, oldRequests)

        wrapper.updateRequestHandler(
            isCurrent = { session.isCurrent(5) && probe.player === wrapper.rawPlayer },
            onRequest = { currentRequests++; session.requestPlayback(it) },
        )
        wrapper.pause()

        assertEquals(0, oldRequests)
        assertEquals(1, currentRequests)
        assertFalse(session.desiredPlayWhenReady)
        assertEquals(0, probe.forwardedCalls)
    }
}
