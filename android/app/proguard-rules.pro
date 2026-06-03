# ProGuard / R8 keep rules for Moonfin release builds.
#
# Most Flutter plugins ship their own consumer ProGuard rules inside their AARs,
# which R8 applies automatically. The rules below are defensive keeps for code
# reached via reflection, JNI/FFI, or Gson that R8 cannot see and would
# otherwise strip, causing release-only crashes.

# --- Flutter embedding -------------------------------------------------------
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# --- flutter_local_notifications (uses Gson reflection for scheduled payloads)
-keep class com.dexterous.** { *; }
-keepattributes Signature
-keepattributes *Annotation*
# Gson generic type tokens / serialized model fields.
-keep class com.google.gson.** { *; }
-keep class * extends com.google.gson.reflect.TypeToken
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# --- media_kit / libmpv native bindings -------------------------------------
-keep class com.alexmercerind.** { *; }
-keep class media_kit_video.** { *; }
-dontwarn com.alexmercerind.**

# --- Google Cast framework (referenced via OPTIONS_PROVIDER class name) ------
-keep class com.google.android.gms.cast.** { *; }
-keep class * implements com.google.android.gms.cast.framework.OptionsProvider { *; }

# --- sqlite3 native library (loaded by name; drift uses FFI) -----------------
-keep class org.sqlite.** { *; }
-dontwarn org.sqlite.**

# --- General safety: keep native methods and annotated members ---------------
-keepclasseswithmembernames class * {
    native <methods>;
}
-keepattributes EnclosingMethod,InnerClasses
