package org.moonfin.androidtv

import android.content.Context
import android.net.wifi.WifiManager
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.io.OutputStreamWriter
import java.net.DatagramPacket
import java.net.HttpURLConnection
import java.net.InetAddress
import java.net.MulticastSocket
import java.net.URL
import javax.xml.parsers.DocumentBuilderFactory
import org.xml.sax.InputSource
import java.io.StringReader
import java.net.NetworkInterface
import java.net.ServerSocket
import java.net.Socket
import java.util.concurrent.Executors
import java.util.concurrent.ScheduledFuture
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicInteger

class DlnaController(private val context: Context) {

    private val handler = Handler(Looper.getMainLooper())
    private val executor = Executors.newCachedThreadPool()
    private var eventSink: EventChannel.EventSink? = null
    private var activeDeviceControlUrl: String? = null
    private var activeDeviceRenderingControlUrl: String? = null
    private val pollExecutor = Executors.newSingleThreadScheduledExecutor()
    private var pollFuture: ScheduledFuture<*>? = null
    private val xmlFactory: DocumentBuilderFactory by lazy {
        DocumentBuilderFactory.newInstance().apply {
            isNamespaceAware = true
            setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
            setFeature("http://xml.org/sax/features/external-general-entities", false)
            setFeature("http://xml.org/sax/features/external-parameter-entities", false)
        }
    }

    private var activeDeviceEventSubUrl: String? = null
    private var genaSubscriptionId: String? = null
    @Volatile private var genaServerSocket: ServerSocket? = null
    private var genaServerPort: Int = 0
    private var genaRenewFuture: ScheduledFuture<*>? = null
    private val consecutivePollFailures = AtomicInteger(0)
    private val discoveredEventSubUrls = mutableMapOf<String, String>()
    private val discoveredRenderingControlUrls = mutableMapOf<String, String>()
    @Volatile private var isDiscovering = false

    companion object {
        private const val SSDP_ADDRESS = "239.255.255.250"
        private const val SSDP_PORT = 1900
        private const val DISCOVERY_TIMEOUT_MS = 3000
        private const val AVTRANSPORT_URN = "urn:schemas-upnp-org:service:AVTransport:1"
        private const val RENDERINGCONTROL_URN = "urn:schemas-upnp-org:service:RenderingControl:1"
    }

    fun setEventSink(sink: EventChannel.EventSink?) {
        eventSink = sink
        if (sink != null && activeDeviceControlUrl != null) {
            emitEvent("connected")
        } else if (sink != null) {
            emitEvent("disconnected")
        }
    }

    fun discoverTargets(result: MethodChannel.Result) {
        executor.execute {
            val targets = mutableListOf<Map<String, Any>>()
            val seenLocations = mutableSetOf<String>()
            runSsdpScan(seenLocations) { device -> targets.add(device) }
            handler.post { result.success(targets) }
        }
    }

    /**
     * Starts a continuous SSDP scan, emitting each newly found renderer as a
     * `deviceFound` event on the event sink. Keeps re-scanning until
     * [stopContinuousDiscovery] is called so late-responding renderers are still
     * surfaced while the picker is open.
     */
    fun startContinuousDiscovery() {
        if (isDiscovering) return
        isDiscovering = true
        executor.execute {
            val seenLocations = mutableSetOf<String>()
            while (isDiscovering) {
                runSsdpScan(seenLocations) { device ->
                    val id = device["id"] as? String
                    if (id.isNullOrEmpty()) return@runSsdpScan
                    handler.post {
                        eventSink?.success(
                            mapOf(
                                "kind" to "dlna",
                                "state" to "deviceFound",
                                "id" to id,
                                "title" to (device["title"] ?: "DLNA Device"),
                                "subtitle" to (device["subtitle"] ?: ""),
                            ),
                        )
                    }
                }
                if (isDiscovering) {
                    try {
                        Thread.sleep(1500)
                    } catch (_: InterruptedException) {
                        break
                    }
                }
            }
        }
    }

    fun stopContinuousDiscovery() {
        isDiscovering = false
    }

