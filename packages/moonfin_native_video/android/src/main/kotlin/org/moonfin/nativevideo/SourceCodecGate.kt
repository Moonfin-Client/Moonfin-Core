package org.moonfin.nativevideo

import java.util.concurrent.atomic.AtomicReference

/**
 * Source-owned gate for video codec initialization during startup measurement.
 *
 * The source token and blocked flag live in one immutable atomic state so a
 * delayed release cannot unblock a replacement source between a token check
 * and a separate flag write.
 */
internal class SourceCodecGate {
    private data class State(
        val sourceToken: Int,
        val blocked: Boolean,
    )

    private val state = AtomicReference(State(sourceToken = 0, blocked = false))

    val isBlocked: Boolean
        get() = state.get().blocked

    fun block(sourceToken: Int) {
        state.set(State(sourceToken = sourceToken, blocked = true))
    }

    fun open(sourceToken: Int): Boolean {
        val current = state.get()
        if (current.sourceToken != sourceToken || !current.blocked) return false
        return state.compareAndSet(current, State(sourceToken = sourceToken, blocked = false))
    }
}
