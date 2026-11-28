package org.moonfin.nativevideo

/**
 * Decides when the FEL fold may decode a GOP and when it gives up.
 *
 * The first GOP after a start or a seek never gets a fit, so the fold can't
 * hold up the picture. One fold slower than the GOP it fitted means the box
 * can't decode next to playback without stalling it, so that keeps the fold
 * off for the rest of the app session. Over a whole playback, decoding may
 * take at most half the time the content plays for. A failure that won't go
 * away stops it at once, and one that comes from the device itself also keeps
 * it off for every later playback in this app session.
 */
internal class FelFoldPolicy {

    /** Why folding stopped for this playback, null while it runs. */
    var stopReason: String? = null
        private set

    private var skipNextFit = true
    private var playedUs = 0L
    private var foldMs = 0L
    private var decodedGops = 0
    private var failuresInARow = 0

    /** The share of playback time spent decoding so far, in percent. */
    val sharePercent: Long get() = if (playedUs > 0) foldMs * 100_000 / playedUs else 0

    /** Whether the GOP being released may get a fit. Each call uses up the turn of one GOP. */
    fun takeFitTurn(): Boolean {
        val fit = !skipNextFit && stopReason == null
        skipNextFit = false
        return fit
    }

    fun seeked() {
        skipNextFit = true
    }

    /** One GOP went out, playing for [durationUs], with [foldMs] spent decoding it or null when it wasn't. */
    fun gopReleased(durationUs: Long, foldMs: Long?) {
        playedUs += durationUs
        if (foldMs != null) {
            val gopMs = durationUs / 1000
            val ceilingMs = if (decodedGops == 0) FIRST_FOLD_CEILING_MS else maxOf(gopMs, MIN_FOLD_CEILING_MS)
            this.foldMs += foldMs
            decodedGops++
            if (foldMs > ceilingMs) {
                failed("a fold took $foldMs ms for a GOP that plays $gopMs ms", FelLayerDecoder.Severity.DEVICE)
                return
            }
        }
        if (playedUs >= WARM_UP_US && this.foldMs * 1000 > playedUs * MAX_SHARE_PERCENT / 100) {
            stop("decoding took $sharePercent% of the playback time")
        }
    }

    fun succeeded() {
        failuresInARow = 0
    }

    fun failed(problem: String, severity: FelLayerDecoder.Severity) {
        failuresInARow++
        when {
            severity == FelLayerDecoder.Severity.DEVICE -> {
                deviceProblem = problem
                stop(problem)
            }
            severity == FelLayerDecoder.Severity.PLAYBACK -> stop(problem)
            failuresInARow >= MAX_FAILURES_IN_A_ROW -> stop(problem)
        }
    }

    private fun stop(reason: String) {
        if (stopReason == null) stopReason = reason
    }

    companion object {
        /** How long one fold may decode for, from opening the decoders to its last picture. */
        internal const val DECODE_BUDGET_MS = 4_000L

        // The first fold also opens both decoders, so it gets the whole budget, plus a second
        // since the deadline is only checked between pictures.
        private const val FIRST_FOLD_CEILING_MS = DECODE_BUDGET_MS + 1_000L

        // A short GOP at a cut or at the end still allows a second, so it doesn't count against the box.
        private const val MIN_FOLD_CEILING_MS = 1_000L
        private const val MAX_SHARE_PERCENT = 50
        private const val WARM_UP_US = 20_000_000L
        private const val MAX_FAILURES_IN_A_ROW = 3

        /** A failure that comes from this device's decoder, which keeps the fold off for the app session. */
        @Volatile
        var deviceProblem: String? = null
            internal set
    }
}
