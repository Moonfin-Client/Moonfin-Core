package org.moonfin.androidtv

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioFormat
import android.media.AudioManager
import android.os.Build
import android.media.AudioAttributes
import android.media.AudioTrack
import android.media.MediaCodecInfo
import android.media.MediaCodecList
import android.media.MediaFormat
import androidx.annotation.RequiresApi

object AudioCapabilities {
    private const val ROUTE_HDMI = "hdmi"
    private const val ROUTE_ARC = "arc"
    private const val ROUTE_EARC = "earc"
    private const val ROUTE_BLUETOOTH = "bluetooth"
    private const val ROUTE_SPEAKER = "speaker"
    private const val ROUTE_HEADPHONES = "headphones"
    private const val ROUTE_OTHER = "other"

    private val directAudioAttributes = AudioAttributes.Builder()
        .setUsage(AudioAttributes.USAGE_MEDIA)
        .setContentType(AudioAttributes.CONTENT_TYPE_MOVIE)
        .build()

    private val encodingDolbyTrueHdJoc: Int? = resolveEncodingAny(
        listOf(
            "ENCODING_DOLBY_TRUEHD_JOC",
            "ENCODING_TRUEHD_JOC",
        ),
    )

    private data class DecodeCapabilities(
        val canDecodeAc3: Boolean,
        val canDecodeEac3: Boolean,
        val canDecodeDts: Boolean,
        val canDecodeDtsHd: Boolean,
        val canDecodeTrueHd: Boolean,
        val canDecodeFlac: Boolean,
    )

    private val baselineCapabilities = mapOf(
        "supportsAc3" to false,
        "supportsDts" to false,
        "supportsTrueHd" to false,
        "supportsPcm" to true,
        "supportsAac" to true,
        "canDecodeAc3" to true,
        "canDecodeEac3" to true,
        "canDecodeDts" to true,
        "canDecodeDtsHd" to true,
        "canDecodeTrueHd" to true,
        "canDecodeFlac" to true,
        "canPassthroughAc3" to false,
        "canPassthroughEac3" to false,
        "canPassthroughEac3Joc" to false,
        "canPassthroughDts" to false,
        "canPassthroughDtsHd" to false,
        "canPassthroughDtsX" to false,
        "canPassthroughTrueHd" to false,
        "canPassthroughTrueHdJoc" to false,
        "maxPcmChannels" to 2,
        "activeRouteType" to ROUTE_OTHER,
        "routeSupportsHdAudio" to false,
    )

    private fun isBitstreamOutputDevice(device: AudioDeviceInfo): Boolean {
        return when (device.type) {
            AudioDeviceInfo.TYPE_HDMI,
            AudioDeviceInfo.TYPE_HDMI_ARC,
            AudioDeviceInfo.TYPE_LINE_DIGITAL,
            -> true
            else -> Build.VERSION.SDK_INT >= Build.VERSION_CODES.S &&
                device.type == AudioDeviceInfo.TYPE_HDMI_EARC
        }
    }

    fun query(context: Context): Map<String, Any> {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return baselineCapabilities
        }

        val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as? AudioManager
            ?: return baselineCapabilities

        val outputDevices = audioManager
            .getDevices(AudioManager.GET_DEVICES_OUTPUTS)
            .toList()
        val bitstreamDevices = outputDevices.filter(::isBitstreamOutputDevice)
        val speakerDevices =
            outputDevices.filter { it.type == AudioDeviceInfo.TYPE_BUILTIN_SPEAKER }
        val activeDevices = resolveActiveMediaDevices(audioManager)
        val routeDevices =
            if (activeDevices.isNotEmpty()) activeDevices else outputDevices
        val routeType = classifyRoute(routeDevices.map { it.type }.toSet())
        val routeSupportsHdAudio = routeType == ROUTE_EARC
        val allowSpeakerDolbyFallback =
            routeType == ROUTE_SPEAKER || routeType == ROUTE_OTHER

