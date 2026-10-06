package org.moonfin.nativevideo

/**
 * The plugin's platform views that are alive right now, by kind. Flutter
 * composes each one with hybrid composition, which is where some TV GPU
 * drivers crash, so the app keeps this next to the record of how its process
 * ended.
 */
object PlatformViewCensus {
    private val counts = mutableMapOf<String, Int>()

    /** Called with [describe]'s answer every time a view joins or leaves. */
    @Volatile
    var listener: ((String) -> Unit)? = null

    /** Counts a view of [kind] until the returned call, which only counts once. */
    fun join(kind: String): () -> Unit {
        change(kind, 1)
        var left = false
        return {
            if (!left) {
                left = true
                change(kind, -1)
            }
        }
    }

    fun describe(): String = synchronized(counts) { describeViews(counts) }

    private fun change(kind: String, by: Int) {
        val summary = synchronized(counts) {
            val count = (counts[kind] ?: 0) + by
            if (count > 0) counts[kind] = count else counts.remove(kind)
            describeViews(counts)
        }
        listener?.invoke(summary)
    }
}

/** "none", or each kind in name order, with a count when there's more than one. */
internal fun describeViews(counts: Map<String, Int>): String =
    if (counts.isEmpty()) {
        "none"
    } else {
        counts.toSortedMap().entries.joinToString(",") { (kind, count) ->
            if (count == 1) kind else "$kind*$count"
        }
    }
