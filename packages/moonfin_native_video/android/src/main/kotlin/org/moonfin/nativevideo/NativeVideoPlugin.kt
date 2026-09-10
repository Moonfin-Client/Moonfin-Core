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
    private var transmuxChannel: MethodChannel? = null
    private var transmuxEventsChannel: EventChannel? = null
    private var applicationContext: Context? = null

    // The sink this plugin instance registered via onListen. Media3Bridge's sink
    // is process-global but each FlutterEngine has its own plugin instance, so we
    // track ownership and only clear the global sink when it is still ours.
    private var registeredSink: EventChannel.EventSink? = null
    private var registeredTransmuxSink: EventChannel.EventSink? = null

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

        transmuxChannel = MethodChannel(
            binding.binaryMessenger,
            "moonfin/media3_transmux",
        ).also {
            it.setMethodCallHandler { call, result ->
                Media3Transmux.handleMethodCall(call, result, applicationContext)
            }
        }

        transmuxEventsChannel = EventChannel(
            binding.binaryMessenger,
            "moonfin/media3_transmux_events",
        ).also {
            it.setStreamHandler(object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    registeredTransmuxSink = events
                    Media3Transmux.setEventSink(events)
                }

                override fun onCancel(arguments: Any?) {
                    Media3Transmux.clearEventSink(registeredTransmuxSink)
                    registeredTransmuxSink = null
                }
            })
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        media3ActivityChannel?.setMethodCallHandler(null)
        media3ActivityChannel = null

        media3ControlChannel?.setMethodCallHandler(null)
        media3ControlChannel = null

        media3EventsChannel?.setStreamHandler(null)
        media3EventsChannel = null

        transmuxChannel?.setMethodCallHandler(null)
        transmuxChannel = null

        transmuxEventsChannel?.setStreamHandler(null)
        transmuxEventsChannel = null

        applicationContext = null

        Media3Bridge.clearEventSink(registeredSink)
        registeredSink = null

        Media3Transmux.clearEventSink(registeredTransmuxSink)
        registeredTransmuxSink = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Media3Bridge.handleMethodCall(call, result)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        registeredSink = events
        Media3Bridge.setEventSink(events)
    }

    override fun onCancel(arguments: Any?) {
        Media3Bridge.clearEventSink(registeredSink)
        registeredSink = null
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
        val role = (args as? Map<*, *>)?.get("role") as? String ?: "main"
        return Media3VideoView(context, viewId, role)
    }
}
