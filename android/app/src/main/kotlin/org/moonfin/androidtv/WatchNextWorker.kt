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
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
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

        val done = CompletableDeferred<Boolean>()
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

                // FlutterEngine(context) already registers all generated plugins;
                // do not call GeneratedPluginRegistrant.registerWith() again.
                val flutterEngine = FlutterEngine(applicationContext)
                engine = flutterEngine

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
            return if (ok == true) Result.success() else Result.retry()
        } catch (e: Exception) {
            return Result.retry()
        } finally {
            withContext(Dispatchers.Main) {
                runCatching { engine?.destroy() }
            }
            ioScope.cancel()
        }
    }

    companion object {
        const val CHANNEL = "org.moonfin.androidtv/watch_next"
        private const val UNIQUE_NAME = "watch_next_refresh"
        private const val TIMEOUT_MS = 90_000L

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
