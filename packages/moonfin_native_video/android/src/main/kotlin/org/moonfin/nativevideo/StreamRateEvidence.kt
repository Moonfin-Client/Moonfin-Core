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
)
