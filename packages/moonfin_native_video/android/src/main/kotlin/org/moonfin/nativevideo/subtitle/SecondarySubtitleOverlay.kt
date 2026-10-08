package org.moonfin.nativevideo.subtitle

import android.graphics.Color
import android.graphics.Typeface
import android.net.Uri
import android.os.Handler
import android.text.Layout
import android.util.Log
import android.view.View
import androidx.media3.common.C
import androidx.media3.common.text.Cue
import androidx.media3.datasource.DataSource
import androidx.media3.datasource.DataSpec
import androidx.media3.ui.CaptionStyleCompat
import androidx.media3.ui.SubtitleView
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.RejectedExecutionException

/** A sidecar text overlay synchronized to the owning ExoPlayer's clock. */
@androidx.media3.common.util.UnstableApi
internal class SecondarySubtitleOverlay(
    private val view: SubtitleView,
    private val dataSourceFactory: () -> DataSource.Factory,
    private val mainHandler: Handler,
    private val positionMs: () -> Long,
    private val onFailure: (String) -> Unit,
    private val onPrimaryVerticalOffset: (Float) -> Unit = {},
) {
    companion object {
        private const val TAG = "MoonfinSecondarySubtitle"
        private const val MAX_SUBTITLE_BYTES = 16 * 1024 * 1024
        private const val DEFAULT_OFFSET_DELTA = 0.08f
        private const val MIN_GAP_DP = 8f
    }

    private val executor: ExecutorService = Executors.newSingleThreadExecutor { task ->
        Thread(task, "moonfin-secondary-subtitle").apply { isDaemon = true }
    }
    private val activeDataSourceLock = Any()
    @Volatile private var activeDataSource: DataSource? = null
    @Volatile private var disposed = false
    private var generation = 0
    private var selectedUrl: String? = null
    private var selectedCodec: String? = null
    private var delayMs = 0L
    private var lastRenderedText: String? = null
    private var baseTextColor = Color.WHITE
    private var baseBackgroundColor = Color.TRANSPARENT
    private var baseStrokeColor = Color.TRANSPARENT
    private var baseFontSize = 20f
    private var baseFontWeight = 400
    private var baseVerticalOffset = 0.04f
    private var fontSizeOverride: Float? = null
    private var textColorOverride: Int? = null
    private var offsetDelta = 0f
    private var primaryBottomPaddingFraction = 0.04f
    private var primaryCues: List<Cue> = emptyList()
    private var primaryCanShift = false
    @Volatile private var timeline: SecondarySubtitleTimeline? = null

    init {
        view.setApplyEmbeddedStyles(false)
        view.setApplyEmbeddedFontSizes(false)
        view.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
            updatePrimaryOffset()
            lastRenderedText = null
            renderAt(positionMs())
        }
        applyStyle()
        view.setCues(emptyList())
    }

    /** Loads each selected sidecar once; a repeated style or delay update reuses its cues. */
    fun select(url: String?, codec: String?) {
        if (disposed) return
        if (url == selectedUrl && codec == selectedCodec) return
        generation++
        val requestGeneration = generation
        selectedUrl = url
        selectedCodec = codec
        timeline = null
        lastRenderedText = null
        view.visibility = View.VISIBLE
        view.setCues(emptyList())
        if (url.isNullOrBlank()) return

        try {
            executor.execute {
                try {
                    val content = readSubtitle(url)
                    val cues = SecondarySubtitleParser.parse(content, codec)
                    val parsed = SecondarySubtitleTimeline(cues)
                    Log.d(
                        TAG,
                        "Loaded secondary subtitle ($codec): ${content.length} chars, ${cues.size} cues",
                    )
                    mainHandler.post {
                        if (requestGeneration != generation || selectedUrl != url) return@post
                        timeline = parsed
                        renderAt(positionMs())
                    }
                } catch (error: Throwable) {
                    val message = error.message ?: error.javaClass.simpleName
                    // Preserve the response code/cause chain in release builds too. The short
                    // message alone is often just an obfuscated exception class name.
                    Log.w(TAG, "Could not load secondary subtitle ($codec): $error", error)
                    mainHandler.post {
                        if (requestGeneration != generation || selectedUrl != url) return@post
                        selectedUrl = null
                        selectedCodec = null
                        timeline = null
                        lastRenderedText = null
                        view.setCues(emptyList())
                        onFailure(message)
                    }
                }
            }
        } catch (_: RejectedExecutionException) {
            // dispose() may race with a late source update from the platform view.
        }
    }

    /** Positive delay means show the subtitle later, matching the primary track. */
    fun setDelayMs(value: Long) {
        delayMs = value.coerceIn(-5000L, 5000L)
        renderAt(positionMs())
    }

    fun configureBaseStyle(
        textColor: Int,
        backgroundColor: Int,
        strokeColor: Int,
        fontSize: Float?,
        fontWeight: Int,
        verticalOffset: Float?,
    ) {
        baseTextColor = textColor
        baseBackgroundColor = backgroundColor
        baseStrokeColor = strokeColor
        if (fontSize != null) baseFontSize = fontSize
        baseFontWeight = fontWeight
        if (verticalOffset != null) {
            baseVerticalOffset = verticalOffset
            primaryBottomPaddingFraction = verticalOffset.coerceIn(0f, 0.95f)
        }
        applyStyle()
        updatePrimaryOffset()
        lastRenderedText = null
        renderAt(positionMs())
    }

    fun updatePrimaryCues(cues: List<Cue>, allowAutomaticShift: Boolean = true) {
        primaryCues = cues
        primaryCanShift = allowAutomaticShift && cues.isNotEmpty() && cues.all {
            it.bitmap == null && it.line == Cue.DIMEN_UNSET && it.position == Cue.DIMEN_UNSET
        }
        updatePrimaryOffset()
        lastRenderedText = null
        renderAt(positionMs())
    }

    /** Font size and vertical offset use Moonfin's existing subtitle style units. */
    fun configureAppearance(
        fontSize: Float?,
        verticalOffset: Float?,
        textColor: Int? = null,
    ) {
        fontSizeOverride = fontSize?.coerceIn(8f, 72f)
        textColorOverride = textColor
        offsetDelta = ((verticalOffset ?: DEFAULT_OFFSET_DELTA) - DEFAULT_OFFSET_DELTA)
            .coerceIn(-0.08f, 0.32f)
        applyStyle()
        updatePrimaryOffset()
        lastRenderedText = null
        renderAt(positionMs())
    }

    /** Called from the existing 250 ms player ticker and immediately after seeks. */
    fun renderAt(playerPositionMs: Long) {
        val active = timeline?.activeCuesAtPlayerPosition(playerPositionMs, delayMs).orEmpty()
        val signature = active.joinToString("\u0000") {
            "${it.text}|${it.line}|${it.lineType}|${it.lineAnchor}|${it.position}|${it.positionAnchor}|${it.size}|${it.alignment}"
        }
        if (signature == lastRenderedText) return
        lastRenderedText = signature
        renderCues(active)
    }

    private fun renderCues(active: List<TimedTextCue>) {
        if (active.isEmpty()) {
            view.visibility = View.VISIBLE
            view.setCues(emptyList())
            return
        }
        val width = view.width
        val height = view.height
        if (width <= 0 || height <= 0) {
            view.visibility = View.VISIBLE
            view.setCues(active.map { buildCue(listOf(it)) })
            return
        }
        val primaryFontPx = (baseFontSize / 24f) * 0.06f * height
        val secondaryFontPx = ((fontSizeOverride ?: baseFontSize) / 24f) * 0.06f * height
        val primaryBoxes = primaryCues.map { estimatePrimaryBox(it, width, height, primaryFontPx) }
        val gapPx = MIN_GAP_DP * view.resources.displayMetrics.density
        val fixed = active.filter { it.line != null }
        val automatic = active.filter { it.line == null }
        val rendered = ArrayList<Cue>()
        val occupied = ArrayList<SubtitleBox>(primaryBoxes)
        val topFallback = ArrayList<Pair<String, Cue>>()
        for (timedCue in fixed) {
            var cue = buildCue(listOf(timedCue))
            val box = estimateSecondaryBox(
                cue,
                width,
                height,
                estimateTextHeight(timedCue.text, width * (timedCue.size ?: 0.9f), secondaryFontPx),
            )
            if (box == null || occupied.none { SubtitleLayoutPlanner.intersects(box, it, gapPx) }) {
                rendered += cue
                if (box != null) occupied += box
                continue
            }

            val lineAnchor = timedCue.lineAnchor ?: cue.lineAnchor
            val verticalAlignment = SubtitleLayoutPlanner.verticalAlignmentFor(box, height)
            val placed = SubtitleLayoutPlanner.placePositionedSecondary(
                primary = occupied,
                viewportWidth = width,
                viewportHeight = height,
                desired = box,
                verticalAlignment = verticalAlignment,
                gapPx = gapPx,
                stepPx = gapPx,
            )
            if (placed != null) {
                val line = when (lineAnchor) {
                    Cue.ANCHOR_TYPE_END -> placed.bottom / height
                    Cue.ANCHOR_TYPE_MIDDLE -> (placed.top + placed.bottom) / (2f * height)
                    else -> placed.top / height
                }
                cue = cue.buildUpon()
                    .setLine(line, Cue.LINE_TYPE_FRACTION)
                    .setLineAnchor(lineAnchor)
                    .build()
                rendered += cue
                occupied += placed
            } else if (verticalAlignment == SubtitleLayoutPlanner.ALIGN_TOP) {
                topFallback.add(timedCue.text to cue)
            }
        }

        // If top-aligned captions cannot fit in the upper half, keep them
        // readable by placing them with the normal secondary bottom layout.
        for ((text, cue) in topFallback) {
            placeAutomaticCue(cue, text, width, height, secondaryFontPx, occupied, gapPx)
                ?.let(rendered::add)
        }

        val automaticGroups = automatic.groupBy {
            listOf(it.position, it.positionAnchor, it.size, it.alignment)
        }.values
        for (group in automaticGroups) {
            val text = group.joinToString("\n") { it.text }
            placeAutomaticCue(
                buildCue(group), text, width, height, secondaryFontPx, occupied, gapPx,
            )?.let(rendered::add)
        }

        view.visibility = if (rendered.isEmpty()) View.INVISIBLE else View.VISIBLE
        view.setCues(rendered)
    }

    private fun buildCue(cues: List<TimedTextCue>): Cue {
        val settings = cues.first()
        return Cue.Builder().setText(cues.joinToString("\n") { it.text }).apply {
            settings.line?.let {
                val lineType = if (settings.lineType == Cue.LINE_TYPE_NUMBER) {
                    Cue.LINE_TYPE_NUMBER
                } else Cue.LINE_TYPE_FRACTION
                setLine(it, lineType)
                setLineAnchor(
                    settings.lineAnchor ?: if (it < 0f) Cue.ANCHOR_TYPE_END else Cue.ANCHOR_TYPE_START,
                )
            }
            settings.position?.let {
                setPosition(it)
                setPositionAnchor(settings.positionAnchor ?: Cue.ANCHOR_TYPE_MIDDLE)
            }
            settings.size?.let { setSize(it) }
            when (settings.alignment) {
                "start", "left" -> setTextAlignment(Layout.Alignment.ALIGN_NORMAL)
                "end", "right" -> setTextAlignment(Layout.Alignment.ALIGN_OPPOSITE)
                "center" -> setTextAlignment(Layout.Alignment.ALIGN_CENTER)
            }
        }.build()
    }

    private fun placeAutomaticCue(
        cue: Cue,
        text: String,
        width: Int,
        height: Int,
        fontPx: Float,
        occupied: MutableList<SubtitleBox>,
        gapPx: Float,
    ): Cue? {
        val cueWidth = if (cue.size == Cue.DIMEN_UNSET) width * 0.9f else cue.size * width
        val textHeight = estimateTextHeight(text, cueWidth, fontPx.coerceAtLeast(1f))
        val topOfLowestPrimary = occupied
            .filter { it.bottom > height / 2f }
            .minOfOrNull { it.top }
        val primaryBottom = height * (1f - primaryBottomPaddingFraction) + primaryOffsetPx()
        val secondaryOnlyOffset = if (primaryCanShift) 0f else offsetDelta * height
        val desiredBottom = (topOfLowestPrimary ?: primaryBottom) - gapPx - secondaryOnlyOffset
        val placement = SubtitleLayoutPlanner.placeSecondary(
            primary = occupied,
            viewportWidth = width,
            viewportHeight = height,
            secondaryHeight = textHeight,
            desiredBottom = desiredBottom,
            gapPx = gapPx,
            stepPx = gapPx,
        ) ?: return null
        val placedCue = cue.buildUpon()
            .setLine((placement.bottom / height).coerceIn(0f, 1f), Cue.LINE_TYPE_FRACTION)
            .setLineAnchor(Cue.ANCHOR_TYPE_END)
            .build()
        val left = cueLeft(placedCue, width, cueWidth)
        occupied += SubtitleBox(left, placement.top, left + cueWidth, placement.bottom)
        return placedCue
    }

    private fun estimatePrimaryBox(cue: Cue, width: Int, height: Int, fontPx: Float): SubtitleBox {
        val bitmap = cue.bitmap
        val nominalWidth = if (cue.size != Cue.DIMEN_UNSET) cue.size * width else width * 0.9f
        val boxHeight = if (bitmap != null) {
            (cue.bitmapHeight * height).coerceAtLeast(1f)
        } else {
            estimateTextHeight(cue.text?.toString().orEmpty(), nominalWidth, fontPx.coerceAtLeast(1f))
        }
        val cueWidth = if (bitmap != null) {
            (boxHeight * bitmap.width / bitmap.height).coerceAtMost(width.toFloat())
        } else if (cue.size != Cue.DIMEN_UNSET) {
            nominalWidth
        } else {
            nominalWidth
        }
        val left = cueLeft(cue, width, cueWidth)
        val top = when {
            cue.line == Cue.DIMEN_UNSET -> height * (1f - primaryBottomPaddingFraction) - boxHeight
            cue.lineType == Cue.LINE_TYPE_FRACTION -> when (cue.lineAnchor) {
                Cue.ANCHOR_TYPE_END -> cue.line * height - boxHeight
                Cue.ANCHOR_TYPE_MIDDLE -> cue.line * height - boxHeight / 2f
                else -> cue.line * height
            }
            cue.line < 0f -> height * (1f - primaryBottomPaddingFraction) + cue.line * fontPx - boxHeight
            else -> cue.line * fontPx
        } + primaryOffsetPx()
        return SubtitleBox(left, top, left + cueWidth, top + boxHeight)
    }

    private fun estimateSecondaryBox(
        cue: Cue,
        width: Int,
        height: Int,
        boxHeight: Float,
    ): SubtitleBox? {
        val cueWidth = if (cue.size != Cue.DIMEN_UNSET) cue.size * width else width * 0.9f
        val left = cueLeft(cue, width, cueWidth)
        val top = if (cue.line == Cue.DIMEN_UNSET) {
            height * (1f - primaryBottomPaddingFraction) - boxHeight
        } else if (cue.lineType == Cue.LINE_TYPE_NUMBER) {
            if (cue.line < 0f) height * (1f - primaryBottomPaddingFraction) + cue.line * (boxHeight / 2f)
            else cue.line * (boxHeight / 2f)
        } else when (cue.lineAnchor) {
            Cue.ANCHOR_TYPE_END -> cue.line * height - boxHeight
            Cue.ANCHOR_TYPE_MIDDLE -> cue.line * height - boxHeight / 2f
            else -> cue.line * height
        }
        return SubtitleBox(left, top, left + cueWidth, top + boxHeight)
    }

    private fun cueLeft(cue: Cue, width: Int, cueWidth: Float): Float {
        if (cue.position == Cue.DIMEN_UNSET) return (width - cueWidth) / 2f
        val anchorPosition = cue.position * width
        return when (cue.positionAnchor) {
            Cue.ANCHOR_TYPE_START -> anchorPosition
            Cue.ANCHOR_TYPE_END -> anchorPosition - cueWidth
            else -> anchorPosition - cueWidth / 2f
        }
    }

    private fun estimateTextHeight(text: String, availableWidth: Float, fontPx: Float): Float {
        val charsPerLine = (availableWidth / (fontPx * 0.52f)).toInt().coerceAtLeast(1)
        val lines = text.split('\n').sumOf { line ->
            maxOf(1, kotlin.math.ceil(line.length.toFloat() / charsPerLine).toInt())
        }
        return lines * fontPx * 1.25f
    }

    private fun primaryOffsetPx(): Float =
        if (primaryCanShift) -offsetDelta * view.height else 0f

    private fun updatePrimaryOffset() {
        onPrimaryVerticalOffset(primaryOffsetPx())
    }

    fun clear() {
        generation++
        selectedUrl = null
        selectedCodec = null
        timeline = null
        delayMs = 0L
        lastRenderedText = null
        primaryCues = emptyList()
        primaryCanShift = false
        updatePrimaryOffset()
        view.visibility = View.VISIBLE
        view.setCues(emptyList())
    }

    fun dispose() {
        if (disposed) return
        disposed = true
        clear()
        val source = synchronized(activeDataSourceLock) {
            activeDataSource.also { activeDataSource = null }
        }
        try {
            source?.close()
        } catch (error: IOException) {
            Log.w(TAG, "Could not close secondary subtitle source: ${error.message}")
        }
        executor.shutdownNow()
    }

    private fun applyStyle() {
        val weight = if (baseFontWeight >= 600) Typeface.BOLD else Typeface.NORMAL
        val edgeType = if (baseStrokeColor == Color.TRANSPARENT) {
            CaptionStyleCompat.EDGE_TYPE_NONE
        } else {
            CaptionStyleCompat.EDGE_TYPE_OUTLINE
        }
        view.setStyle(
            CaptionStyleCompat(
                textColorOverride ?: baseTextColor,
                baseBackgroundColor,
                Color.TRANSPARENT,
                edgeType,
                baseStrokeColor,
                Typeface.create(Typeface.DEFAULT, weight),
            ),
        )
        val size = fontSizeOverride ?: baseFontSize
        view.setFractionalTextSize(((size / 24f) * 0.06f).coerceAtLeast(0.01f))
        view.setBottomPaddingFraction(0f)
    }

    private fun readSubtitle(url: String): String {
        val source = dataSourceFactory().createDataSource()
        val output = ByteArrayOutputStream()
        synchronized(activeDataSourceLock) {
            if (disposed) {
                source.close()
                throw IOException("Secondary subtitle overlay is disposed")
            }
            activeDataSource = source
        }
        try {
            source.open(DataSpec(Uri.parse(url)))
            if (disposed) throw IOException("Secondary subtitle overlay is disposed")
            val buffer = ByteArray(8192)
            while (true) {
                if (disposed || Thread.currentThread().isInterrupted) {
                    throw IOException("Secondary subtitle overlay is disposed")
                }
                val read = source.read(buffer, 0, buffer.size)
                if (read == C.RESULT_END_OF_INPUT) break
                if (read <= 0) continue
                if (output.size() + read > MAX_SUBTITLE_BYTES) {
                    throw IllegalArgumentException("Subtitle file exceeds 16 MiB")
                }
                output.write(buffer, 0, read)
            }
        } finally {
            val closeSource = synchronized(activeDataSourceLock) {
                if (activeDataSource === source) {
                    activeDataSource = null
                    true
                } else {
                    false
                }
            }
            if (closeSource) source.close()
        }
        return output.toString(Charsets.UTF_8.name())
    }
}
