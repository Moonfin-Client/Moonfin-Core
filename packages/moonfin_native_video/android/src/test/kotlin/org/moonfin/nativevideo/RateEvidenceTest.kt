package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class RateEvidenceTest {
    @Test fun `event serialization preserves interlaced picture rate and applied field rate`() {
        val evidence = RateEvidence.from(
            RateChoice(59.94f, RateSource.MEASURED, fieldRateApplied = true),
            StreamRateEvidence(29.97f, StreamScanType.INTERLACED),
        )
        assertEquals(
            mapOf(
                "frameRate" to 59.939998626708984,
                "source" to "measured",
                "fieldRateApplied" to true,
                "scanType" to "interlaced",
            ),
            evidence.eventFields(),
        )
    }

    @Test fun `unknown or mismatched scan evidence serializes as null`() {
        val unknown = RateEvidence.from(
            RateChoice(59.94f, RateSource.MEASURED),
            StreamRateEvidence(29.97f, StreamScanType.UNKNOWN),
        )
        assertEquals(null, unknown.eventFields()["scanType"])
        val mismatched = RateEvidence.from(
            RateChoice(59.94f, RateSource.MEASURED),
            StreamRateEvidence(25f, StreamScanType.INTERLACED),
        )
        assertEquals(null, mismatched.eventFields()["scanType"])
    }

    @Test
    fun `header evidence differing only by interlaced versus repeated fields is the same rate`() {
        val interlaced = StreamRateEvidence(29.97f, StreamScanType.INTERLACED, 720, 480)
        val repeated = StreamRateEvidence(29.97f, StreamScanType.REPEATED_FIELDS, 720, 480)

        assertTrue(interlaced.sameRateAs(repeated))
        assertFalse(interlaced.sameRateAs(StreamRateEvidence(23.976f, StreamScanType.PROGRESSIVE, 720, 480)))
        assertFalse(interlaced.sameRateAs(StreamRateEvidence(29.97f, StreamScanType.PROGRESSIVE, 720, 480)))
        assertFalse(interlaced.sameRateAs(StreamRateEvidence(25f, StreamScanType.INTERLACED, 720, 480)))
        assertFalse(interlaced.sameRateAs(null))
    }
}
