package org.moonfin.androidtv

import android.app.ActivityManager
import android.content.Context
import android.os.Build
import androidx.work.BackoffPolicy
import androidx.work.Constraints
import androidx.work.CoroutineWorker
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkerParameters
import com.bbflight.background_downloader.BDPlugin
import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin
import com.github.dart_lang.jni.JniPlugin
import com.github.dart_lang.jni_flutter.JniFlutterPlugin
import com.it_nomads.fluttersecurestorage.FlutterSecureStoragePlugin
import com.ryanheise.audioservice.AudioServicePlugin
import dev.fluttercommunity.plus.connectivity.ConnectivityPlugin
import dev.fluttercommunity.plus.device_info.DeviceInfoPlusPlugin
import dev.fluttercommunity.plus.packageinfo.PackageInfoPlugin
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.NonCancellable
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeoutOrNull
import org.moonfin.androidtv.AutoDownloadRefreshPolicy.Outcome

/**
 * Periodic check for new episodes of followed series while the app is not
 * in front. Mirrors the iOS Background App Refresh task: the same Dart
 * handler answers `performRefresh` on the app's engine when the process is
 * alive, and otherwise a headless engine (see [WatchNextWorker]) runs the
 * `autoDownloadBackgroundMain` entrypoint. Transfers the check queues run
 * in background_downloader's foreground service and outlive both.
 */
class AutoDownloadWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        // A foregrounded app already checks on its own.
        if (isAppInForeground()) return Result.success()
        // A live but backgrounded engine is asked directly, which spares the
        // main thread a second engine and background_downloader a second
        // start. The app engine belongs to audio_service and can outlive the
        // Activity while the media service plays; the cache is the one place
        // that knows whether it exists. Never ask the plugin for it: that
        // would create one.
        val liveEngine = FlutterEngineCache.getInstance()
            .get(AudioServicePlugin.getFlutterEngineId())
        return if (liveEngine != null) refreshOnLiveEngine(liveEngine) else refreshHeadless()
    }

    private suspend fun refreshOnLiveEngine(engine: FlutterEngine): Result {
        val done = CompletableDeferred<Boolean>()
        try {
            withContext(Dispatchers.Main) {
                MethodChannel(engine.dartExecutor.binaryMessenger, REFRESH_CHANNEL).invokeMethod(
                    "performRefresh",
                    mapOf("budgetSeconds" to AutoDownloadRefreshPolicy.BUDGET_SECONDS),
                    object : MethodChannel.Result {
                        override fun success(result: Any?) {
                            done.complete(result == true)
                        }

                        override fun error(code: String, message: String?, details: Any?) {
                            done.complete(false)
                        }

                        // The Dart handler isn't bound yet; like iOS, retry later.
                        override fun notImplemented() {
                            done.cancel()
                        }
                    },
                )
            }
        } catch (e: CancellationException) {
            throw e
        } catch (e: Exception) {
            // The engine went away between the cache read and the send
            // (app swiped away): run the check without it.
            return refreshHeadless()
        }
        val ok = withTimeoutOrNull(AutoDownloadRefreshPolicy.TIMEOUT_MS) {
            runCatching { done.await() }.getOrNull()
        }
        return toResult(ok, permanent = false)
    }

    private suspend fun refreshHeadless(): Result {
        val done = CompletableDeferred<Boolean>()
        var permanentFailure = false
        var engine: FlutterEngine? = null

        try {
            withContext(Dispatchers.Main) {
                val loader = FlutterInjector.instance().flutterLoader()
                if (!loader.initialized()) {
                    loader.startInitialization(applicationContext)
                    loader.ensureInitializationComplete(applicationContext, null)
                }

                // Only what the check touches. Never audio_service: it binds
                // its media service on attach and boots the whole app.
                val flutterEngine = FlutterEngine(applicationContext, null, false)
                engine = flutterEngine
                flutterEngine.plugins.add(SharedPreferencesPlugin())
                flutterEngine.plugins.add(PackageInfoPlugin())
                flutterEngine.plugins.add(DeviceInfoPlusPlugin())
                // path_provider is JNI-based: the database path, the
                // downloads root and background_downloader's own store need
                // these two.
                flutterEngine.plugins.add(JniPlugin())
                flutterEngine.plugins.add(JniFlutterPlugin())
                // Token fallback while restoring the saved sign-in.
                flutterEngine.plugins.add(FlutterSecureStoragePlugin())
                // The Wi-Fi-only check.
                flutterEngine.plugins.add(ConnectivityPlugin())
                // The transfers themselves.
                flutterEngine.plugins.add(BDPlugin())
                // Legacy-engine fallbacks post their own notifications.
                flutterEngine.plugins.add(FlutterLocalNotificationsPlugin())

                MethodChannel(
                    flutterEngine.dartExecutor.binaryMessenger,
                    MediaStoreHelper.CHANNEL,
                ).setMethodCallHandler(MediaStoreHelper(applicationContext))
                // Free-space checks before an episode is queued.
                MethodChannel(
                    flutterEngine.dartExecutor.binaryMessenger,
                    DeviceStorageHelper.CHANNEL,
                ).setMethodCallHandler(DeviceStorageHelper())

                MethodChannel(
                    flutterEngine.dartExecutor.binaryMessenger,
                    CHANNEL,
                ).setMethodCallHandler { call, result ->
                    when (call.method) {
                        "getBudget" -> result.success(AutoDownloadRefreshPolicy.BUDGET_SECONDS)
                        "backgroundComplete" -> {
                            val ok = call.argument<Boolean>("ok") ?: false
                            permanentFailure =
                                call.argument<Boolean>("permanent") ?: false
                            result.success(null)
                            done.complete(ok)
                        }
                        else -> result.notImplemented()
                    }
                }

                flutterEngine.dartExecutor.executeDartEntrypoint(
                    DartExecutor.DartEntrypoint(
                        loader.findAppBundlePath(),
                        "autoDownloadBackgroundMain",
                    ),
                )
            }

            val ok = withTimeoutOrNull(AutoDownloadRefreshPolicy.TIMEOUT_MS) { done.await() }
            return toResult(ok, permanentFailure)
        } catch (e: CancellationException) {
            throw e
        } catch (e: Exception) {
            return toResult(ok = false, permanent = false)
        } finally {
            // Also when WorkManager stopped this run: a cancelled scope
            // would otherwise skip the block and leak the engine.
            withContext(NonCancellable + Dispatchers.Main) {
                runCatching { engine?.destroy() }
            }
        }
    }

    private fun toResult(ok: Boolean?, permanent: Boolean): Result =
        when (AutoDownloadRefreshPolicy.outcome(ok, permanent, runAttemptCount)) {
            Outcome.SUCCESS -> Result.success()
            Outcome.RETRY -> Result.retry()
            // Ends this run only. Result.failure() would retire the periodic
            // request, leaving no next run to recover in.
            Outcome.GIVE_UP -> Result.success()
        }

    companion object {
        /** Headless engine <-> worker. */
        const val CHANNEL = "org.moonfin.androidtv/auto_download"

        /** Shared with iOS: the app's Dart side binds `performRefresh` here. */
        const val REFRESH_CHANNEL = "com.moonfin/background_refresh"

        fun schedule(context: Context, wifiOnly: Boolean) {
            WorkManager.getInstance(context).enqueueUniquePeriodicWork(
                AutoDownloadRefreshPolicy.UNIQUE_NAME,
                // Keeps the period's timing and applies changed constraints
                // (Wi-Fi only) from the next run.
                ExistingPeriodicWorkPolicy.UPDATE,
                PeriodicWorkRequestBuilder<AutoDownloadWorker>(
                    AutoDownloadRefreshPolicy.INTERVAL_HOURS,
                    TimeUnit.HOURS,
                )
                    .setInitialDelay(
                        AutoDownloadRefreshPolicy.INITIAL_DELAY_MINUTES,
                        TimeUnit.MINUTES,
                    )
                    .setConstraints(
                        Constraints.Builder()
                            .setRequiredNetworkType(AutoDownloadRefreshPolicy.networkTypeFor(wifiOnly))
                            .setRequiresBatteryNotLow(true)
                            .setRequiresStorageNotLow(true)
                            .build(),
                    )
                    .setBackoffCriteria(
                        BackoffPolicy.LINEAR,
                        AutoDownloadRefreshPolicy.BACKOFF_MINUTES,
                        TimeUnit.MINUTES,
                    )
                    .build(),
            )
        }

        fun cancel(context: Context) {
            WorkManager.getInstance(context)
                .cancelUniqueWork(AutoDownloadRefreshPolicy.UNIQUE_NAME)
        }

        /**
         * `restricted` when the user forbade background usage for the app
         * (the one setting that stops WorkManager), else `available`.
         * Battery optimisation only delays runs, so it is not reported.
         */
        fun refreshStatus(context: Context): String {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.P) return "available"
            val manager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
            return if (manager.isBackgroundRestricted) "restricted" else "available"
        }
    }
}
