package org.moonfin.androidtv

// Kept free of Android imports so it runs under plain JVM tests. Field numbers
// follow debuggerd's tombstone.proto.

private const val ANDROID_LOG_ERROR = 6

/** Where a native crash happened, read from its tombstone. */
internal data class TombstoneSummary(
    val abortMessage: String?,
    val threadName: String?,
    val frames: List<String>,
    val errorLogs: List<String>,
)

/**
 * The crashing thread's name and top frames, the abort message, and the error
 * lines that thread logged last. A Dart VM abort only states its reason in
 * the log, so those lines are what name a bad FFI callback.
 */
internal fun readTombstone(bytes: ByteArray, maxFrames: Int = 8, maxLogs: Int = 4): TombstoneSummary? =
    runCatching {
        var tid = -1
        var abortMessage: String? = null
        val threads = mutableMapOf<Int, ProtoMessage>()
        val logBuffers = mutableListOf<ProtoMessage>()
        ProtoMessage(bytes).forEachField { field, value ->
            when (field) {
                6 -> tid = value.int
                14 -> abortMessage = value.string
                16 -> {
                    var key = -1
                    var thread: ProtoMessage? = null
                    value.message.forEachField { entryField, entryValue ->
                        when (entryField) {
                            1 -> key = entryValue.int
                            2 -> thread = entryValue.message
                        }
                    }
                    thread?.let { threads[key] = it }
                }
                18 -> logBuffers += value.message
            }
        }

        var threadName: String? = null
        val frames = mutableListOf<String>()
        threads[tid]?.forEachField { field, value ->
            when (field) {
                2 -> threadName = value.string
                4 -> if (frames.size < maxFrames) frames += frameText(value.message)
            }
        }

        val errorLogs = mutableListOf<String>()
        for (buffer in logBuffers) {
            buffer.forEachField { field, value ->
                if (field == 2) logLine(value.message, tid)?.let(errorLogs::add)
            }
        }

        TombstoneSummary(
            abortMessage = abortMessage?.takeIf { it.isNotBlank() },
            threadName = threadName?.takeIf { it.isNotBlank() },
            frames = frames.mapIndexed { index, frame -> "#${index.toString().padStart(2, '0')} $frame" },
            errorLogs = errorLogs.takeLast(maxLogs),
        )
    }.getOrNull()

private fun frameText(frame: ProtoMessage): String {
    var relPc = 0L
    var function = ""
    var offset = 0L
    var file = ""
    frame.forEachField { field, value ->
        when (field) {
            1 -> relPc = value.long
            4 -> function = value.string
            5 -> offset = value.long
            6 -> file = value.string
        }
    }
    val library = file.substringAfterLast('/')
    return when {
        function.isEmpty() -> "$library pc ${relPc.toString(16)}"
        offset > 0 -> "$library ($function+$offset)"
        else -> "$library ($function)"
    }
}

private fun logLine(log: ProtoMessage, tid: Int): String? {
    var logTid = -1
    var priority = 0
    var tag = ""
    var message = ""
    log.forEachField { field, value ->
        when (field) {
            3 -> logTid = value.int
            4 -> priority = value.int
            5 -> tag = value.string
            6 -> message = value.string
        }
    }
    if (logTid != tid || priority < ANDROID_LOG_ERROR) return null
    return "$tag: ${message.trim()}"
}

/** A protobuf message read field by field, with no schema behind it. */
private class ProtoMessage(
    private val bytes: ByteArray,
    private val start: Int = 0,
    private val end: Int = bytes.size,
) {
    class Value(
        private val bytes: ByteArray,
        val long: Long,
        private val from: Int,
        private val to: Int,
    ) {
        val int: Int get() = long.toInt()
        val string: String get() = String(bytes, from, to - from, Charsets.UTF_8)
        val message: ProtoMessage get() = ProtoMessage(bytes, from, to)
    }

    fun forEachField(action: (field: Int, value: Value) -> Unit) {
        var pos = start
        fun varint(): Long {
            var result = 0L
            var shift = 0
            while (true) {
                require(pos < end && shift < 64)
                val byte = bytes[pos++].toInt()
                result = result or ((byte and 0x7f).toLong() shl shift)
                if (byte and 0x80 == 0) return result
                shift += 7
            }
        }
        while (pos < end) {
            val key = varint()
            val field = (key ushr 3).toInt()
            when ((key and 7).toInt()) {
                0 -> action(field, Value(bytes, varint(), 0, 0))
                1 -> pos += 8
                2 -> {
                    val length = varint().toInt()
                    require(length >= 0 && pos + length <= end)
                    action(field, Value(bytes, 0, pos, pos + length))
                    pos += length
                }
                5 -> pos += 4
                else -> throw IllegalArgumentException("unsupported wire type")
            }
        }
    }
}