    /**
     * Runs a single SSDP M-SEARCH round, invoking [onDevice] for each renderer
     * whose LOCATION has not been seen yet (tracked across rounds via
     * [seenLocations]).
     */
    private fun runSsdpScan(
        seenLocations: MutableSet<String>,
        onDevice: (Map<String, Any>) -> Unit,
    ) {
        var socket: MulticastSocket? = null
        // Each scan holds its own lock. The picker's continuous scan and a
        // one-shot lookup can overlap, and a shared lock would let one scan
        // release it twice or out from under the other.
        var multicastLock: WifiManager.MulticastLock? = null
        try {
            val wifi = context.applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
            multicastLock = wifi.createMulticastLock("moonfin_dlna_discovery").also { it.acquire() }
            val group = InetAddress.getByName(SSDP_ADDRESS)
            socket = MulticastSocket(SSDP_PORT)
            socket.reuseAddress = true
            socket.joinGroup(group)
            socket.soTimeout = DISCOVERY_TIMEOUT_MS

            val searchMessage = buildString {
                append("M-SEARCH * HTTP/1.1\r\n")
                append("HOST: $SSDP_ADDRESS:$SSDP_PORT\r\n")
                append("MAN: \"ssdp:discover\"\r\n")
                append("MX: 2\r\n")
                append("ST: $AVTRANSPORT_URN\r\n")
                append("\r\n")
            }
            val data = searchMessage.toByteArray()
            val packet = DatagramPacket(data, data.size, group, SSDP_PORT)
            socket.send(packet)

            val buf = ByteArray(4096)
            val deadline = System.currentTimeMillis() + DISCOVERY_TIMEOUT_MS

            while (System.currentTimeMillis() < deadline) {
                try {
                    val recv = DatagramPacket(buf, buf.size)
                    socket.receive(recv)
                    val response = String(recv.data, 0, recv.length)
                    val location = parseHeader(response, "LOCATION") ?: continue
                    if (!seenLocations.add(location)) continue

                    val deviceInfo = fetchDeviceDescription(location) ?: continue
                    onDevice(deviceInfo)
                } catch (_: java.net.SocketTimeoutException) {
                    break
                }
            }

            socket.leaveGroup(group)
        } catch (_: Exception) {
        } finally {
            socket?.close()
            multicastLock?.release()
        }
    }

    fun playToDevice(args: Map<*, *>, result: MethodChannel.Result) {
        val targetId = args["targetId"] as? String
        val streamUrl = args["streamUrl"] as? String
        val title = args["title"] as? String ?: "Moonfin"
        val startTicks = (args["startPositionTicks"] as? Number)?.toLong()

        if (targetId.isNullOrEmpty() || streamUrl.isNullOrEmpty()) {
            result.error("BAD_ARGS", "Missing targetId or streamUrl", null)
            return
        }

        emitEvent("connecting")

        executor.execute {
            try {
                val controlUrl = targetId
                val startTime = formatDlnaTime(startTicks)

                sendSoap(
                    controlUrl,
                    "SetAVTransportURI",
                    """
                    <InstanceID>0</InstanceID>
                    <CurrentURI>${escapeXml(streamUrl)}</CurrentURI>
                    <CurrentURIMetaData>&lt;DIDL-Lite xmlns=&quot;urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/&quot; xmlns:dc=&quot;http://purl.org/dc/elements/1.1/&quot;&gt;&lt;item&gt;&lt;dc:title&gt;${escapeXml(title)}&lt;/dc:title&gt;&lt;/item&gt;&lt;/DIDL-Lite&gt;</CurrentURIMetaData>
                    """.trimIndent(),
                )

                if (startTicks != null && startTicks > 0L) {
                    sendSoap(
                        controlUrl, "Seek",
                        "<InstanceID>0</InstanceID>\n<Unit>REL_TIME</Unit>\n<Target>$startTime</Target>",
                    )
                }

                sendSoap(controlUrl, "Play", "<InstanceID>0</InstanceID>\n<Speed>1</Speed>")

                activeDeviceControlUrl = controlUrl
                activeDeviceRenderingControlUrl = discoveredRenderingControlUrls[controlUrl]
                consecutivePollFailures.set(0)
                activeDeviceEventSubUrl = discoveredEventSubUrls[controlUrl]
                startGenaServer()
                activeDeviceEventSubUrl?.let { subscribeGena(it) }
                startPlaybackPolling()

                handler.post {
                    emitEvent("connected")
                    result.success(null)
                }
            } catch (e: Exception) {
                handler.post {
                    emitEvent("error", e.message ?: "Failed to start DLNA playback")
                    result.error("DLNA_PLAY_FAILED", e.message, null)
                }
            }
        }
    }

