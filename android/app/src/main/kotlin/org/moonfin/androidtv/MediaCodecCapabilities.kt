package org.moonfin.androidtv

import android.media.MediaCodecInfo
import android.media.MediaCodecInfo.CodecProfileLevel
import android.media.MediaCodecList
import android.media.MediaFormat
import android.os.Build
import android.util.Size

object MediaCodecCapabilities {
    private const val MIME_VIDEO_AV1 = "video/av01"
    private const val MIME_VIDEO_VC1 = "video/wvc1"

    private fun buildCodecInfos(includeSoftwareDecoders: Boolean): Array<MediaCodecInfo> {
        val codecListKind = if (includeSoftwareDecoders) {
            MediaCodecList.ALL_CODECS
        } else {
            MediaCodecList.REGULAR_CODECS
        }
        return MediaCodecList(codecListKind).codecInfos
    }

    // REGULAR_CODECS still lists the software decoders, so a capability that
    // has to mean hardware needs its own filter.
    private fun isSoftwareDecoder(info: MediaCodecInfo): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            return info.isSoftwareOnly
        }
        val name = info.name
        return name.startsWith("OMX.google.", ignoreCase = true) ||
            name.startsWith("c2.android.", ignoreCase = true)
    }

    private object DolbyVisionProfiles {
        val profile5: Int by lazy {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                CodecProfileLevel.DolbyVisionProfileDvheStn
            } else {
                -1
            }
        }

        val profile7: Int by lazy {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                CodecProfileLevel.DolbyVisionProfileDvheDtb
            } else {
                -1
            }
        }

        val profile8: Int by lazy {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
                CodecProfileLevel.DolbyVisionProfileDvheSt
            } else {
                -1
            }
        }
    }

    private object Av1ProfileLevel {
        val profileMain10: Int by lazy {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                CodecProfileLevel.AV1ProfileMain10
            } else {
                0x2
            }
        }

        val profileMain10Hdr10: Int by lazy {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                CodecProfileLevel.AV1ProfileMain10HDR10
            } else {
                0x1000
            }
        }

        val profileMain10Hdr10Plus: Int by lazy {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                CodecProfileLevel.AV1ProfileMain10HDR10Plus
            } else {
                0x2000
            }
        }

        val dolbyVisionProfile10: Int by lazy {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                CodecProfileLevel.DolbyVisionProfileDvav110
            } else {
                0x400
            }
        }

        val level5: Int by lazy {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                CodecProfileLevel.AV1Level5
            } else {
                0x1000
            }
        }
    }

    private val avcLevels = listOf(
        CodecProfileLevel.AVCLevel1b to 9,
        CodecProfileLevel.AVCLevel1 to 10,
        CodecProfileLevel.AVCLevel11 to 11,
        CodecProfileLevel.AVCLevel12 to 12,
        CodecProfileLevel.AVCLevel13 to 13,
        CodecProfileLevel.AVCLevel2 to 20,
        CodecProfileLevel.AVCLevel21 to 21,
        CodecProfileLevel.AVCLevel22 to 22,
        CodecProfileLevel.AVCLevel3 to 30,
        CodecProfileLevel.AVCLevel31 to 31,
        CodecProfileLevel.AVCLevel32 to 32,
        CodecProfileLevel.AVCLevel4 to 40,
        CodecProfileLevel.AVCLevel41 to 41,
        CodecProfileLevel.AVCLevel42 to 42,
        CodecProfileLevel.AVCLevel5 to 50,
        CodecProfileLevel.AVCLevel51 to 51,
        CodecProfileLevel.AVCLevel52 to 52,
    )

    private val hevcLevels = listOf(
        CodecProfileLevel.HEVCMainTierLevel1 to 30,
        CodecProfileLevel.HEVCMainTierLevel2 to 60,
        CodecProfileLevel.HEVCMainTierLevel21 to 63,
        CodecProfileLevel.HEVCMainTierLevel3 to 90,
        CodecProfileLevel.HEVCMainTierLevel31 to 93,
        CodecProfileLevel.HEVCMainTierLevel4 to 120,
        CodecProfileLevel.HEVCMainTierLevel41 to 123,
        CodecProfileLevel.HEVCMainTierLevel5 to 150,
        CodecProfileLevel.HEVCMainTierLevel51 to 153,
        CodecProfileLevel.HEVCMainTierLevel52 to 156,
        CodecProfileLevel.HEVCMainTierLevel6 to 180,
        CodecProfileLevel.HEVCMainTierLevel61 to 183,
        CodecProfileLevel.HEVCMainTierLevel62 to 186,
    )

    // Keep in step with KnownDefects.modelsWithDoViHdr10PlusBug on the Dart
    // side, which matches the same models by name as a second net.
    private val modelsWithDoViHdr10PlusBug = setOf(
        "AFTKA", // Amazon Fire TV 4K Max (1st Gen)
        "AFTKM", // Amazon Fire TV 4K (2nd Gen)
        "AFTKRT", // Amazon Fire TV 4K Max (2nd Gen)
        "AFTMM", // Amazon Fire TV 4K (1st Gen)
        // MediaTek Sony BRAVIA models hard crash on Dolby Vision profile 8
        // streams that carry HDR10+ dynamic metadata, so they transcode
        // that range type like the MediaTek Fire TV models above.
        "BRAVIA 4K VH22",
    )

    private fun readBuildStringField(name: String): String? {
        return runCatching {
            Build::class.java.getField(name).get(null) as? String
        }.getOrNull()?.takeIf { it.isNotBlank() }
    }

    fun query(includeSoftwareDecoders: Boolean = false): Map<String, Any> {
        val codecInfos = buildCodecInfos(includeSoftwareDecoders)

        val supportsDvP5 = supportsDolbyVisionProfile(DolbyVisionProfiles.profile5, codecInfos)
        val supportsDvP7 = supportsDolbyVisionProfile(DolbyVisionProfiles.profile7, codecInfos)
        val supportsDvP8 = supportsDolbyVisionProfile(DolbyVisionProfiles.profile8, codecInfos)

        val supportsAvc = hasCodecForMime(MediaFormat.MIMETYPE_VIDEO_AVC, codecInfos)
        // Google's software decoder advertises AVC High 10 on every device, so
        // counting it here would have a box claim 10-bit H264 that only its
        // CPU can decode, and the server would direct play media that stutters.
        // A query that excluded software decoders has to exclude them here too.
        val avcHigh10Infos = if (includeSoftwareDecoders) {
            codecInfos
        } else {
            codecInfos.filterNot(::isSoftwareDecoder).toTypedArray()
        }
        val supportsAvcHigh10 = hasDecoder(
            MediaFormat.MIMETYPE_VIDEO_AVC,
            CodecProfileLevel.AVCProfileHigh10,
            CodecProfileLevel.AVCLevel4,
            avcHigh10Infos,
        )
        val avcMainLevel = getAvcLevel(CodecProfileLevel.AVCProfileMain, codecInfos)
        val avcHigh10Level = getAvcLevel(CodecProfileLevel.AVCProfileHigh10, avcHigh10Infos)

        val supportsHevc = hasCodecForMime(MediaFormat.MIMETYPE_VIDEO_HEVC, codecInfos)
        val supportsHevcMain10 = hasDecoder(
            MediaFormat.MIMETYPE_VIDEO_HEVC,
            CodecProfileLevel.HEVCProfileMain10,
            CodecProfileLevel.HEVCMainTierLevel4,
            codecInfos,
        )
        val hevcMainLevel = getHevcLevel(CodecProfileLevel.HEVCProfileMain, codecInfos)
        val hevcMain10Level = getHevcLevel(CodecProfileLevel.HEVCProfileMain10, codecInfos)

        val supportsHevcDolbyVision =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.N &&
                hasCodecForMime(MediaFormat.MIMETYPE_VIDEO_DOLBY_VISION, codecInfos)
        val supportsHevcDolbyVisionEl =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.N &&
                hasDecoder(
                    MediaFormat.MIMETYPE_VIDEO_DOLBY_VISION,
                    DolbyVisionProfiles.profile7,
                    CodecProfileLevel.DolbyVisionLevelHd24,
                    codecInfos,
                ) &&
                supportsMultiInstance(MediaFormat.MIMETYPE_VIDEO_HEVC, codecInfos)
        val supportsHevcHdr10 =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.N &&
                hasDecoder(
                    MediaFormat.MIMETYPE_VIDEO_HEVC,
                    CodecProfileLevel.HEVCProfileMain10HDR10,
                    CodecProfileLevel.HEVCMainTierLevel4,
                    codecInfos,
                )
        val supportsHevcHdr10Plus =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q &&
                hasDecoder(
                    MediaFormat.MIMETYPE_VIDEO_HEVC,
                    CodecProfileLevel.HEVCProfileMain10HDR10Plus,
                    CodecProfileLevel.HEVCMainTierLevel4,
                    codecInfos,
                )

        val supportsAv1 = hasCodecForMime(MIME_VIDEO_AV1, codecInfos)
        val supportsAv1Main10 = hasDecoder(
            MIME_VIDEO_AV1,
            Av1ProfileLevel.profileMain10,
            Av1ProfileLevel.level5,
            codecInfos,
        )
        val supportsAv1DolbyVision =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.N &&
                hasDecoder(
                    MediaFormat.MIMETYPE_VIDEO_DOLBY_VISION,
                    Av1ProfileLevel.dolbyVisionProfile10,
                    CodecProfileLevel.DolbyVisionLevelHd24,
                    codecInfos,
                )
        val supportsAv1Hdr10 = hasDecoder(
            MIME_VIDEO_AV1,
            Av1ProfileLevel.profileMain10Hdr10,
            Av1ProfileLevel.level5,
            codecInfos,
        )
        val supportsAv1Hdr10Plus = hasDecoder(
            MIME_VIDEO_AV1,
            Av1ProfileLevel.profileMain10Hdr10Plus,
            Av1ProfileLevel.level5,
            codecInfos,
        )

        val supportsVc1 = hasCodecForMime(MIME_VIDEO_VC1, codecInfos)

        val maxResolutionAvc = getMaxResolution(MediaFormat.MIMETYPE_VIDEO_AVC, codecInfos)
        val maxResolutionHevc = getMaxResolution(MediaFormat.MIMETYPE_VIDEO_HEVC, codecInfos)
        val maxResolutionAv1 = getMaxResolution(MIME_VIDEO_AV1, codecInfos)
        val maxResolutionVc1 = getMaxResolution(MIME_VIDEO_VC1, codecInfos)

        return mapOf(
            "supportsDvP5" to supportsDvP5,
            "supportsDvP7" to supportsDvP7,
            "supportsDvP8" to supportsDvP8,
            "supportsAvc" to supportsAvc,
            "supportsAvcHigh10" to supportsAvcHigh10,
            "avcMainLevel" to avcMainLevel,
            "avcHigh10Level" to avcHigh10Level,
            "supportsHevc" to supportsHevc,
            "supportsHevcMain10" to supportsHevcMain10,
            "hevcMainLevel" to hevcMainLevel,
            "hevcMain10Level" to hevcMain10Level,
            "supportsHevcDolbyVision" to supportsHevcDolbyVision,
            "supportsHevcDolbyVisionEl" to supportsHevcDolbyVisionEl,
            "supportsHevcHdr10" to supportsHevcHdr10,
            "supportsHevcHdr10Plus" to supportsHevcHdr10Plus,
            "supportsAv1" to supportsAv1,
            "supportsAv1Main10" to supportsAv1Main10,
            "supportsAv1DolbyVision" to supportsAv1DolbyVision,
            "supportsAv1Hdr10" to supportsAv1Hdr10,
            "supportsAv1Hdr10Plus" to supportsAv1Hdr10Plus,
            "supportsVc1" to supportsVc1,
            "maxResolutionAvc" to mapOf(
                "width" to maxResolutionAvc.width,
                "height" to maxResolutionAvc.height,
            ),
            "maxResolutionHevc" to mapOf(
                "width" to maxResolutionHevc.width,
                "height" to maxResolutionHevc.height,
            ),
            "maxResolutionAv1" to mapOf(
                "width" to maxResolutionAv1.width,
                "height" to maxResolutionAv1.height,
            ),
            "maxResolutionVc1" to mapOf(
                "width" to maxResolutionVc1.width,
                "height" to maxResolutionVc1.height,
            ),
            "deviceModel" to Build.MODEL,
            "deviceBoard" to Build.BOARD,
            "deviceHardware" to Build.HARDWARE,
            "deviceSocModel" to (readBuildStringField("SOC_MODEL") ?: ""),
            "knownHevcDoviHdr10PlusBug" to (Build.MODEL in modelsWithDoViHdr10PlusBug),
        )
    }

    fun queryDolbyVisionCapabilities(): Map<String, Boolean> {
        val all = query()
        return mapOf(
            "supportsDvP5" to (all["supportsDvP5"] as? Boolean == true),
            "supportsDvP7" to (all["supportsDvP7"] as? Boolean == true),
            "supportsDvP8" to (all["supportsDvP8"] as? Boolean == true),
        )
    }

    private fun supportsDolbyVisionProfile(
        profile: Int,
        codecInfos: Array<MediaCodecInfo>,
    ): Boolean {
        if (profile < 0) {
            return false
        }
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.N &&
            hasDecoder(
                MediaFormat.MIMETYPE_VIDEO_DOLBY_VISION,
                profile,
                CodecProfileLevel.DolbyVisionLevelHd24,
                codecInfos,
            )
    }

    private fun getAvcLevel(profile: Int, codecInfos: Array<MediaCodecInfo>): Int {
        val level = getDecoderLevel(MediaFormat.MIMETYPE_VIDEO_AVC, profile, codecInfos)
        return avcLevels.asReversed().find { level >= it.first }?.second ?: 0
    }

    private fun getHevcLevel(profile: Int, codecInfos: Array<MediaCodecInfo>): Int {
        val level = getDecoderLevel(MediaFormat.MIMETYPE_VIDEO_HEVC, profile, codecInfos)
        return hevcLevels.asReversed().find { level >= it.first }?.second ?: 0
    }

    private fun getDecoderLevel(
        mime: String,
        profile: Int,
        codecInfos: Array<MediaCodecInfo>,
    ): Int {
        var maxLevel = 0
        for (info in codecInfos) {
            if (info.isEncoder) {
                continue
            }
            val capabilities = runCatching {
                info.getCapabilitiesForType(mime)
            }.getOrNull() ?: continue
            for (profileLevel in capabilities.profileLevels) {
                if (profileLevel.profile == profile) {
                    maxLevel = maxOf(maxLevel, profileLevel.level)
                }
            }
        }
        return maxLevel
    }

    private fun hasDecoder(
        mime: String,
        profile: Int,
        level: Int,
        codecInfos: Array<MediaCodecInfo>,
    ): Boolean {
        for (info in codecInfos) {
            if (info.isEncoder) {
                continue
            }
            val capabilities = runCatching {
                info.getCapabilitiesForType(mime)
            }.getOrNull() ?: continue
            for (profileLevel in capabilities.profileLevels) {
                if (profileLevel.profile != profile) {
                    continue
                }
                if (profileLevel.level >= level) {
                    return true
                }
            }
        }
        return false
    }

    private fun hasCodecForMime(mime: String, codecInfos: Array<MediaCodecInfo>): Boolean {
        for (info in codecInfos) {
            if (info.isEncoder) {
                continue
            }
            if (info.supportedTypes.any { type -> type.equals(mime, ignoreCase = true) }) {
                return true
            }
        }
        return false
    }

    private fun supportsMultiInstance(mime: String, codecInfos: Array<MediaCodecInfo>): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return false
        }
        for (info in codecInfos) {
            if (info.isEncoder) {
                continue
            }
            if (!info.supportedTypes.any { type -> type.equals(mime, ignoreCase = true) }) {
                continue
            }
            val capabilities = runCatching {
                info.getCapabilitiesForType(mime)
            }.getOrNull() ?: continue
            if (capabilities.maxSupportedInstances > 1) {
                return true
            }
        }
        return false
    }

    private fun getMaxResolution(mime: String, codecInfos: Array<MediaCodecInfo>): Size {
        var maxWidth = 0
        var maxHeight = 0

        for (info in codecInfos) {
            if (info.isEncoder) {
                continue
            }

            val capabilities = runCatching {
                info.getCapabilitiesForType(mime)
            }.getOrNull() ?: continue
            val videoCapabilities = capabilities.videoCapabilities ?: continue
            val supportedWidth = videoCapabilities.supportedWidths?.upper ?: continue
            val supportedHeight = videoCapabilities.supportedHeights?.upper ?: continue

            maxWidth = maxOf(maxWidth, supportedWidth)
            maxHeight = maxOf(maxHeight, supportedHeight)
        }

        return Size(maxWidth, maxHeight)
    }
}

object DvCodecCapabilities {
    fun query(): Map<String, Boolean> = MediaCodecCapabilities.queryDolbyVisionCapabilities()
}
