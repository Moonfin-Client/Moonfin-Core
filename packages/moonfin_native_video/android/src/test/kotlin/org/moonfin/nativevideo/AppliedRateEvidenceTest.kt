package org.moonfin.nativevideo

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class AppliedRateEvidenceTest {
    private fun measured(fieldRateApplied: Boolean, scan: StreamScanType?) = RateEvidence(
        RateChoice(59.94f, RateSource.MEASURED, fieldRateApplied),
        scan,
    )

    @Test fun `same output updates interlaced evidence to progressive without a correction event`() {
        val applied = AppliedRateEvidence()
        applied.set(measured(fieldRateApplied = true, scan = StreamScanType.INTERLACED))
        val progressive = measured(fieldRateApplied = false, scan = StreamScanType.PROGRESSIVE)

        val update = applied.updateSameOutput(progressive, eligible = true)

        assertEquals(progressive, update)
        assertEquals(
            mapOf(
                "event" to "frameRateDecision",
                "reason" to "evidence updated",
                "elapsedMs" to 8_000L,
                "frameRate" to 59.939998626708984,
                "source" to "measured",
                "fieldRateApplied" to false,
                "scanType" to "progressive",
            ),
            applied.metadataDecisionEvent(update!!, 8_000L),
        )
    }

    @Test fun `same output supports reverse transitions and unknown scan serializes null`() {
        val applied = AppliedRateEvidence()
        val progressive = measured(fieldRateApplied = false, scan = StreamScanType.PROGRESSIVE)
        applied.set(progressive)
        val interlaced = measured(fieldRateApplied = true, scan = StreamScanType.INTERLACED)
        assertEquals(interlaced, applied.updateSameOutput(interlaced, eligible = true))

        val unknown = measured(fieldRateApplied = false, scan = null)
        val update = applied.updateSameOutput(unknown, eligible = true)!!
        assertEquals(null, applied.metadataDecisionEvent(update, 9_000L)["scanType"])
    }

    @Test fun `untrusted and different output evidence cannot replace applied metadata`() {
        val applied = AppliedRateEvidence()
        val original = measured(fieldRateApplied = true, scan = StreamScanType.INTERLACED)
        applied.set(original)

        assertNull(applied.updateSameOutput(measured(false, StreamScanType.PROGRESSIVE), eligible = false))
        assertNull(
            applied.updateSameOutput(
                RateEvidence(RateChoice(25f, RateSource.MEASURED), StreamScanType.PROGRESSIVE),
                eligible = true,
            ),
        )
        val nowProgressive = measured(false, StreamScanType.PROGRESSIVE)
        assertEquals(nowProgressive, applied.updateSameOutput(nowProgressive, eligible = true))
    }

    @Test fun `same provenance fps jitter updates baseline without emitting metadata event`() {
        val applied = AppliedRateEvidence()
        val original = RateEvidence(
            RateChoice(59.94f, RateSource.MEASURED, fieldRateApplied = true),
            StreamScanType.INTERLACED,
        )
        applied.set(original)
        val jitter = RateEvidence(
            RateChoice(59.95f, RateSource.MEASURED, fieldRateApplied = true),
            StreamScanType.INTERLACED,
        )

        assertNull(applied.updateSameOutput(jitter, eligible = true))
    }

    @Test fun `different normalized output families remain correction candidates`() {
        val applied = AppliedRateEvidence()
        applied.set(RateEvidence(RateChoice(59.94f, RateSource.MEASURED), StreamScanType.INTERLACED))
        assertNull(
            applied.updateSameOutput(
                RateEvidence(RateChoice(60f, RateSource.MEASURED), StreamScanType.PROGRESSIVE),
                eligible = true,
            ),
        )
        applied.set(RateEvidence(RateChoice(23.976f, RateSource.MEASURED), StreamScanType.PROGRESSIVE))
        assertNull(
            applied.updateSameOutput(
                RateEvidence(RateChoice(24f, RateSource.MEASURED), StreamScanType.INTERLACED),
                eligible = true,
            ),
        )
    }

    @Test fun `metadata update feeds contrary current rate to clear pending candidate`() {
        val applied = AppliedRateEvidence()
        applied.set(measured(fieldRateApplied = true, StreamScanType.INTERLACED))
        val correction = LiveRateCorrection().apply { begin(0L) }
        val pending = RateEvidence(RateChoice(25f, RateSource.MEASURED), StreamScanType.PROGRESSIVE)
        val epoch = CorrectionProgress.Epoch("p", 0, 0)
        correction.onReading(300_000L, CorrectionProgress.Sample(epoch, 0L), pending, fits = false)

        val metadataUpdate = measured(fieldRateApplied = false, scan = StreamScanType.PROGRESSIVE)
        assertEquals(metadataUpdate, applied.updateSameOutput(metadataUpdate, eligible = true))
        correction.onReading(301_000L, CorrectionProgress.Sample(epoch, 1_000L), metadataUpdate, fits = true)
        assertNull(correction.nextCheckAtMs())
        assertNull(correction.takeDue(305_000L, CorrectionProgress.Sample(epoch, 5_000L)))
    }
}