    fun pause(result: MethodChannel.Result) {
        withActiveDevice(result) { controlUrl ->
            sendSoap(controlUrl, "Pause", "<InstanceID>0</InstanceID>")
            handler.post { result.success(null) }
        }
    }

    fun play(result: MethodChannel.Result) {
        withActiveDevice(result) { controlUrl ->
            sendSoap(controlUrl, "Play", "<InstanceID>0</InstanceID>\n<Speed>1</Speed>")
            handler.post { result.success(null) }
        }
    }

    fun seek(args: Map<*, *>, result: MethodChannel.Result) {
        val positionTicks = (args["positionTicks"] as? Number)?.toLong()
        if (positionTicks == null || positionTicks < 0L) {
            result.error("BAD_ARGS", "Missing or invalid positionTicks", null)
            return
        }

        withActiveDevice(result) { controlUrl ->
            val target = formatDlnaTime(positionTicks)
            sendSoap(
                controlUrl, "Seek",
                "<InstanceID>0</InstanceID>\n<Unit>REL_TIME</Unit>\n<Target>$target</Target>",
            )
            handler.post { result.success(null) }
        }
    }

    fun stop(result: MethodChannel.Result) {
        withActiveDevice(result) { controlUrl ->
            sendSoap(controlUrl, "Stop", "<InstanceID>0</InstanceID>")
            stopGena()
            consecutivePollFailures.set(0)
            stopPlaybackPolling()
            activeDeviceControlUrl = null
            activeDeviceRenderingControlUrl = null
            handler.post {
                emitEvent("disconnected")
                result.success(null)
            }
        }
    }

    fun onDestroy() {
        stopContinuousDiscovery()
        stopPlaybackPolling()
        stopGena()
        pollExecutor.shutdownNow()
        activeDeviceControlUrl = null
        activeDeviceRenderingControlUrl = null
        consecutivePollFailures.set(0)
        eventSink = null
    }

    fun getVolume(result: MethodChannel.Result) {
        val renderingUrl = activeDeviceRenderingControlUrl
        if (renderingUrl.isNullOrBlank()) {
            result.error("NO_DLNA_SESSION", "No active DLNA rendering control", null)
            return
        }

        executor.execute {
            try {
                val response = sendSoap(
                    renderingUrl,
                    "GetVolume",
                    "<InstanceID>0</InstanceID><Channel>Master</Channel>",
                    serviceUrn = RENDERINGCONTROL_URN,
                    timeoutMs = 3000,
                )
                val currentVolume = parseXmlElement(response, "CurrentVolume")?.toDoubleOrNull() ?: 0.0
                val normalized = (currentVolume / 100.0).coerceIn(0.0, 1.0)
                handler.post { result.success(normalized) }
            } catch (e: Exception) {
                handler.post {
                    emitEvent("error", e.message ?: "DLNA volume query failed")
                    result.error("DLNA_ACTION_FAILED", e.message, null)
                }
            }
        }
    }

