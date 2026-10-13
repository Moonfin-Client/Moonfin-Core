package org.moonfin.nativevideo.subtitle

import java.nio.ByteBuffer
import java.nio.charset.CharacterCodingException
import java.nio.charset.Charset
import java.nio.charset.CodingErrorAction

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

/** Parses the SRT and WebVTT files the secondary overlay supports. */
internal object SecondarySubtitleParser {
    private val timestampLine = Regex(
        "^\\s*((?:\\d+:)?\\d+:\\d{2}(?:[,.]\\d+)?)\\s*-->\\s*" +
            "((?:\\d+:)?\\d+:\\d{2}(?:[,.]\\d+)?)(?:\\s+(.*))?$",
    )
    private val cueNumber = Regex("^\\s*\\d+\\s*$")
    private val markupTag = Regex("<[^>\\n]*>")
    private val assOverrideBlock = Regex("\\{\\s*\\\\[A-Za-z0-9][^{}]*\\}")
    private val assAlignment = Regex("\\\\an([1-9])")

    /**
     * Subtitle files come in whatever encoding they were saved in. A byte order
     * mark decides first, then strict UTF-8, then Windows-1252, which never
     * fails.
     */
    fun decode(bytes: ByteArray): String {
        fun startsWith(vararg mark: Int) =
            bytes.size >= mark.size && mark.indices.all { bytes[it] == mark[it].toByte() }
        return when {
            startsWith(0xEF, 0xBB, 0xBF) -> String(bytes, 3, bytes.size - 3, Charsets.UTF_8)
            startsWith(0xFF, 0xFE) -> String(bytes, 2, bytes.size - 2, Charsets.UTF_16LE)
            startsWith(0xFE, 0xFF) -> String(bytes, 2, bytes.size - 2, Charsets.UTF_16BE)
            else -> try {
                Charsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .decode(ByteBuffer.wrap(bytes))
                    .toString()
            } catch (_: CharacterCodingException) {
                String(bytes, Charset.forName("windows-1252"))
            }
        }
    }

    fun parse(content: String, codec: String?): List<TimedTextCue> {
        val format = codec?.trim()?.lowercase()
        require(format in setOf("srt", "subrip", "vtt", "webvtt")) {
            "Unsupported secondary subtitle format: ${codec ?: "unknown"}"
        }

        val normalized = content.removePrefix("\uFEFF").replace("\r\n", "\n").replace('\r', '\n')
        val lines = normalized.lines()
        val cues = ArrayList<TimedTextCue>()
        var index = 0

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
                // A file that skips the blank line still starts its next cue
                // with a timestamp, or a cue number right before one.
                if (timestampLine.matches(lines[index])) break
                if (cueNumber.matches(lines[index]) &&
                    index + 1 < lines.size &&
                    timestampLine.matches(lines[index + 1])
                ) {
                    break
                }
                textLines += lines[index]
                index++
            }
            if (start != null && end != null && end > start && textLines.isNotEmpty()) {
                val rawText = textLines.joinToString("\n")
                val ass = parseAssAlignment(rawText)
                val text = rawText
                    .replace(assOverrideBlock, "")
                    .replace("\\N", "\n")
                    .replace("\\h", " ")
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

        return cues.sortedBy { it.startMs }
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
        if (secondsPieces.size !in 1..2) return null
        val seconds = secondsPieces[0].toLongOrNull() ?: return null
        val fraction = secondsPieces.getOrElse(1) { "0" }
            .take(3).padEnd(3, '0').toLongOrNull() ?: return null
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

    fun activeCuesAtPlayerPosition(playerPositionMs: Long, delayMs: Long): List<TimedTextCue> {
        val timelinePositionMs = playerPositionMs - delayMs
        if (timelinePositionMs < 0L) return emptyList()
        return activeCuesAt(timelinePositionMs)
    }

    private fun firstStartAfter(positionMs: Long): Int {
        var low = 0
        var high = cues.size
        while (low < high) {
            val middle = (low + high) ushr 1
            if (cues[middle].startMs <= positionMs) low = middle + 1 else high = middle
        }
        return low
    }

    private fun activeCuesAt(positionMs: Long): List<TimedTextCue> {
        val active = ArrayList<TimedTextCue>()
        var index = firstStartAfter(positionMs) - 1
        while (index >= 0 && maxEndMsPrefix[index] > positionMs) {
            val cue = cues[index]
            if (cue.startMs <= positionMs && positionMs < cue.endMs) {
                active.add(0, cue)
            }
            index--
        }
        return active
    }

    /** The next cue start or end after [playerPositionMs], in player time. */
    fun nextChangeAt(playerPositionMs: Long, delayMs: Long): Long? {
        val positionMs = playerPositionMs - delayMs
        val upcoming = firstStartAfter(positionMs)
        var next = if (upcoming < cues.size) cues[upcoming].startMs else Long.MAX_VALUE
        if (positionMs >= 0L) {
            for (cue in activeCuesAt(positionMs)) {
                if (cue.endMs < next) next = cue.endMs
            }
        }
        return if (next == Long.MAX_VALUE) null else next + delayMs
    }
}
