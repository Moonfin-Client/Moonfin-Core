package org.moonfin.nativevideo.subtitle

/** A parsed text cue on the subtitle file's own timeline. */
internal data class TimedTextCue(
    val startMs: Long,
    val endMs: Long,
    val text: String,
    val line: Float? = null,
    val lineType: Int? = null,
    val lineAnchor: Int? = null,
    val position: Float? = null,
    val positionAnchor: Int? = null,
    val size: Float? = null,
    val alignment: String? = null,
)

/**
 * Parses the text formats the secondary overlay supports. Cues are sorted once
 * at load time; lookups use binary search and a prefix end-time index so seeks
 * and normal playback do not scan the full subtitle file.
 */
internal object SecondarySubtitleParser {
    private val timestampLine = Regex(
        "^\\s*((?:\\d+:)?\\d{2,}:\\d{2}[,.]\\d{1,3})\\s+-->\\s+" +
            "((?:\\d+:)?\\d{2,}:\\d{2}[,.]\\d{1,3})(?:\\s+(.*))?$",
    )
    private val markupTag = Regex("<[^>]*>")
    private val assOverrideBlock = Regex("\\{\\s*\\\\[A-Za-z0-9][^{}]*\\}")
    private val assAlignment = Regex("\\\\an([1-9])")

    fun parse(content: String, codec: String?): List<TimedTextCue> {
        val format = codec?.trim()?.lowercase()
        require(format in setOf("srt", "subrip", "vtt", "webvtt")) {
            "Unsupported secondary subtitle format: ${codec ?: "unknown"}"
        }

        val normalized = content.removePrefix("\uFEFF").replace("\r\n", "\n").replace('\r', '\n')
        val lines = normalized.lines()
        val cues = ArrayList<TimedTextCue>()
        var index = if (format == "vtt" || format == "webvtt") {
            // The WEBVTT header can carry metadata on following lines. Cues
            // begin at the first timestamp rather than at a blank block only.
            lines.indexOfFirst { timestampLine.matches(it) }.coerceAtLeast(0)
        } else {
            0
        }

        while (index < lines.size) {
            val match = timestampLine.matchEntire(lines[index])
            if (match == null) {
                index++
                continue
            }

            val start = parseTimestampMs(match.groupValues[1])
            val end = parseTimestampMs(match.groupValues[2])
            index++
            val textLines = ArrayList<String>()
            while (index < lines.size && lines[index].isNotBlank()) {
                textLines += lines[index]
                index++
            }
            if (start != null && end != null && end > start && textLines.isNotEmpty()) {
                val rawText = textLines.joinToString("\n")
                val ass = parseAssAlignment(rawText)
                val text = rawText
                    .replace(assOverrideBlock, "")
                    .replace(markupTag, "")
                    .replace("&nbsp;", " ")
                    .replace("&lt;", "<")
                    .replace("&gt;", ">")
                    .replace("&quot;", "\"")
                    .replace("&#39;", "'")
                    .replace("&amp;", "&")
                    .trim()
                if (text.isNotEmpty()) {
                    val settings = parseWebVttSettings(match.groupValues.getOrNull(3).orEmpty())
                    cues += TimedTextCue(
                        start,
                        end,
                        text,
                        line = settings["line"] as? Float ?: ass?.line,
                        lineType = settings["lineType"] as? Int,
                        lineAnchor = settings["lineAnchor"] as? Int
                            ?: if (settings.containsKey("line")) null else ass?.lineAnchor,
                        position = settings["position"] as? Float ?: ass?.position,
                        positionAnchor = if (settings.containsKey("position")) {
                            settings["positionAnchor"] as? Int
                        } else {
                            ass?.positionAnchor
                        },
                        size = settings["size"] as? Float,
                        alignment = settings["align"] as? String ?: ass?.alignment,
                    )
                }
            }
        }

        return cues.withIndex()
            .sortedWith(compareBy<IndexedValue<TimedTextCue>> { it.value.startMs }.thenBy { it.index })
            .map { it.value }
    }

    /** Reads ASS alignment overrides embedded in otherwise SRT/VTT cue text. */
    private fun parseAssAlignment(text: String): AssAlignment? {
        val tag = assOverrideBlock.findAll(text)
            .flatMap { assAlignment.findAll(it.value) }
            .firstOrNull() ?: return null
        val alignment = tag.groupValues[1].toIntOrNull() ?: return null
        val column = (alignment - 1) % 3
        val row = (alignment - 1) / 3
        val line = when (row) {
            0 -> 0.92f
            1 -> 0.5f
            else -> 0.08f
        }
        val lineAnchor = when (row) {
            0 -> 2 // end
            1 -> 1 // middle
            else -> 0 // start
        }
        val position = when (column) {
            0 -> 0.08f
            1 -> 0.5f
            else -> 0.92f
        }
        val positionAnchor = when (column) {
            0 -> 0 // start
            1 -> 1 // middle
            else -> 2 // end
        }
        val textAlignment = when (column) {
            0 -> "left"
            1 -> "center"
            else -> "right"
        }
        return AssAlignment(line, lineAnchor, position, positionAnchor, textAlignment)
    }