    fun setVolume(args: Map<*, *>, result: MethodChannel.Result) {
        val renderingUrl = activeDeviceRenderingControlUrl
        if (renderingUrl.isNullOrBlank()) {
            result.error("NO_DLNA_SESSION", "No active DLNA rendering control", null)
            return
        }

        val volume = (args["volume"] as? Number)?.toDouble()
        if (volume == null || volume.isNaN()) {
            result.error("BAD_ARGS", "Missing or invalid volume", null)
            return
        }

        executor.execute {
            try {
                val targetVolume = (volume.coerceIn(0.0, 1.0) * 100.0).toInt()
                sendSoap(
                    renderingUrl,
                    "SetVolume",
                    "<InstanceID>0</InstanceID><Channel>Master</Channel><DesiredVolume>$targetVolume</DesiredVolume>",
                    serviceUrn = RENDERINGCONTROL_URN,
                    timeoutMs = 3000,
                )
                handler.post { result.success(null) }
            } catch (e: Exception) {
                handler.post {
                    emitEvent("error", e.message ?: "DLNA volume update failed")
                    result.error("DLNA_ACTION_FAILED", e.message, null)
                }
            }
        }
    }

    private fun withActiveDevice(
        result: MethodChannel.Result,
        action: (String) -> Unit,
    ) {
        val controlUrl = activeDeviceControlUrl
        if (controlUrl == null) {
            result.error("NO_DLNA_SESSION", "No active DLNA session", null)
            return
        }
        executor.execute {
            try {
                action(controlUrl)
            } catch (e: Exception) {
                handler.post {
                    emitEvent("error", e.message ?: "DLNA action failed")
                    result.error("DLNA_ACTION_FAILED", e.message, null)
                }
            }
        }
    }

    private fun parseHeader(response: String, header: String): String? {
        for (line in response.lines()) {
            if (line.startsWith("$header:", ignoreCase = true)) {
                return line.substringAfter(":").trim()
            }
        }
        return null
    }

    private fun fetchDeviceDescription(locationUrl: String): Map<String, Any>? {
        return try {
            val url = URL(locationUrl)
            val conn = url.openConnection() as HttpURLConnection
            conn.connectTimeout = 3000
            conn.readTimeout = 3000
            conn.requestMethod = "GET"

            val xml = conn.inputStream.bufferedReader().use { it.readText() }
            conn.disconnect()

            val builder = xmlFactory.newDocumentBuilder()
            val doc = builder.parse(InputSource(StringReader(xml)))

            val friendlyName = doc.getElementsByTagName("friendlyName").item(0)?.textContent ?: "DLNA Device"
            val modelName = doc.getElementsByTagName("modelName").item(0)?.textContent ?: ""

            val serviceNodes = doc.getElementsByTagName("service")
            var controlUrl: String? = null
            var renderingControlUrl: String? = null
            for (i in 0 until serviceNodes.length) {
                val serviceNode = serviceNodes.item(i)
                val children = serviceNode.childNodes
                var serviceType: String? = null
                var serviceControlUrl: String? = null
                var serviceEventSubUrl: String? = null
                for (j in 0 until children.length) {
                    val child = children.item(j)
                    when (child.nodeName) {
                        "serviceType" -> serviceType = child.textContent
                        "controlURL" -> serviceControlUrl = child.textContent
                        "eventSubURL" -> serviceEventSubUrl = child.textContent
                    }
                }
                if (serviceType == AVTRANSPORT_URN && serviceControlUrl != null) {
                    controlUrl = resolveUrl(locationUrl, serviceControlUrl)
                    if (serviceEventSubUrl != null) {
                        discoveredEventSubUrls[controlUrl] = resolveUrl(locationUrl, serviceEventSubUrl)
                    }
                    continue
                }
                if (serviceType == RENDERINGCONTROL_URN && serviceControlUrl != null) {
                    renderingControlUrl = resolveUrl(locationUrl, serviceControlUrl)
                }
            }

            if (controlUrl == null) return null
            if (renderingControlUrl != null) {
                discoveredRenderingControlUrls[controlUrl] = renderingControlUrl
            }

            mapOf(
                "id" to controlUrl,
                "title" to friendlyName,
                "subtitle" to modelName,
            )
        } catch (_: Exception) {
            null
        }
    }

    private fun resolveUrl(base: String, relative: String): String {
        return try {
            URL(URL(base), relative).toString()
        } catch (_: Exception) {
            relative
        }
    }

