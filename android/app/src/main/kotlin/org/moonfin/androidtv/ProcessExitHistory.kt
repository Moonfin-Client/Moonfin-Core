package org.moonfin.androidtv

import android.app.ActivityManager
import android.app.ApplicationExitInfo
import android.content.Context
import android.os.Build
import androidx.annotation.RequiresApi
import org.moonfin.nativevideo.PlatformViewCensus

/**
 * Lets the next launch say how this one ended. Android keeps a short state
 * summary with each process's exit record, so the app hands it what is on
 * screen and which platform views are alive, and a native crash, which takes
 * the process down before Dart can log anything, still leaves that behind.
 */
class ProcessExitHistory private constructor(private val context: Context) {

    companion object {
        private const val PREFS = "moonfin_process_exits"
        private const val KEY_LAST_REPORTED = "last_reported_ms"
        private const val FIRST_RUN_LOOKBACK_MS = 7L * 24 * 60 * 60 * 1000
        private const val MAX_REPORTED = 5

        @Volatile private var instance: ProcessExitHistory? = null

        /** One per process, so an activity recreation keeps the state it was given. */
        fun get(context: Context): ProcessExitHistory = instance ?: synchronized(this) {
            instance ?: ProcessExitHistory(context.applicationContext).also { instance = it }
        }
    }

    private val activityManager = context.getSystemService(ActivityManager::class.java)
    private val prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)

    @Volatile private var appState = "starting"
    @Volatile private var views = PlatformViewCensus.describe()

    init {
        PlatformViewCensus.listener = { summary ->
            views = summary
            publish()
        }
        publish()
    }

    fun setAppState(state: String) {
        appState = state
        publish()
    }

    private fun publish() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return
        runCatching { activityManager?.setProcessStateSummary(processStateSummary(appState, views)) }
    }

    /** The exits worth reporting since the last call, oldest first. */
    fun takeUnreportedExits(): List<Map<String, Any?>> {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return emptyList()
        val manager = activityManager ?: return emptyList()
        val since = prefs.getLong(KEY_LAST_REPORTED, System.currentTimeMillis() - FIRST_RUN_LOOKBACK_MS)
        val exits = runCatching { manager.getHistoricalProcessExitReasons(context.packageName, 0, 0) }
            .getOrDefault(emptyList())
            .filter {
                it.processName == context.packageName &&
                    it.timestamp > since &&
                    isWorthReporting(it.reason, it.importance)
            }
            .sortedBy { it.timestamp }
            .takeLast(MAX_REPORTED)
        exits.lastOrNull()?.let { prefs.edit().putLong(KEY_LAST_REPORTED, it.timestamp).apply() }
        return exits.map(::describe)
    }

    @RequiresApi(Build.VERSION_CODES.R)
    private fun describe(info: ApplicationExitInfo): Map<String, Any?> {
        val tombstone = if (info.reason == REASON_CRASH_NATIVE) tombstoneOf(info) else null
        return mapOf(
            "timestampMs" to info.timestamp,
            "reason" to exitReasonName(info.reason),
            "importance" to importanceName(info.importance),
            "signal" to info.status.takeIf {
                info.reason == REASON_CRASH_NATIVE || info.reason == REASON_SIGNALED
            },
            "pssKb" to info.pss,
            "rssKb" to info.rss,
            "description" to info.description,
            "state" to info.processStateSummary?.toString(Charsets.UTF_8),
            "mainThread" to if (info.reason == REASON_ANR) anrMainThread(info) else null,
            "abortMessage" to tombstone?.abortMessage,
            "crashThread" to tombstone?.threadName,
            "frames" to tombstone?.frames,
            "crashLogs" to tombstone?.errorLogs,
        )
    }

    @RequiresApi(Build.VERSION_CODES.R)
    private fun anrMainThread(info: ApplicationExitInfo): String? = runCatching {
        info.traceInputStream?.bufferedReader()?.use { mainThreadStack(it.lineSequence()) }
    }.getOrNull()

    /** Android 12 and later keep the tombstone with a native crash's record. */
    @RequiresApi(Build.VERSION_CODES.R)
    private fun tombstoneOf(info: ApplicationExitInfo): TombstoneSummary? = runCatching {
        info.traceInputStream?.use { readTombstone(it.readBytes()) }
    }.getOrNull()
}
