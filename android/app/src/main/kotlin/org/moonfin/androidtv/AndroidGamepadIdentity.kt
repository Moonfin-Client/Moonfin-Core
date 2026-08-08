package org.moonfin.androidtv

import android.view.InputDevice
import java.security.MessageDigest

/**
 * Stable, privacy-safe device identity shared by [GameInputRouter] (EmulatorJS
 * device labelling) and [NativePadInput] (custom RetroPad binding lookups) so
 * both agree on the same id for the same physical controller. Derived from
 * vendor/product/descriptor only -- no [InputDevice.hasKeys] binder call here,
 * so this stays safe to call outside a hot per-key-event path (device
 * (re)connect, mapping capture, table (re)build) without the IPC cost
 * `isPhysicalGamepad` carries.
 */
internal object AndroidGamepadIdentity {
    fun of(device: InputDevice): Map<String, String> {
        val identity = "${device.vendorId}:${device.productId}:${device.descriptor}"
        val hash = MessageDigest.getInstance("SHA-256")
            .digest(identity.toByteArray())
            .take(10)
            .joinToString("") { "%02x".format(it) }
        return mapOf(
            "id" to "android-$hash",
            "name" to device.name.ifBlank { "Android gamepad" },
        )
    }
}