        private fun sendSoap(
                controlUrl: String,
                action: String,
                innerBody: String,
                serviceUrn: String = AVTRANSPORT_URN,
                timeoutMs: Int = 5000,
        ): String {
        val envelope = """<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
  <s:Body>
        <u:$action xmlns:u="$serviceUrn">
      $innerBody
    </u:$action>
  </s:Body>
</s:Envelope>"""
        val url = URL(controlUrl)
        val conn = url.openConnection() as HttpURLConnection
        conn.requestMethod = "POST"
        conn.doOutput = true
        conn.connectTimeout = timeoutMs
        conn.readTimeout = timeoutMs
        conn.setRequestProperty("Content-Type", "text/xml; charset=\"utf-8\"")
        conn.setRequestProperty("SOAPAction", "\"$serviceUrn#$action\"")
        OutputStreamWriter(conn.outputStream, Charsets.UTF_8).use {
            it.write(envelope)
            it.flush()
        }
        val responseCode = conn.responseCode
        val responseBody = if (responseCode in 200..299) {
            conn.inputStream.bufferedReader().use { it.readText() }
        } else {
            conn.disconnect()
            throw RuntimeException("DLNA $action failed with HTTP $responseCode")
        }
        conn.disconnect()
        return responseBody
    }

    private fun formatDlnaTime(ticks: Long?): String {
        if (ticks == null || ticks <= 0L) return "00:00:00"
        val totalSeconds = ticks / 10_000_000L
        val hours = totalSeconds / 3600
        val minutes = (totalSeconds % 3600) / 60
        val seconds = totalSeconds % 60
        return "%02d:%02d:%02d".format(hours, minutes, seconds)
    }

    private fun escapeXml(text: String): String {
        return text
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&apos;")
    }

    private fun emitEvent(state: String, message: String? = null, positionTicks: Long? = null) {
        val payload = mutableMapOf<String, Any>(
            "kind" to "dlna",
            "state" to state,
        )
        if (!message.isNullOrBlank()) payload["message"] = message
        if (positionTicks != null && positionTicks > 0L) payload["positionTicks"] = positionTicks
        handler.post { eventSink?.success(payload) }
    }

    private fun startPlaybackPolling() {
        stopPlaybackPolling()
        pollFuture = pollExecutor.scheduleWithFixedDelay(::pollPlaybackState, 1, 1, TimeUnit.SECONDS)
    }

    private fun stopPlaybackPolling() {
        pollFuture?.cancel(false)
        pollFuture = null
    }

    private fun pollPlaybackState() {
        val controlUrl = activeDeviceControlUrl ?: return
        try {
            val state = queryTransportState(controlUrl)
            val positionTicks = queryPositionTicks(controlUrl)
            val mappedState = when (state) {
                "PLAYING" -> "playing"
                "PAUSED_PLAYBACK" -> "paused"
                "TRANSITIONING" -> "buffering"
                else -> "idle"
            }
            consecutivePollFailures.set(0)
            emitEvent(mappedState, positionTicks = positionTicks)
        } catch (_: Exception) {
            if (consecutivePollFailures.incrementAndGet() >= 3) {
                handler.post { handleDeviceOffline() }
            }
        }
    }

    private fun queryTransportState(controlUrl: String): String {
        val response = sendSoap(controlUrl, "GetTransportInfo", "<InstanceID>0</InstanceID>", timeoutMs = 3000)
        return parseXmlElement(response, "CurrentTransportState") ?: "STOPPED"
    }

    private fun queryPositionTicks(controlUrl: String): Long {
        val response = sendSoap(controlUrl, "GetPositionInfo", "<InstanceID>0</InstanceID>", timeoutMs = 3000)
        val relTime = parseXmlElement(response, "RelTime") ?: return 0L
        return parseDlnaTime(relTime)
    }

    private fun parseXmlElement(xml: String, elementName: String): String? {
        val builder = xmlFactory.newDocumentBuilder()
        val doc = builder.parse(InputSource(StringReader(xml)))
        return doc.getElementsByTagName(elementName).item(0)?.textContent
    }

