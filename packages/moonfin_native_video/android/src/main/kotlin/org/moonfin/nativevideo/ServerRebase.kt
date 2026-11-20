package org.moonfin.nativevideo

import android.net.Uri
import androidx.annotation.OptIn
import androidx.media3.common.util.UnstableApi
import androidx.media3.datasource.DataSource
import androidx.media3.datasource.DataSpec
import androidx.media3.datasource.TransferListener
import java.io.IOException
import java.util.Collections
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.Executors
import java.util.concurrent.ScheduledFuture
import java.util.concurrent.TimeUnit

/**
 * Moves the player's server requests to a server's new address while it plays.
 *
 * A server added through a redirect to a dynamic `host:port` answers on a new
 * port once its target moves, and the old one goes quiet without refusing, so
 * a load in flight would only fail after the read timeout. [rebase] maps the
 * old origin to the new one for every later open and cuts the loads still on
 * the old one. The loader takes that as a failed read and asks again from the
 * same byte, now on the new address, while playback runs on from the buffer.
 */
@OptIn(UnstableApi::class)
object ServerRebase {
    private val origins = ConcurrentHashMap<String, String>()
    private val open = Collections.newSetFromMap(ConcurrentHashMap<RebasingDataSource, Boolean>())

    /** Sends requests for [from] to [to] and cuts the loads still on [from]. Returns how many it cut. */
    fun rebase(from: String, to: String): Int {
        val old = originOf(Uri.parse(from)) ?: return 0
        val new = originOf(Uri.parse(to)) ?: return 0
        if (old == new) return 0
        // Earlier moves now lead to the newest address too.
        for (key in origins.keys) {
            if (origins[key] == old) origins[key] = new
        }
        origins[old] = new
        origins.remove(new)
        var cut = 0
        for (source in open.toList()) {
            if (source.isOn(old)) {
                source.abort()
                cut++
            }
        }
        return cut
    }

    internal fun rewrite(uri: Uri): Uri {
        val origin = originOf(uri) ?: return uri
        val target = origins[origin] ?: return uri
        val to = Uri.parse(target)
        return uri.buildUpon().scheme(to.scheme).encodedAuthority(to.encodedAuthority).build()
    }

    internal fun opened(source: RebasingDataSource) {
        open.add(source)
        watch()
    }

    internal fun closed(source: RebasingDataSource) = open.remove(source)

    /**
     * How long a server request may wait on the network before it counts as
     * stalled. A full buffer doesn't count: the loader stops reading then,
     * so nothing waits. A server that went quiet without refusing is only
     * noticed this way, long before the read timeout gives up on it.
     */
    private const val STALL_MS = 3_000L

    private val watchdog = Executors.newSingleThreadScheduledExecutor { r ->
        Thread(r, "moonfin-server-stall").apply { isDaemon = true }
    }
    @Volatile private var watching: ScheduledFuture<*>? = null

    @Synchronized
    private fun watch() {
        if (watching != null) return
        watching = watchdog.scheduleWithFixedDelay(::checkStalls, 1, 1, TimeUnit.SECONDS)
    }

    @Synchronized
    private fun checkStalls() {
        if (open.isEmpty()) {
            watching?.cancel(false)
            watching = null
            return
        }
        val now = android.os.SystemClock.elapsedRealtime()
        for (source in open) {
            val origin = source.stalledSince(now, STALL_MS) ?: continue
            // Tells the app to ask the entry address where the server went.
            Media3Bridge.emitEvent(mapOf("event" to "serverStalled", "origin" to origin))
        }
    }

    internal fun originOf(uri: Uri): String? {
        val scheme = uri.scheme?.lowercase() ?: return null
        if (scheme != "http" && scheme != "https") return null
        val host = uri.host?.lowercase() ?: return null
        val port = if (uri.port != -1) uri.port else if (scheme == "https") 443 else 80
        return "$scheme://$host:$port"
    }
}

/** The data sources of [inner], with their requests going through [ServerRebase]. */
@OptIn(UnstableApi::class)
class RebasingDataSourceFactory(private val inner: DataSource.Factory) : DataSource.Factory {
    override fun createDataSource(): DataSource = RebasingDataSource(inner.createDataSource())
}

@OptIn(UnstableApi::class)
class RebasingDataSource(private val delegate: DataSource) : DataSource {
    @Volatile private var origin: String? = null
    @Volatile private var aborted = false
    @Volatile private var waitingSince = 0L
    @Volatile private var stallReported = false

    /** This source's origin when it has waited on the network past [limitMs] and wasn't reported yet. */
    internal fun stalledSince(now: Long, limitMs: Long): String? {
        val since = waitingSince
        if (since == 0L || stallReported || now - since < limitMs) return null
        stallReported = true
        return origin
    }

    internal fun isOn(old: String) = origin == old

    /**
     * Closes the connection from another thread so a read blocked on a server
     * that went quiet returns now. Whatever that throws on the loading thread
     * reaches the loader as a plain IOException, which it retries.
     */
    internal fun abort() {
        aborted = true
        try {
            delegate.close()
        } catch (_: Throwable) {
        }
    }

    override fun addTransferListener(transferListener: TransferListener) =
        delegate.addTransferListener(transferListener)

    override fun open(dataSpec: DataSpec): Long {
        aborted = false
        val uri = ServerRebase.rewrite(dataSpec.uri)
        val spec = if (uri == dataSpec.uri) dataSpec else dataSpec.withUri(uri)
        origin = ServerRebase.originOf(uri)
        ServerRebase.opened(this)
        return guarded { delegate.open(spec) }
    }

    override fun read(buffer: ByteArray, offset: Int, length: Int): Int =
        guarded { delegate.read(buffer, offset, length) }

    override fun getUri(): Uri? = delegate.uri

    override fun getResponseHeaders(): Map<String, List<String>> = delegate.responseHeaders

    override fun close() {
        ServerRebase.closed(this)
        origin = null
        try {
            delegate.close()
        } catch (t: Throwable) {
            if (!aborted) throw t
        }
    }

    private inline fun <T> guarded(block: () -> T): T {
        waitingSince = android.os.SystemClock.elapsedRealtime()
        try {
            val value = block()
            stallReported = false
            return value
        } catch (t: Throwable) {
            if (aborted) throw IOException("Server moved, asking its new address", t)
            throw t
        } finally {
            waitingSince = 0L
        }
    }
}
