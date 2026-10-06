package org.moonfin.androidtv

// Kept free of Android imports so these run under plain JVM tests. The values
// match ApplicationExitInfo's reason and ActivityManager's importance codes.

internal const val REASON_SIGNALED = 2
internal const val REASON_LOW_MEMORY = 3
internal const val REASON_CRASH = 4
internal const val REASON_CRASH_NATIVE = 5
internal const val REASON_ANR = 6
internal const val REASON_INITIALIZATION_FAILURE = 7
internal const val REASON_EXCESSIVE_RESOURCE_USAGE = 9

private const val IMPORTANCE_FOREGROUND = 100
private const val IMPORTANCE_VISIBLE = 200

/** The most Android keeps of a process state summary. */
internal const val MAX_PROCESS_STATE_BYTES = 128

/**
 * Whether an exit means something went wrong. A crash, an ANR or a failed
 * start always does. A low memory or signal kill only does while the app was
 * on screen, since the system reclaims apps in the background all the time.
 */
internal fun isWorthReporting(reason: Int, importance: Int): Boolean = when (reason) {
    REASON_CRASH,
    REASON_CRASH_NATIVE,
    REASON_ANR,
    REASON_INITIALIZATION_FAILURE,
    REASON_EXCESSIVE_RESOURCE_USAGE,
    -> true
    REASON_LOW_MEMORY, REASON_SIGNALED -> importance <= IMPORTANCE_VISIBLE
    else -> false
}

internal fun exitReasonName(reason: Int): String = when (reason) {
    REASON_SIGNALED -> "signal"
    REASON_LOW_MEMORY -> "low memory"
    REASON_CRASH -> "crash"
    REASON_CRASH_NATIVE -> "native crash"
    REASON_ANR -> "ANR"
    REASON_INITIALIZATION_FAILURE -> "failed start"
    REASON_EXCESSIVE_RESOURCE_USAGE -> "excessive resource use"
    else -> "reason $reason"
}

internal fun importanceName(importance: Int): String = when {
    importance <= IMPORTANCE_FOREGROUND -> "foreground"
    importance <= IMPORTANCE_VISIBLE -> "visible"
    else -> "background"
}

/**
 * The views first, so a long route is what gets cut when the summary runs
 * past what Android keeps.
 */
internal fun processStateSummary(appState: String, views: String): ByteArray {
    val bytes = "hc=$views $appState".trim().toByteArray(Charsets.UTF_8)
    return if (bytes.size <= MAX_PROCESS_STATE_BYTES) bytes else bytes.copyOf(MAX_PROCESS_STATE_BYTES)
}

/** The main thread's stack from an ANR trace, up to [maxLines] lines. */
internal fun mainThreadStack(trace: Sequence<String>, maxLines: Int = 40): String? {
    val lines = trace
        .dropWhile { !it.startsWith("\"main\"") }
        .takeWhile { it.isNotBlank() }
        .take(maxLines)
        .toList()
    return if (lines.isEmpty()) null else lines.joinToString("\n")
}