        val decodeCapabilities = queryLocalDecodeCapabilities()

        val encodings = mutableSetOf<Int>()
        encodings += collectEncodings(bitstreamDevices)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            encodings += collectProfileEncodingsApi31(bitstreamDevices)
        }

        val speakerEncodings = mutableSetOf<Int>()
        speakerEncodings += collectEncodings(speakerDevices)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            speakerEncodings += collectProfileEncodingsApi31(speakerDevices)
        }

        var canPassthroughAc3 = encodings.contains(AudioFormat.ENCODING_AC3)
        var canPassthroughEac3 = encodings.contains(AudioFormat.ENCODING_E_AC3)
        var canPassthroughEac3Joc =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.P &&
                encodings.contains(AudioFormat.ENCODING_E_AC3_JOC)
        var canPassthroughDts = encodings.contains(AudioFormat.ENCODING_DTS)
        var canPassthroughDtsHd = encodings.contains(AudioFormat.ENCODING_DTS_HD)
        var canPassthroughDtsX =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE &&
                (encodings.contains(AudioFormat.ENCODING_DTS_UHD_P1) ||
                    encodings.contains(AudioFormat.ENCODING_DTS_UHD_P2))
        var canPassthroughTrueHd = encodings.contains(AudioFormat.ENCODING_DOLBY_TRUEHD)
        var canPassthroughTrueHdJoc =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE &&
                supportsEncoding(encodings, encodingDolbyTrueHdJoc)

        if (allowSpeakerDolbyFallback) {
            canPassthroughAc3 =
                canPassthroughAc3 || speakerEncodings.contains(AudioFormat.ENCODING_AC3)
            canPassthroughEac3 =
                canPassthroughEac3 || speakerEncodings.contains(AudioFormat.ENCODING_E_AC3)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                canPassthroughEac3Joc =
                    canPassthroughEac3Joc ||
                        speakerEncodings.contains(AudioFormat.ENCODING_E_AC3_JOC)
            }
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            val directProfileEncodings = getDirectProfileEncodingsApi33(audioManager)
            canPassthroughAc3 =
                canPassthroughAc3 ||
                    directProfileEncodings.contains(AudioFormat.ENCODING_AC3) ||
                    supportsDirectPlaybackApi33(audioManager, AudioFormat.ENCODING_AC3)
            canPassthroughEac3 =
                canPassthroughEac3 ||
                    directProfileEncodings.contains(AudioFormat.ENCODING_E_AC3) ||
                    supportsDirectPlaybackApi33(audioManager, AudioFormat.ENCODING_E_AC3)
            canPassthroughDts =
                canPassthroughDts ||
                    directProfileEncodings.contains(AudioFormat.ENCODING_DTS) ||
                    supportsDirectPlaybackApi33(audioManager, AudioFormat.ENCODING_DTS)
            canPassthroughDtsHd =
                canPassthroughDtsHd ||
                    directProfileEncodings.contains(AudioFormat.ENCODING_DTS_HD) ||
                    supportsDirectPlaybackApi33(audioManager, AudioFormat.ENCODING_DTS_HD)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                canPassthroughDtsX =
                    canPassthroughDtsX ||
                        directProfileEncodings.contains(AudioFormat.ENCODING_DTS_UHD_P1) ||
                        directProfileEncodings.contains(AudioFormat.ENCODING_DTS_UHD_P2) ||
                        supportsDirectPlaybackApi33(audioManager, AudioFormat.ENCODING_DTS_UHD_P1) ||
                        supportsDirectPlaybackApi33(audioManager, AudioFormat.ENCODING_DTS_UHD_P2)
            }
            canPassthroughTrueHd =
                canPassthroughTrueHd ||
                    directProfileEncodings.contains(AudioFormat.ENCODING_DOLBY_TRUEHD) ||
                    supportsDirectPlaybackApi33(audioManager, AudioFormat.ENCODING_DOLBY_TRUEHD)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                val trueHdJocEncoding = encodingDolbyTrueHdJoc
                canPassthroughTrueHdJoc =
                    canPassthroughTrueHdJoc ||
                        (trueHdJocEncoding != null && (
                            directProfileEncodings.contains(trueHdJocEncoding) ||
                                supportsDirectPlaybackApi33(audioManager, trueHdJocEncoding)
                            ))
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                canPassthroughEac3Joc =
                    canPassthroughEac3Joc ||
                        directProfileEncodings.contains(AudioFormat.ENCODING_E_AC3_JOC) ||
                        supportsDirectPlaybackApi33(audioManager, AudioFormat.ENCODING_E_AC3_JOC)
            }
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            canPassthroughAc3 =
                canPassthroughAc3 || supportsDirectPlaybackLegacy(AudioFormat.ENCODING_AC3)
            canPassthroughEac3 =
                canPassthroughEac3 || supportsDirectPlaybackLegacy(AudioFormat.ENCODING_E_AC3)
            canPassthroughDts =
                canPassthroughDts || supportsDirectPlaybackLegacy(AudioFormat.ENCODING_DTS)
            canPassthroughDtsHd =
                canPassthroughDtsHd || supportsDirectPlaybackLegacy(AudioFormat.ENCODING_DTS_HD)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                canPassthroughDtsX =
                    canPassthroughDtsX ||
                        supportsDirectPlaybackLegacy(AudioFormat.ENCODING_DTS_UHD_P1) ||
                        supportsDirectPlaybackLegacy(AudioFormat.ENCODING_DTS_UHD_P2)
            }
            canPassthroughTrueHd =
                canPassthroughTrueHd ||
                    supportsDirectPlaybackLegacy(AudioFormat.ENCODING_DOLBY_TRUEHD)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                val trueHdJocEncoding = encodingDolbyTrueHdJoc
                canPassthroughTrueHdJoc =
                    canPassthroughTrueHdJoc ||
                        (trueHdJocEncoding != null &&
                            supportsDirectPlaybackLegacy(trueHdJocEncoding))
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                canPassthroughEac3Joc =
                    canPassthroughEac3Joc ||
                        supportsDirectPlaybackLegacy(AudioFormat.ENCODING_E_AC3_JOC)
            }
        }

        // TrueHD-Atmos (JOC) capability must come from a real probe only. We no
        // longer infer it from plain TrueHD support + route: that over-reported
        // Atmos on receivers that decode TrueHD but not Atmos, and under the
        // capability-authoritative resolvers that would auto-advertise Atmos the
        // AVR can't handle. Users who know their receiver supports it can still
        // turn the TrueHD-Atmos passthrough toggle on explicitly (override wins).


        val supportsAc3 = canPassthroughAc3 || canPassthroughEac3
        val supportsDts = canPassthroughDts || canPassthroughDtsHd || canPassthroughDtsX
        val supportsTrueHd = canPassthroughTrueHd || canPassthroughTrueHdJoc

        val maxPcmChannels = detectMaxPcmChannels(
            if (activeDevices.isNotEmpty()) activeDevices else bitstreamDevices,
            routeType,
        )

        return mapOf(
            "supportsAc3" to supportsAc3,
            "supportsDts" to supportsDts,
            "supportsTrueHd" to supportsTrueHd,
            "supportsPcm" to true,
            "supportsAac" to true,
            "canDecodeAc3" to decodeCapabilities.canDecodeAc3,
            "canDecodeEac3" to decodeCapabilities.canDecodeEac3,
            "canDecodeDts" to decodeCapabilities.canDecodeDts,
            "canDecodeDtsHd" to decodeCapabilities.canDecodeDtsHd,
            "canDecodeTrueHd" to decodeCapabilities.canDecodeTrueHd,
            "canDecodeFlac" to decodeCapabilities.canDecodeFlac,
            "canPassthroughAc3" to canPassthroughAc3,
            "canPassthroughEac3" to canPassthroughEac3,
            "canPassthroughEac3Joc" to canPassthroughEac3Joc,
            "canPassthroughDts" to canPassthroughDts,
            "canPassthroughDtsHd" to canPassthroughDtsHd,
            "canPassthroughDtsX" to canPassthroughDtsX,
            "canPassthroughTrueHd" to canPassthroughTrueHd,
            "canPassthroughTrueHdJoc" to canPassthroughTrueHdJoc,
            "maxPcmChannels" to maxPcmChannels,
            "activeRouteType" to routeType,
            "routeSupportsHdAudio" to routeSupportsHdAudio,
        )
    }

    private fun collectEncodings(devices: List<AudioDeviceInfo>): Set<Int> {
        return devices.asSequence()
            .flatMap { it.encodings.asSequence() }
            .toSet()
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private fun collectProfileEncodingsApi31(devices: List<AudioDeviceInfo>): Set<Int> {
        return devices.asSequence()
            .flatMap { device -> device.audioProfiles.asSequence() }
            .map { profile -> profile.format }
            .toSet()
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private fun getDirectProfileEncodingsApi33(audioManager: AudioManager): Set<Int> {
        return audioManager
            .getDirectProfilesForAttributes(directAudioAttributes)
            .asSequence()
            .map { profile -> profile.format }
            .toSet()
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private fun supportsDirectPlaybackApi33(audioManager: AudioManager, encoding: Int): Boolean {
        for (format in buildCandidateFormats(encoding)) {
            val support = AudioManager.getDirectPlaybackSupport(
                format,
                directAudioAttributes,
            )
            if (support != AudioManager.DIRECT_PLAYBACK_NOT_SUPPORTED) {
                return true
            }
        }
        return false
    }

    @RequiresApi(Build.VERSION_CODES.Q)
    private fun supportsDirectPlaybackLegacy(encoding: Int): Boolean {
        for (format in buildCandidateFormats(encoding)) {
            if (AudioTrack.isDirectPlaybackSupported(format, directAudioAttributes)) {
                return true
            }
        }
        return false
    }

    private fun buildCandidateFormats(encoding: Int): List<AudioFormat> {
        val channelMasks = intArrayOf(
            AudioFormat.CHANNEL_OUT_7POINT1_SURROUND,
            AudioFormat.CHANNEL_OUT_5POINT1,
            AudioFormat.CHANNEL_OUT_STEREO,
        )
        val sampleRates = intArrayOf(48_000, 96_000, 192_000)
        val results = mutableListOf<AudioFormat>()

        for (channelMask in channelMasks) {
            for (sampleRate in sampleRates) {
                val format = runCatching {
                    AudioFormat.Builder()
                        .setEncoding(encoding)
                        .setChannelMask(channelMask)
                        .setSampleRate(sampleRate)
                        .build()
                }.getOrNull()

                if (format != null) {
                    results.add(format)
                }
            }
        }

        return results
    }

    private fun queryLocalDecodeCapabilities(): DecodeCapabilities {
        val codecInfos = MediaCodecList(MediaCodecList.REGULAR_CODECS).codecInfos

        return DecodeCapabilities(
            canDecodeAc3 = hasDecoderForAnyMime(
                codecInfos,
                setOf("audio/ac3"),
            ),
            canDecodeEac3 = hasDecoderForAnyMime(
                codecInfos,
                setOf("audio/eac3"),
            ),
            canDecodeDts = hasDecoderForAnyMime(
                codecInfos,
                setOf("audio/vnd.dts", "audio/dts"),
            ),
            canDecodeDtsHd = hasDecoderForAnyMime(
                codecInfos,
                setOf("audio/vnd.dts.hd"),
            ),
            canDecodeTrueHd = hasDecoderForAnyMime(
                codecInfos,
                setOf("audio/true-hd"),
            ),
            canDecodeFlac = hasDecoderForAnyMime(
                codecInfos,
                setOf(MediaFormat.MIMETYPE_AUDIO_FLAC, "audio/x-flac"),
            ),
        )
    }

    private fun hasDecoderForAnyMime(
        codecInfos: Array<MediaCodecInfo>,
        mimeTypes: Set<String>,
    ): Boolean {
        return codecInfos.any { info ->
            !info.isEncoder && info.supportedTypes.any { type ->
                mimeTypes.any { it.equals(type, ignoreCase = true) }
            }
        }
    }

    private fun resolveEncoding(fieldName: String): Int? {
        return runCatching {
            AudioFormat::class.java.getField(fieldName).getInt(null)
        }.getOrNull()
    }

    private fun resolveEncodingAny(fieldNames: List<String>): Int? {
        for (fieldName in fieldNames) {
            val value = resolveEncoding(fieldName)
            if (value != null) {
                return value
            }
        }
        return null
    }

    private fun supportsEncoding(encodings: Set<Int>, encoding: Int?): Boolean {
        return encoding != null && encodings.contains(encoding)
    }

    /**
     * Devices the system would actually route media playback to right now.
     * Only available on API 33+; an empty result means "fall back to the
     * legacy enumeration heuristic".
     */
    private fun resolveActiveMediaDevices(audioManager: AudioManager): List<AudioDeviceInfo> {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            return emptyList()
        }
        return runCatching {
            audioManager.getAudioDevicesForAttributes(directAudioAttributes).toList()
        }.getOrDefault(emptyList())
    }

    /**
     * Classifies the output route from a set of device types, ranking the
     * built-in speaker last so any real external output (HDMI, ARC/eARC,
     * optical) wins. Fed the actual playback-routed devices on API 33+, or all
     * enumerated outputs on older APIs: external outputs are generally only
     * listed when connected, while the built-in speaker is always enumerated,
     * so ranking it last keeps the enumerated path correct in practice too.
     */
    private fun classifyRoute(types: Set<Int>): String {
        if (types.any(::isBluetoothType)) {
            return ROUTE_BLUETOOTH
        }
        if (types.contains(AudioDeviceInfo.TYPE_WIRED_HEADPHONES) ||
            types.contains(AudioDeviceInfo.TYPE_WIRED_HEADSET) ||
            types.contains(AudioDeviceInfo.TYPE_USB_HEADSET)
        ) {
            return ROUTE_HEADPHONES
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S &&
            types.contains(AudioDeviceInfo.TYPE_HDMI_EARC)
        ) {
            return ROUTE_EARC
        }
        if (types.contains(AudioDeviceInfo.TYPE_HDMI_ARC)) {
            return ROUTE_ARC
        }
        if (types.contains(AudioDeviceInfo.TYPE_HDMI) ||
            types.contains(AudioDeviceInfo.TYPE_LINE_DIGITAL)
        ) {
            return ROUTE_HDMI
        }
        if (types.contains(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER) ||
            types.contains(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE)
        ) {
            return ROUTE_SPEAKER
        }
        return ROUTE_OTHER
    }

    private fun detectMaxPcmChannels(devices: List<AudioDeviceInfo>, routeType: String): Int {
        var maxVal = 0
        for (device in devices) {
            val counts = device.channelCounts
            if (counts != null) {
                for (count in counts) {
                    if (count > maxVal) {
                        maxVal = count
                    }
                }
            }
        }
        if (maxVal > 0) {
            return maxVal
        }
        return estimateMaxPcmChannels(routeType)
    }

    private fun estimateMaxPcmChannels(routeType: String): Int {
        return when (routeType) {
            ROUTE_EARC -> 8
            ROUTE_ARC -> 6
            ROUTE_HDMI -> 8
            else -> 2
        }
    }

    private fun isBluetoothType(type: Int): Boolean {
        return when (type) {
            AudioDeviceInfo.TYPE_BLUETOOTH_A2DP,
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            -> true
            else -> Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && (
                type == AudioDeviceInfo.TYPE_BLE_HEADSET ||
                    type == AudioDeviceInfo.TYPE_BLE_SPEAKER
                )
        }
    }
}