    private fun parseDlnaTime(time: String): Long {
        val parts = time.split(":")
        if (parts.size != 3) return 0L
        val hours = parts[0].toLongOrNull() ?: return 0L
        val minutes = parts[1].toLongOrNull() ?: return 0L
        val seconds = parts[2].split(".")[0].toLongOrNull() ?: return 0L
        return (hours * 3600 + minutes * 60 + seconds) * 10_000_000L
    }

    private fun startGenaServer() {
        stopGenaServer()
        try {
            val serverSocket = ServerSocket(0)
            genaServerSocket = serverSocket
            genaServerPort = serverSocket.localPort
            val thread = Thread {
                try {
                    while (!serverSocket.isClosed) {
                        val client = serverSocket.accept()
                        executor.execute {
                            try {
                                client.soTimeout = 5000
                                val reader = client.getInputStream().bufferedReader()
                                val headerLines = mutableListOf<String>()
                                var line = reader.readLine()
                                while (line != null && line.isNotEmpty()) {
                                    headerLines.add(line)
                                    line = reader.readLine()
                                }
                                val contentLength = headerLines
                                    .find { it.startsWith("Content-Length:", ignoreCase = true) }
                                    ?.substringAfter(":")?.trim()?.toIntOrNull() ?: 0
                                val body = if (contentLength > 0) {
                                    val chars = CharArray(contentLength)
                                    var read = 0
                                    while (read < contentLength) {
                                        val n = reader.read(chars, read, contentLength - read)
                                        if (n < 0) break
                                        read += n
                                    }
                                    String(chars, 0, read)
                                } else ""
                                client.getOutputStream()
                                    .write("HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n".toByteArray())
                                client.close()
                                if (body.isNotBlank()) handleGenaNotify(body)
                            } catch (_: Exception) {
                                try { client.close() } catch (_: Exception) {}
                            }
                        }
                    }
                } catch (_: Exception) {}
            }
            thread.isDaemon = true
            thread.start()
        } catch (_: Exception) {
            genaServerSocket = null
            genaServerPort = 0
        }
    }

    private fun stopGenaServer() {
        try { genaServerSocket?.close() } catch (_: Exception) {}
        genaServerSocket = null
        genaServerPort = 0
    }

    private fun getLocalIpAddress(): String? {
        return try {
            NetworkInterface.getNetworkInterfaces()?.toList()
                ?.flatMap { it.inetAddresses.toList() }
                ?.firstOrNull { !it.isLoopbackAddress && it is java.net.Inet4Address }
                ?.hostAddress
        } catch (_: Exception) { null }
    }

    private fun subscribeGena(eventSubUrl: String) {
        val port = genaServerPort
        if (port == 0) return
        val localIp = getLocalIpAddress() ?: return
        val callbackUrl = "http://$localIp:$port/notify"
        executor.execute {
            try {
                val uri = URL(eventSubUrl)
                val host = uri.host
                val connPort = if (uri.port == -1) 80 else uri.port
                val path = uri.path.ifEmpty { "/" }
                val request = buildString {
                    append("SUBSCRIBE $path HTTP/1.1\r\n")
                    append("HOST: $host:$connPort\r\n")
                    append("CALLBACK: <$callbackUrl>\r\n")
                    append("NT: upnp:event\r\n")
                    append("TIMEOUT: Second-1800\r\n")
                    append("Connection: close\r\n")
                    append("\r\n")
                }
                val socket = Socket(host, connPort)
                socket.soTimeout = 5000
                socket.getOutputStream().write(request.toByteArray())
                val reader = socket.getInputStream().bufferedReader()
                val response = buildString {
                    var ln = reader.readLine()
                    while (ln != null && ln.isNotEmpty()) { appendLine(ln); ln = reader.readLine() }
                }
                socket.close()
                val sid = parseHeader(response, "SID") ?: return@execute
                genaSubscriptionId = sid
                genaRenewFuture = pollExecutor.schedule(
                    { renewGena(eventSubUrl, sid) },
                    25, TimeUnit.MINUTES,
                )
            } catch (_: Exception) {}
        }
    }

