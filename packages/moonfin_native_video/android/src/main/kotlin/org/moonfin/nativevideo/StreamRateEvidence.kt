package org.moonfin.nativevideo

/** Scan information read from the current stream's video headers. */
internal enum class StreamScanType {
    UNKNOWN,
    PROGRESSIVE,
    INTERLACED,
    /** Progressive pictures carried with repeat fields in an interlaced sequence. */
    REPEATED_FIELDS,
}

/** A stream-header picture rate and its scan provenance. */
internal data class StreamRateEvidence(
    val frameRate: Float,
    val scanType: StreamScanType,
    /** The coded picture size from the same header, 0 when it wasn't read. */
    val width: Int = 0,
    val height: Int = 0,
) {
    /**
     * Whether [other] gives the same display rate. INTERLACED and
     * REPEATED_FIELDS at one rate both double the same way, so a switch
     * between them within a sequence says nothing new.
     */
    fun sameRateAs(other: StreamRateEvidence?): Boolean =
        other != null &&
            scanType.isFieldScanned() == other.scanType.isFieldScanned() &&
            (scanType.isFieldScanned() || scanType == other.scanType) &&
            kotlin.math.abs(frameRate - other.frameRate) <= frameRate * 0.0001f &&
            width == other.width && height == other.height
}

internal fun StreamScanType.isFieldScanned(): Boolean =
    this == StreamScanType.INTERLACED || this == StreamScanType.REPEATED_FIELDS
