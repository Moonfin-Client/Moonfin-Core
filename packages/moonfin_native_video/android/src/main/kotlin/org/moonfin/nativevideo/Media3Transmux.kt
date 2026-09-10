package org.moonfin.nativevideo

import android.content.Context
import android.os.Build
import android.os.Handler
import android.os.Looper
import androidx.media3.common.MediaItem
import androidx.media3.common.util.Clock
import androidx.media3.common.util.UnstableApi
import androidx.media3.datasource.DefaultDataSource
import androidx.media3.datasource.DefaultHttpDataSource
import androidx.media3.exoplayer.source.DefaultMediaSourceFactory
import androidx.media3.transformer.Composition
import androidx.media3.transformer.DefaultDecoderFactory
import androidx.media3.transformer.ExoPlayerAssetLoader
import androidx.media3.transformer.ExportException
import androidx.media3.transformer.ExportResult
import androidx.media3.transformer.Transformer
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File

/** Parsed and validated arguments of a `start` call. */
internal data class TransmuxStartArgs(
    val taskId: String,
    val url: String,
    val headers: Map<String, String>,
    val outputPath: String,
    val allowUntrustedTls: Boolean,
)

internal fun parseTransmuxStartArgs(raw: Any?): TransmuxStartArgs? {
    val map = raw as? Map<*, *> ?: return null
    val taskId = map["taskId"] as? String ?: return null
    val url = map["url"] as? String ?: return null
    val outputPath = map["outputPath"] as? String ?: return null
    if (taskId.isBlank() || url.isBlank() || outputPath.isBlank()) return null
    val headers = buildMap {
        (map["headers"] as? Map<*, *>)?.forEach { (key, value) ->
            if (key is String && value is String) put(key, value)
        }
    }
    return TransmuxStartArgs(
        taskId = taskId,
        url = url,
        headers = headers,
        outputPath = outputPath,
        allowUntrustedTls = map["allowUntrustedTls"] as? Boolean ?: false,
    )
}

internal fun transmuxProgressEvent(taskId: String, bytesWritten: Long): Map<String, Any?> =
    mapOf("event" to "progress", "taskId" to taskId, "bytesWritten" to bytesWritten)

internal fun transmuxCompleteEvent(
    taskId: String,
    videoConversionProcess: Int,
    audioConversionProcess: Int,
): Map<String, Any?> = mapOf(
    "event" to "complete",
    "taskId" to taskId,
    "videoConversionProcess" to videoConversionProcess,
    "audioConversionProcess" to audioConversionProcess,
)

internal fun transmuxErrorEvent(taskId: String, message: String, errorCode: Int): Map<String, Any?> =
    mapOf("event" to "error", "taskId" to taskId, "message" to message, "errorCode" to errorCode)

internal fun transmuxCancelledEvent(taskId: String): Map<String, Any?> =
    mapOf("event" to "cancelled", "taskId" to taskId)

/**
 * Rewrites a live transcode into a seekable file as it downloads.
 *
 * The server pipes ffmpeg output, so a transcoded download arrives as a
 * fragmented MP4 with no sidx. Media3's extractor reads that as unseekable
 * and the player answers every seek with position zero. Passing the stream
 * through Transformer instead writes a normal MP4 whose moov carries the
 * full sample table, and because the codecs were chosen server-side to fit
 * the container the samples pass straight through without a re-encode.
 *
 * One job runs at a time. Progress is the output file's size: the input has
 * no usable duration (empty_moov reads as zero), which leaves Transformer's
 * own progress permanently unavailable.
 */
@UnstableApi
object Media3Transmux {
    private val mainHandler = Handler(Looper.getMainLooper())
    private var eventSink: EventChannel.EventSink? = null

    private class ActiveJob(
        val taskId: String,
        val transformer: Transformer,
        val outputFile: File,
        var progressRunnable: Runnable? = null,
    )

    private var active: ActiveJob? = null

    fun setEventSink(sink: EventChannel.EventSink?) {
        mainHandler.post {
            eventSink = sink
        }
    }

    // A background engine's teardown must not sever the foreground engine's
    // stream, so only the sink's own registrar can drop it.
    fun clearEventSink(sink: EventChannel.EventSink?) {
        mainHandler.post {
            if (eventSink === sink) {
                eventSink = null
            }
        }
    }

    private fun emitEvent(event: Map<String, Any?>) {
        mainHandler.post {
            eventSink?.success(event)
        }
    }

