package org.moonfin.androidtv

import androidx.work.NetworkType

/**
 * The decisions behind [AutoDownloadWorker], kept free of the Android
 * runtime so plain JVM tests cover them.
 */
internal object AutoDownloadRefreshPolicy {
    const val UNIQUE_NAME = "auto_download_refresh"

    /** Matches the earliest interval the iOS scheduler asks for. */
    const val INTERVAL_HOURS = 4L

    /** Keeps the first background engine from racing app startup. */
    const val INITIAL_DELAY_MINUTES = 15L
    const val BACKOFF_MINUTES = 10L

    /** What Dart may spend on one check; transfers it queues run on. */
    const val BUDGET_SECONDS = 60

    /**
     * Safety net well past the budget: Dart only checks the budget between
     * series, and a stalled request inside one runs to the client's own
     * timeout. Cutting the engine there would just repeat the cold start.
     */
    const val TIMEOUT_MS = 240_000L
    const val MAX_RETRY_ATTEMPTS = 3

    fun networkTypeFor(wifiOnly: Boolean): NetworkType =
        if (wifiOnly) NetworkType.UNMETERED else NetworkType.CONNECTED

    enum class Outcome { SUCCESS, RETRY, GIVE_UP }

    /**
     * [ok] is Dart's answer, null when none came in time (handler not bound
     * yet, or the check overran). [permanent] is Dart saying retrying can't
     * help (nobody signed in), so the run counts as done. Past the cap the
     * run gives up, which still leaves the schedule intact.
     */
    fun outcome(ok: Boolean?, permanent: Boolean, attempt: Int): Outcome = when {
        ok == true -> Outcome.SUCCESS
        permanent -> Outcome.SUCCESS
        attempt >= MAX_RETRY_ATTEMPTS -> Outcome.GIVE_UP
        else -> Outcome.RETRY
    }
}