    private data class AssAlignment(
        val line: Float,
        val lineAnchor: Int,
        val position: Float,
        val positionAnchor: Int,
        val alignment: String,
    )

    private fun parseWebVttSettings(value: String): Map<String, Any> {
        val settings = mutableMapOf<String, Any>()
        for (part in value.trim().split(Regex("\\s+"))) {
            val pieces = part.split(':', limit = 2)
            if (pieces.size != 2) continue
            val name = pieces[0]
            val raw = pieces[1]
            when (name) {
                "line" -> {
                    val lineValue = raw.substringBefore(',')
                    val parsedLine = lineValue.removeSuffix("%").toFloatOrNull() ?: continue
                    val lineAlignment = when (raw.substringAfter(',', "")) {
                        "start" -> 0
                        "center" -> 1
                        "end" -> 2
                        else -> if (parsedLine < 0f) 2 else 0
                    }
                    if (lineValue.endsWith('%')) {
                        settings["line"] = (parsedLine / 100f).coerceIn(0f, 1f)
                        settings["lineType"] = 0
                    } else {
                        settings["line"] = parsedLine
                        settings["lineType"] = 1
                    }
                    settings["lineAnchor"] = lineAlignment
                }
                "position", "size" -> {
                    val percentage = raw.substringBefore(',').removeSuffix("%")
                        .toFloatOrNull()
                    if (raw.contains('%') && percentage != null) {
                        settings[name] = (percentage / 100f).coerceIn(0f, 1f)
                    }
                    if (name == "position") {
                        settings["positionAnchor"] = when (raw.substringAfter(',', "")) {
                            "line-left" -> 0
                            "line-right" -> 2
                            "line-center" -> 1
                            else -> 1
                        }
                    }
                }
                "align" -> if (raw in setOf("start", "center", "end", "left", "right")) {
                    settings["align"] = raw
                }
            }
        }
        return settings
    }

    private fun parseTimestampMs(value: String): Long? {
        val normalized = value.replace(',', '.')
        val parts = normalized.split(':')
        if (parts.size !in 2..3) return null
        val hours: Long
        val minutes: Long
        val secondsPart: String
        if (parts.size == 3) {
            hours = parts[0].toLongOrNull() ?: return null
            minutes = parts[1].toLongOrNull() ?: return null
            secondsPart = parts[2]
        } else {
            hours = 0L
            minutes = parts[0].toLongOrNull() ?: return null
            secondsPart = parts[1]
        }
        val secondsPieces = secondsPart.split('.')
        if (secondsPieces.size != 2) return null
        val seconds = secondsPieces[0].toLongOrNull() ?: return null
        val fraction = secondsPieces[1].take(3).padEnd(3, '0').toLongOrNull() ?: return null
        if ((parts.size == 3 && minutes > 59) || seconds > 59) return null
        return (((hours * 60 + minutes) * 60 + seconds) * 1000) + fraction
    }
}

/** Sorted cues with indexed lookup for the current playback position. */
internal class SecondarySubtitleTimeline(cues: List<TimedTextCue>) {
    private val cues = cues.sortedBy { it.startMs }
    private val maxEndMsPrefix = LongArray(this.cues.size)

    init {
        var maxEnd = Long.MIN_VALUE
        this.cues.forEachIndexed { index, cue ->
            if (cue.endMs > maxEnd) maxEnd = cue.endMs
            maxEndMsPrefix[index] = maxEnd
        }
    }

    fun activeTextAt(positionMs: Long): String? {
        val active = activeCuesAt(positionMs)
        return when (active.size) {
            0 -> null
            1 -> active.single().text
            else -> active.joinToString("\n") { it.text }
        }
    }

    fun activeCuesAtPlayerPosition(playerPositionMs: Long, delayMs: Long): List<TimedTextCue> {
        val timelinePositionMs = playerPositionMs - delayMs
        if (timelinePositionMs < 0L) return emptyList()
        return activeCuesAt(timelinePositionMs)
    }

    private fun activeCuesAt(positionMs: Long): List<TimedTextCue> {
        var low = 0
        var high = cues.size
        while (low < high) {
            val middle = (low + high) ushr 1
            if (cues[middle].startMs <= positionMs) low = middle + 1 else high = middle
        }

        val active = ArrayList<TimedTextCue>()
        var index = low - 1
        while (index >= 0 && maxEndMsPrefix[index] > positionMs) {
            val cue = cues[index]
            if (cue.startMs <= positionMs && positionMs < cue.endMs) {
                active.add(0, cue)
            }
            index--
        }
        return active
    }

    fun activeTextAtPlayerPosition(playerPositionMs: Long, delayMs: Long): String? {
        val timelinePositionMs = playerPositionMs - delayMs
        if (timelinePositionMs < 0L) return null
        return activeTextAt(timelinePositionMs)
    }
}
