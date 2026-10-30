package org.moonfin.nativevideo

/** A selected rate and the trusted scan evidence that participated in it. */
internal data class RateEvidence(
    val choice: RateChoice,
    val scanType: StreamScanType?,
) {
    fun eventFields(): Map<String, Any?> = mapOf(
        "frameRate" to choice.fps?.toDouble(),
        "source" to choice.source.wireValue,
        "fieldRateApplied" to choice.fieldRateApplied,
        "scanType" to scanType?.name?.lowercase(),
    )

    companion object {
        fun from(choice: RateChoice, header: StreamRateEvidence?): RateEvidence {
            val headerType = header?.scanType?.takeIf { it != StreamScanType.UNKNOWN }
            val selectedRate = choice.fps?.let { if (choice.fieldRateApplied) it / 2f else it }
            val scanType = when {
                headerType == null || selectedRate == null ||
                    !header.frameRate.isFinite() || header.frameRate <= 0f -> null
                choice.source == RateSource.HEADER -> headerType
                choice.source == RateSource.MEASURED &&
                    kotlin.math.abs(header.frameRate - selectedRate) / header.frameRate <= 0.01f -> headerType
                else -> null
            }
            return RateEvidence(choice, scanType)
        }
    }
}
