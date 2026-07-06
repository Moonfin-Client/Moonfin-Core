package org.moonfin.nativevideo

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeVideoPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, EventChannel.StreamHandler {
    private var media3ControlChannel: MethodChannel? = null
    private var media3EventsChannel: EventChannel? = null
    private var media3ActivityChannel: MethodChannel? = null
    private var applicationContext: Context? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        applicationContext = binding.applicationContext

        binding.platformViewRegistry.registerViewFactory(
            "moonfin/native_video",
            NativeVideoFactory(binding.binaryMessenger),
        )

        binding.platformViewRegistry.registerViewFactory(
            "moonfin/media3_video",
            Media3VideoFactory(),
        )

        media3ControlChannel = MethodChannel(
            binding.binaryMessenger,
            "moonfin/media3_video_control",
        ).also {
            it.setMethodCallHandler(this)
        }

        media3EventsChannel = EventChannel(
            binding.binaryMessenger,
            "moonfin/media3_video_events",
        ).also {
            it.setStreamHandler(this)
        }

        media3ActivityChannel = MethodChannel(
            binding.binaryMessenger,
            "moonfin/media3_activity",
        ).also {
            it.setMethodCallHandler { call, result ->
                handleMedia3ActivityCall(call, result)
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        media3ActivityChannel?.setMethodCallHandler(null)
        media3ActivityChannel = null

        media3ControlChannel?.setMethodCallHandler(null)
        media3ControlChannel = null

        media3EventsChannel?.setStreamHandler(null)
        media3EventsChannel = null

        applicationContext = null

        Media3Bridge.setEventSink(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Media3Bridge.handleMethodCall(call, result)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        Media3Bridge.setEventSink(events)
    }

    override fun onCancel(arguments: Any?) {
        Media3Bridge.setEventSink(null)
    }

    private fun handleMedia3ActivityCall(call: MethodCall, result: MethodChannel.Result) {
        val context = applicationContext
        if (context == null) {
            result.error("NO_CONTEXT", "NativeVideoPlugin is not attached", null)
            return
        }

        when (call.method) {
            "start" -> {
                val args = call.arguments as? Map<*, *>
                val intent = Media3PlayerActivity.createIntent(context, args)
                context.startActivity(intent)
                result.success(null)
            }

            "stop",
            "dispose",
            -> {
                Media3ActivityHost.finishActive()
                result.success(null)
            }

            "isRunning" -> {
                result.success(Media3ActivityHost.isRunning())
            }

            else -> {
                result.notImplemented()
            }
        }
    }
}

private class NativeVideoFactory(
    private val messenger: BinaryMessenger,
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return NativeVideoView(context, messenger, viewId)
    }
}

private class Media3VideoFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return Media3VideoView(context, viewId)
    }
}