    private fun renewGena(eventSubUrl: String, sid: String) {
        if (genaSubscriptionId != sid) return
        executor.execute {
            try {
                val uri = URL(eventSubUrl)
                val host = uri.host
                val connPort = if (uri.port == -1) 80 else uri.port
                val path = uri.path.ifEmpty { "/" }
                val request = buildString {
                    append("SUBSCRIBE $path HTTP/1.1\r\n")
                    append("HOST: $host:$connPort\r\n")
                    append("SID: $sid\r\n")
                    append("TIMEOUT: Second-1800\r\n")
                    append("Connection: close\r\n")
                    append("\r\n")
                }
                val socket = Socket(host, connPort)
                socket.soTimeout = 5000
                socket.getOutputStream().write(request.toByteArray())
                val reader = socket.getInputStream().bufferedReader()
                while (reader.readLine()?.isNotEmpty() == true) {}
                socket.close()
                if (genaSubscriptionId == sid) {
                    genaRenewFuture = pollExecutor.schedule(
                        { renewGena(eventSubUrl, sid) },
                        25, TimeUnit.MINUTES,
                    )
                }
            } catch (_: Exception) {}
        }
    }

    private fun unsubscribeGena() {
        genaRenewFuture?.cancel(false)
        genaRenewFuture = null
        val eventSubUrl = activeDeviceEventSubUrl ?: return
        val sid = genaSubscriptionId ?: return
        genaSubscriptionId = null
        executor.execute {
            try {
                val uri = URL(eventSubUrl)
                val host = uri.host
                val connPort = if (uri.port == -1) 80 else uri.port
                val path = uri.path.ifEmpty { "/" }
                val request = buildString {
                    append("UNSUBSCRIBE $path HTTP/1.1\r\n")
                    append("HOST: $host:$connPort\r\n")
                    append("SID: $sid\r\n")
                    append("Connection: close\r\n")
                    append("\r\n")
                }
                val socket = Socket(host, connPort)
                socket.soTimeout = 3000
                socket.getOutputStream().write(request.toByteArray())
                val reader = socket.getInputStream().bufferedReader()
                while (reader.readLine()?.isNotEmpty() == true) {}
                socket.close()
            } catch (_: Exception) {}
        }
    }

    private fun stopGena() {
        unsubscribeGena()
        stopGenaServer()
        activeDeviceEventSubUrl = null
    }

    private fun handleGenaNotify(body: String) {
        try {
            val builder = xmlFactory.newDocumentBuilder()
            val outerDoc = builder.parse(InputSource(StringReader(body)))
            val lastChangeText = outerDoc.getElementsByTagName("LastChange")
                .item(0)?.textContent?.trim() ?: return
            val innerDoc = builder.parse(InputSource(StringReader(lastChangeText)))
            val state = innerDoc.getElementsByTagName("TransportState")
                .item(0)?.attributes?.getNamedItem("val")?.textContent ?: return
            val relTimeStr = innerDoc.getElementsByTagName("RelativeTimePosition")
                .item(0)?.attributes?.getNamedItem("val")?.textContent
            val mappedState = when (state) {
                "PLAYING" -> "playing"
                "PAUSED_PLAYBACK" -> "paused"
                "TRANSITIONING" -> "buffering"
                else -> "idle"
            }
            consecutivePollFailures.set(0)
            val positionTicks = relTimeStr?.let { parseDlnaTime(it) }
            emitEvent(mappedState, positionTicks = positionTicks)
        } catch (_: Exception) {}
    }

    private fun handleDeviceOffline() {
        if (activeDeviceControlUrl == null) return
        stopPlaybackPolling()
        stopGena()
        activeDeviceControlUrl = null
        activeDeviceRenderingControlUrl = null
        consecutivePollFailures.set(0)
        emitEvent("disconnected", message = "Device unreachable")
    }
}
