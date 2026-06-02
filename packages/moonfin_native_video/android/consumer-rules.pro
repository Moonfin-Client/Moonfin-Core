# Keep rules for the bundled dav1d (AV1) decoder. Mirrors the proguard.txt that
# shipped inside lib-decoder-av1-release.aar, which is lost when the decoder is
# consumed as a plain .jar + jniLibs instead of an .aar.

# Do not obfuscate native method names.
-keepclasseswithmembernames class * {
    native <methods>;
}

# Members accessed from native code must stay unobfuscated.
-keep class androidx.media3.decoder.VideoDecoderOutputBuffer {
  *;
}
-keep class androidx.media3.decoder.DecoderInputBuffer {
  *;
}
-keep class androidx.media3.decoder.av1.Dav1dDecoder {
  *;
}