    fun handleMethodCall(call: MethodCall, result: MethodChannel.Result, context: Context?) {
        when (call.method) {
            "start" -> {
                if (context == null) {
                    result.error("NO_CONTEXT", "Plugin is not attached", null)
                    return
                }
                val args = parseTransmuxStartArgs(call.arguments)
                if (args == null) {
                    result.error("BAD_ARGS", "Missing or invalid start arguments", null)
                    return
                }
                start(args, result, context)
            }
            "cancel" -> {
                val taskId = (call.arguments as? Map<*, *>)?.get("taskId") as? String
                cancel(taskId)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun start(args: TransmuxStartArgs, result: MethodChannel.Result, context: Context) {
        // MediaMuxer only takes HEVC from API 24. Below that Transformer would
        // quietly re-encode on-device, which a phone this old can't sustain.
        if (Build.VERSION.SDK_INT < 24) {
            result.error("TRANSMUX_UNSUPPORTED", "Requires Android 7.0 or newer", null)
            return
        }
        if (active != null) {
            result.error("TRANSMUX_BUSY", "A transmux job is already running", null)
            return
        }

        // Transformer opens the stream itself, so the trust setting has to be
        // armed here. Playback may not have pushed it yet this session.
        InsecureTls.setAllowed(args.allowUntrustedTls)

        val outputFile = File(args.outputPath)
        val httpFactory = DefaultHttpDataSource.Factory()
            .setDefaultRequestProperties(args.headers)
            .setAllowCrossProtocolRedirects(true)
            .setConnectTimeoutMs(120_000)
            // Also the stalled-transcode guard: a server encode that stops
            // feeding the connection for this long fails the job.
            .setReadTimeoutMs(120_000)
        val dataSourceFactory = DefaultDataSource.Factory(context, httpFactory)
        val assetLoaderFactory = ExoPlayerAssetLoader.Factory(
            context,
            DefaultDecoderFactory.Builder(context).build(),
            Clock.DEFAULT,
            DefaultMediaSourceFactory(dataSourceFactory),
        )

        val transformer = Transformer.Builder(context)
            .setAssetLoaderFactory(assetLoaderFactory)
            .addListener(object : Transformer.Listener {
                override fun onCompleted(composition: Composition, exportResult: ExportResult) {
                    val job = active?.takeIf { it.taskId == args.taskId } ?: return
                    stopProgress(job)
                    active = null
                    emitEvent(
                        transmuxCompleteEvent(
                            taskId = job.taskId,
                            videoConversionProcess = exportResult.videoConversionProcess,
                            audioConversionProcess = exportResult.audioConversionProcess,
                        ),
                    )
                }

                override fun onError(
                    composition: Composition,
                    exportResult: ExportResult,
                    exportException: ExportException,
                ) {
                    val job = active?.takeIf { it.taskId == args.taskId } ?: return
                    stopProgress(job)
                    active = null
                    job.outputFile.delete()
                    emitEvent(
                        transmuxErrorEvent(
                            taskId = job.taskId,
                            message = exportException.message ?: "Transmux failed",
                            errorCode = exportException.errorCode,
                        ),
                    )
                }
            })
            .build()

        val job = ActiveJob(args.taskId, transformer, outputFile)
        try {
            transformer.start(MediaItem.fromUri(args.url), args.outputPath)
        } catch (e: Exception) {
            outputFile.delete()
            result.error("TRANSMUX_START_FAILED", e.message, null)
            return
        }
        active = job
        startProgress(job)
        result.success(null)
    }

    private fun cancel(taskId: String?) {
        mainHandler.post {
            val job = active ?: return@post
            if (taskId != null && job.taskId != taskId) return@post
            stopProgress(job)
            active = null
            // cancel() leaves the partial output on disk, so it goes here.
            job.transformer.cancel()
            job.outputFile.delete()
            emitEvent(transmuxCancelledEvent(job.taskId))
        }
    }

    private fun startProgress(job: ActiveJob) {
        val runnable = object : Runnable {
            override fun run() {
                emitEvent(transmuxProgressEvent(job.taskId, job.outputFile.length()))
                mainHandler.postDelayed(this, 500L)
            }
        }
        job.progressRunnable = runnable
        mainHandler.post(runnable)
    }

    private fun stopProgress(job: ActiveJob) {
        job.progressRunnable?.let { mainHandler.removeCallbacks(it) }
        job.progressRunnable = null
    }
}
