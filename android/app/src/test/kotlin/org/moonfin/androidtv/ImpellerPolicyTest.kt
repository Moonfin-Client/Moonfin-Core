package org.moonfin.androidtv

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class ImpellerPolicyTest {

    private fun qualifies(
        sdkInt: Int = 34,
        manufacturer: String = "Google",
        is64Bit: Boolean = true,
        vulkan11: Boolean = true,
    ) = ImpellerPolicy.deviceQualifies(sdkInt, manufacturer, is64Bit, vulkan11)

    @Test
    fun `a 64-bit Android 12 box with Vulkan 1_1 qualifies`() {
        assertTrue(qualifies(sdkInt = 31))
    }

    @Test
    fun `Android 11, a 32-bit process or no Vulkan 1_1 doesn't qualify`() {
        assertFalse(qualifies(sdkInt = 30))
        assertFalse(qualifies(is64Bit = false))
        assertFalse(qualifies(vulkan11 = false))
    }

    @Test
    fun `Shield and Fire TV don't qualify, whatever the case of the name`() {
        assertFalse(qualifies(manufacturer = "NVIDIA"))
        assertFalse(qualifies(manufacturer = "nvidia"))
        assertFalse(qualifies(manufacturer = "Amazon"))
    }

    @Test
    fun `Mali G-series stays on Vulkan`() {
        assertTrue(ImpellerPolicy.gpuStaysOnVulkan("Mali-G31"))
        assertTrue(ImpellerPolicy.gpuStaysOnVulkan("Mali-G57"))
    }

    @Test
    fun `PowerVR stays on Vulkan only from the C-Series on`() {
        assertFalse(ImpellerPolicy.gpuStaysOnVulkan("PowerVR Rogue GE8300"))
        assertFalse(ImpellerPolicy.gpuStaysOnVulkan("PowerVR Rogue GE9215"))
        assertFalse(ImpellerPolicy.gpuStaysOnVulkan("PowerVR B-Series BXE-4-32"))
        assertTrue(ImpellerPolicy.gpuStaysOnVulkan("PowerVR C-Series CXT-48-1536"))
    }

    @Test
    fun `Adreno stays on Vulkan only above the 650`() {
        assertFalse(ImpellerPolicy.gpuStaysOnVulkan("Adreno (TM) 650"))
        assertFalse(ImpellerPolicy.gpuStaysOnVulkan("Adreno (TM) 610"))
        assertTrue(ImpellerPolicy.gpuStaysOnVulkan("Adreno (TM) 660"))
    }

    @Test
    fun `an unknown or missing GPU keeps Skia`() {
        assertFalse(ImpellerPolicy.gpuStaysOnVulkan("Android Emulator OpenGL ES Translator"))
        assertFalse(ImpellerPolicy.gpuStaysOnVulkan("Mali-T860"))
        assertFalse(ImpellerPolicy.gpuStaysOnVulkan(null))
    }
}
