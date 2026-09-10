package org.moonfin.nativevideo

import android.os.SystemClock
import androidx.media3.common.util.UnstableApi
import androidx.media3.datasource.DataSource
import androidx.media3.datasource.DataSpec
import androidx.media3.datasource.TransferListener
import java.util.concurrent.ConcurrentHashMap

/**
 * Puts the player's own HTTP traffic in the diagnostic report.
 *
 * Playlists and segments are fetched through media3's stack rather than the
 * Dart client, so a report listed every API call the app made and none of the
 * traffic playback actually runs on. A transcode the server is still producing
 * looked the same as one the player had stopped asking for.
 *
 * Requests are stated as they go out rather than when they finish, because a
 * request that never finishes is the one worth seeing. A film is hundreds of
 * segments, so only the ones that carry something are written: the first of a
 * stream, an index that did not follow the one before it, a periodic line so
 * steady progress stays visible, and any fetch slow enough to be the stall.
 */
@UnstableApi
object Media3TransferLog : TransferListener {
    private const val SLOW_FETCH_MS = 3_000L
    private const val SUMMARY_EVERY = 25

    private class Pending(val stream: String, val index: Int, val startedAtMs: Long)

    private class StreamTrace {
        var lastIndex: Int? = null
        var requested = 0
        var completed = 0
        var totalMs = 0L
    }

    private val pending = ConcurrentHashMap<String, Pending>()
    private val traceByStream = ConcurrentHashMap<String, StreamTrace>()

    /** Each source starts its own trace, so indexes are read against it alone. */
    fun reset() {
        pending.clear()
        traceByStream.clear()
    }

    override fun onTransferInitializing(
        source: DataSource,
        dataSpec: DataSpec,
        isNetwork: Boolean,
    ) {
        if (!isNetwork) return
        val name = dataSpec.uri.lastPathSegment ?: return

        if (name.endsWith(".m3u8")) {
            emit("playlist", name = name)
            return
        }

        val index = name.substringBeforeLast('.').toIntOrNull() ?: return
        val stream = dataSpec.uri.path?.substringBeforeLast('/') ?: return
        pending[dataSpec.uri.toString()] =
            Pending(stream, index, SystemClock.elapsedRealtime())

        val trace = traceByStream.getOrPut(stream) { StreamTrace() }
        val previous: Int?
        val requested: Int
        val averageMs: Long
        synchronized(trace) {
            previous = trace.lastIndex
            trace.lastIndex = index
            trace.requested++
            requested = trace.requested
            averageMs = if (trace.completed == 0) 0 else trace.totalMs / trace.completed
        }

        val reason = when {
            previous == null -> "first"
            index != previous + 1 -> "outOfOrder"
            requested % SUMMARY_EVERY == 0 -> "progress"
            else -> return
        }
        emit(
            reason,
            index = index,
            previousIndex = previous,
            requested = requested,
            averageMs = averageMs,
        )
    }

    override fun onTransferStart(
        source: DataSource,
        dataSpec: DataSpec,
        isNetwork: Boolean,
    ) = Unit

    // Called for every chunk of every transfer, so it stays empty on purpose.
    override fun onBytesTransferred(
        source: DataSource,
        dataSpec: DataSpec,
        isNetwork: Boolean,
        bytesTransferred: Int,
    ) = Unit

    override fun onTransferEnd(
        source: DataSource,
        dataSpec: DataSpec,
        isNetwork: Boolean,
    ) {
        if (!isNetwork) return
        val request = pending.remove(dataSpec.uri.toString()) ?: return
        val elapsedMs = SystemClock.elapsedRealtime() - request.startedAtMs
        traceByStream[request.stream]?.let { trace ->
            synchronized(trace) {
                trace.completed++
                trace.totalMs += elapsedMs
            }
        }
        if (elapsedMs < SLOW_FETCH_MS) return
        emit("slow", index = request.index, elapsedMs = elapsedMs)
    }

    private fun emit(
        reason: String,
        name: String? = null,
        index: Int? = null,
        previousIndex: Int? = null,
        requested: Int? = null,
        averageMs: Long? = null,
        elapsedMs: Long? = null,
    ) {
        Media3Bridge.emitEvent(
            mapOf(
                "event" to "media3Transfer",
                "reason" to reason,
                "name" to name,
                "index" to index,
                "previousIndex" to previousIndex,
                "requested" to requested,
                "averageMs" to averageMs,
                "elapsedMs" to elapsedMs,
            ),
        )
    }
}
