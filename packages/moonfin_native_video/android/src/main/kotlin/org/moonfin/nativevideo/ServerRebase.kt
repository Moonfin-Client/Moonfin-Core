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
 * a load in flight would only fail after the read timeout. [Scope.rebase] maps
 * the old address to the new one for every later open of that player and cuts
 * its loads still on the old one. The loader takes that as a failed read and
 * asks again from the same byte, now on the new address, while playback runs
 * on from the buffer.
 */
@OptIn(UnstableApi::class)
object ServerRebase {
    private val open = Collections.newSetFromMap(ConcurrentHashMap<RebasingDataSource, Boolean>())

    /** A server's address as far as a move is concerned: where it answers and under which path. */
    internal class Base(val scheme: String, val authority: String, val origin: String, val path: String) {
        val key: String get() = origin + path

        /** Whether [url] is a request to this server: same origin, under its path. */
        fun covers(url: Address): Boolean =
            url.origin == origin &&
                (path.isEmpty() || url.path == path || url.path.startsWith("$path/"))
    }

    /** A request URL split at its authority, so a move can swap that and keep the rest as sent. */
    internal class Address(
        val scheme: String,
        val authority: String,
        val origin: String,
        val path: String,
        val rest: String,
    )

    /**
     * The moves one player follows. They belong to the source it plays: a new
     * source is built from the server's current address, so it drops them
     * (see [sourceSet]), and so do a stop and a release ([clear]). Another
     * player, or another server behind the same origin, never sees them.
     */
    class Scope {
        /** Each old address with where it leads now, longest path first. Replaced whole on change. */
        @Volatile private var moves: List<Pair<Base, Base>> = emptyList()
        /** The source URL the moves were made for. */
        @Volatile private var owner: String? = null

        /**
         * Sends this player's requests for the server at [from] to [to] and
         * cuts its loads still on [from]. [source] is the URL of the source
         * it plays. Returns how many loads it cut, or -1 when it installed no
         * mapping: an address that isn't http(s), no source, no change, or a
         * changed base path (the stream then has to be reopened from the new
         * address; only a move of host or port keeps the request paths).
         */
        @Synchronized
        fun rebase(from: String, to: String, source: String?): Int {
            if (source == null) return -1
            val old = baseOf(from) ?: return -1
            val new = baseOf(to) ?: return -1
            if (old.path != new.path || old.origin == new.origin) return -1
            val earlier = if (owner == source) moves else emptyList()
            owner = source
            // Earlier moves now lead to the newest address too.
            moves = (
                earlier
                    .filter { (was, _) -> was.key != old.key && was.key != new.key }
                    .map { (was, now) -> was to (if (now.key == old.key) new else now) } +
                    (old to new)
                ).sortedByDescending { it.first.path.length }
            var cut = 0
            for (load in open.toList()) {
                if (load.scope === this && load.isOn(old)) {
                    load.abort()
                    cut++
                }
            }
            return cut
        }

        /** [url] at the address its server moved to, or null when it didn't move. */
        fun rewrite(url: String): String? {
            val current = moves
            if (current.isEmpty()) return null
            val address = addressOf(url) ?: return null
            val to = current.firstOrNull { (was, _) -> was.covers(address) }?.second ?: return null
            return "${to.scheme}://${to.authority}${address.rest}"
        }

        /** The player loads [url]: moves made for another source end here. */
        @Synchronized
        fun sourceSet(url: String?) {
            if (url != owner) clear()
        }

        @Synchronized
        fun clear() {
            moves = emptyList()
            owner = null
        }

        /** Takes over the moves of [other], whose source this player carries on. */
        fun takeOver(other: Scope) {
            if (other === this) return
            val (taken, takenOwner) = synchronized(other) {
                val pair = other.moves to other.owner
                other.clear()
                pair
            }
            synchronized(this) {
                moves = taken
                owner = takenOwner
            }
        }
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

    /** A server address such as `https://host:8920/jellyfin`, with no trailing slash on its path. */
    internal fun baseOf(url: String): Base? {
        val address = addressOf(url.trim()) ?: return null
        return Base(address.scheme, address.authority, address.origin, address.path.trimEnd('/'))
    }

    /**
     * Splits an http(s) [url] without decoding it. Null for anything else, or
     * one without a host.
     */
    internal fun addressOf(url: String): Address? {
        val sep = url.indexOf("://")
        if (sep <= 0) return null
        val scheme = url.substring(0, sep).lowercase()
        if (scheme != "http" && scheme != "https") return null
        val start = sep + 3
        var end = start
        while (end < url.length && url[end] != '/' && url[end] != '?' && url[end] != '#') end++
        val authority = url.substring(start, end)
        val hostPort = authority.substringAfterLast('@')
        val host: String
        val portText: String?
        if (hostPort.startsWith("[")) {
            val close = hostPort.indexOf(']')
            if (close < 0) return null
            host = hostPort.substring(0, close + 1)
            portText = hostPort.substring(close + 1).removePrefix(":").ifEmpty { null }
        } else {
            val colon = hostPort.lastIndexOf(':')
            host = if (colon >= 0) hostPort.substring(0, colon) else hostPort
            portText = if (colon >= 0) hostPort.substring(colon + 1).ifEmpty { null } else null
        }
        if (host.isEmpty()) return null
        val port = if (portText != null) {
            portText.toIntOrNull() ?: return null
        } else if (scheme == "https") 443 else 80
        val rest = url.substring(end)
        var pathEnd = 0
        while (pathEnd < rest.length && rest[pathEnd] != '?' && rest[pathEnd] != '#') pathEnd++
        return Address(
            scheme = scheme,
            authority = authority,
            origin = "$scheme://${host.lowercase()}:$port",
            path = rest.substring(0, pathEnd),
            rest = rest,
        )
    }
}

/** The data sources of [inner], with their requests following the moves of [scope]. */
@OptIn(UnstableApi::class)
class RebasingDataSourceFactory(
    private val inner: DataSource.Factory,
    private val scope: ServerRebase.Scope,
) : DataSource.Factory {
    override fun createDataSource(): DataSource = RebasingDataSource(inner.createDataSource(), scope)
}

@OptIn(UnstableApi::class)
class RebasingDataSource(
    private val delegate: DataSource,
    internal val scope: ServerRebase.Scope,
) : DataSource {
    @Volatile private var address: ServerRebase.Address? = null
    @Volatile private var aborted = false
    @Volatile private var waitingSince = 0L
    @Volatile private var stallReported = false

    /** This source's origin when it has waited on the network past [limitMs] and wasn't reported yet. */
    internal fun stalledSince(now: Long, limitMs: Long): String? {
        val since = waitingSince
        if (since == 0L || stallReported || now - since < limitMs) return null
        stallReported = true
        return address?.origin
    }

    internal fun isOn(base: ServerRebase.Base) = address?.let(base::covers) == true

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
        val moved = scope.rewrite(dataSpec.uri.toString())
        val spec = if (moved == null) dataSpec else dataSpec.withUri(Uri.parse(moved))
        address = ServerRebase.addressOf(spec.uri.toString())
        ServerRebase.opened(this)
        return guarded { delegate.open(spec) }
    }

    override fun read(buffer: ByteArray, offset: Int, length: Int): Int =
        guarded { delegate.read(buffer, offset, length) }

    override fun getUri(): Uri? = delegate.uri

    override fun getResponseHeaders(): Map<String, List<String>> = delegate.responseHeaders

    override fun close() {
        ServerRebase.closed(this)
        address = null
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
