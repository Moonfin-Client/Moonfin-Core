package org.moonfin.androidtv

import android.content.Context
import android.os.Build
import androidx.work.BackoffPolicy
import androidx.work.Constraints
import androidx.work.CoroutineWorker
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.NetworkType
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkerParameters
import dev.fluttercommunity.plus.device_info.DeviceInfoPlusPlugin
import dev.fluttercommunity.plus.packageinfo.PackageInfoPlugin
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.coroutines.withTimeoutOrNull

class WatchNextWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return Result.success()
        if (!isTelevision(applicationContext)) return Result.success()
        // While the app is foregrounded, WatchNextService.update() already
        // publishes through MainActivity's channel, so this run would only
        // duplicate that -- at the cost of building and destroying a second
        // FlutterEngine on the main thread (see the Dispatchers.Main blocks
        // below), which on Android is the same thread that drives the UI.
        // Skipping loses nothing for the same reason, and it keeps the periodic
        // schedule intact -- retrying here would instead re-poke the process on
        // the backoff interval for as long as the app stays open.
        if (isAppInForeground()) return Result.success()

        val done = CompletableDeferred<Boolean>()
        // Set when Dart reports a failure that retrying can't fix, so the
        // worker doesn't boot a Flutter engine on every backoff.
        var permanentFailure = false
        val publisher = WatchNextPublisher(applicationContext)
        val channelPublisher = PreviewChannelPublisher(applicationContext)
        val ioScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)
        var engine: FlutterEngine? = null

        try {
            withContext(Dispatchers.Main) {
                val loader = FlutterInjector.instance().flutterLoader()
                if (!loader.initialized()) {
                    loader.startInitialization(applicationContext)
                    loader.ensureInitializationComplete(applicationContext, null)
                }

                // Registering every plugin would pull in audio_service, which
                // binds its media service as soon as it attaches and boots the
                // whole app headless. Only what the refresh reads is attached.
                val flutterEngine = FlutterEngine(applicationContext, null, false)
                engine = flutterEngine
                flutterEngine.plugins.add(SharedPreferencesPlugin())
                flutterEngine.plugins.add(PackageInfoPlugin())
                flutterEngine.plugins.add(DeviceInfoPlusPlugin())

                MethodChannel(
                    flutterEngine.dartExecutor.binaryMessenger,
                    CHANNEL,
                ).setMethodCallHandler { call, result ->
                    when (call.method) {
                        "publish" -> {
                            @Suppress("UNCHECKED_CAST")
                            val items =
                                call.argument<List<Map<String, Any?>>>("items") ?: emptyList()
                            ioScope.launch {
                                publisher.publishNow(items)
                                withContext(Dispatchers.Main) { result.success(null) }
                            }
                        }
                        "clear" -> {
                            ioScope.launch {
                                publisher.clearNow()
                                withContext(Dispatchers.Main) { result.success(null) }
                            }
                        }
                        "publishChannels" -> {
                            @Suppress("UNCHECKED_CAST")
                            val channels = call.argument<List<Map<String, Any?>>>("channels")
                                ?: emptyList()
                            ioScope.launch {
                                channelPublisher.publishChannelsNow(channels)
                                withContext(Dispatchers.Main) { result.success(null) }
                            }
                        }
                        "clearChannels" -> {
                            ioScope.launch {
                                channelPublisher.clearChannelsNow()
                                withContext(Dispatchers.Main) { result.success(null) }
                            }
                        }
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
                        "watchNextBackgroundMain",
                    ),
                )
            }

            val ok = withTimeoutOrNull(TIMEOUT_MS) { done.await() }
            return when {
                ok == true -> Result.success()
                // Nothing to publish, and waiting won't change that, so let
                // the next scheduled run try again instead of retrying now.
                permanentFailure -> Result.success()
                else -> retryOrFail()
            }
        } catch (e: Exception) {
            return retryOrFail()
        } finally {
            withContext(Dispatchers.Main) {
                runCatching { engine?.destroy() }
            }
            ioScope.cancel()
        }
    }

    // Gives up after a few attempts so a failing refresh can't retry forever.
    private fun retryOrFail(): Result =
        if (runAttemptCount >= MAX_RETRY_ATTEMPTS) Result.failure() else Result.retry()

    companion object {
        const val CHANNEL = "org.moonfin.androidtv/watch_next"
        private const val UNIQUE_NAME = "watch_next_refresh"
        private const val TIMEOUT_MS = 90_000L
        private const val MAX_RETRY_ATTEMPTS = 3

        fun schedule(context: Context) {
            WorkManager.getInstance(context).enqueueUniquePeriodicWork(
                UNIQUE_NAME,
                ExistingPeriodicWorkPolicy.KEEP,
                PeriodicWorkRequestBuilder<WatchNextWorker>(1, TimeUnit.HOURS)
                    // The delay keeps the background engine from racing app
                    // startup; the foreground app publishes directly.
                    .setInitialDelay(15, TimeUnit.MINUTES)
                    .setConstraints(
                        Constraints.Builder()
                            .setRequiredNetworkType(NetworkType.CONNECTED)
                            .build(),
                    )
                    .setBackoffCriteria(BackoffPolicy.LINEAR, 10, TimeUnit.MINUTES)
                    .build(),
            )
        }

        fun cancel(context: Context) {
            WorkManager.getInstance(context).cancelUniqueWork(UNIQUE_NAME)
        }

        fun runNow(context: Context) {
            WorkManager.getInstance(context)
                .enqueue(OneTimeWorkRequestBuilder<WatchNextWorker>().build())
        }
    }
}
