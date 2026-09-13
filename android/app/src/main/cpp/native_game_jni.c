// JNI bridge between LibretroBridge and the shared libretro host.

#include <android/log.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <jni.h>
#include <limits.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "egl_backend.h"
#include "libretro_host.h"

#define LOG_TAG "moonfin_libretro"
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)

typedef struct {
  lh_host *host;
  ANativeWindow *window;
  int window_width;
  int window_height;
  JavaVM *vm;
  jobject bridge;
  jmethodID on_geometry;
  jmethodID on_error;
  jmethodID on_core_message;
  jmethodID on_core_shutdown;
  pthread_t render_thread;
  int has_render_thread;
  atomic_int render_running;
  atomic_int frame_dirty;
} native_ctx;

// libretro allows one session per process.
static native_ctx g_ctx;

// Protects the window while the render thread blits into it.
static pthread_mutex_t g_window_lock = PTHREAD_MUTEX_INITIALIZER;

// Detach threads attached by get_thread_env when they exit.
static void detach_on_thread_exit(void *value) {
  (void)value;
  if (g_ctx.vm) (*g_ctx.vm)->DetachCurrentThread(g_ctx.vm);
}

static pthread_key_t g_thread_env_key;
static pthread_once_t g_thread_env_key_once = PTHREAD_ONCE_INIT;

static void make_thread_env_key(void) {
  pthread_key_create(&g_thread_env_key, detach_on_thread_exit);
}

// Return a JNIEnv for this thread, attaching it once when necessary.
static JNIEnv *get_thread_env(const char *name) {
  if (!g_ctx.vm) return NULL;
  JNIEnv *env = NULL;
  jint state = (*g_ctx.vm)->GetEnv(g_ctx.vm, (void **)&env, JNI_VERSION_1_6);
  if (state == JNI_OK) return env;
  if (state != JNI_EDETACHED) return NULL;

  pthread_once(&g_thread_env_key_once, make_thread_env_key);
  JavaVMAttachArgs args = {
      .version = JNI_VERSION_1_6,
      .name = name,
      .group = NULL,
  };
  if ((*g_ctx.vm)->AttachCurrentThreadAsDaemon(g_ctx.vm, &env, &args) != JNI_OK) {
    return NULL;
  }
  pthread_setspecific(g_thread_env_key, (void *)1);
  return env;
}

// Copy the latest software frame to the output surface.
static void blit_frame(native_ctx *c) {
  pthread_mutex_lock(&g_window_lock);
  ANativeWindow *window = c->window;
  if (!window) {
    pthread_mutex_unlock(&g_window_lock);
    return;
  }

  const void *data;
  int width, height, stride;
  if (!lh_get_frame(c->host, &data, &width, &height, &stride)) {
    pthread_mutex_unlock(&g_window_lock);
    return;
  }

  // Avoid renegotiating the buffer queue when the size is unchanged.
  if (width != c->window_width || height != c->window_height) {
    ANativeWindow_setBuffersGeometry(window, width, height,
                                     WINDOW_FORMAT_RGBA_8888);
    c->window_width = width;
    c->window_height = height;
  }
  ANativeWindow_Buffer buffer;
  if (ANativeWindow_lock(window, &buffer, NULL) != 0) {
    pthread_mutex_unlock(&g_window_lock);
    return;
  }

  const uint8_t *src = (const uint8_t *)data;
  uint8_t *dst = (uint8_t *)buffer.bits;
  int dst_stride = buffer.stride * 4;
  int row_bytes = width * 4 < dst_stride ? width * 4 : dst_stride;
  int rows = height < buffer.height ? height : buffer.height;
  for (int y = 0; y < rows; y++) {
    memcpy(dst + (size_t)y * dst_stride, src + (size_t)y * stride, row_bytes);
  }
  ANativeWindow_unlockAndPost(window);
  pthread_mutex_unlock(&g_window_lock);
}

static void *render_loop(void *arg) {
  native_ctx *c = (native_ctx *)arg;
  if (!get_thread_env("moonfin.retro")) {
    LOGE("Could not attach the render thread to the JVM");
  }
  while (atomic_load(&c->render_running)) {
    if (atomic_exchange(&c->frame_dirty, 0)) {
      blit_frame(c);
    } else {
      usleep(2000);
    }
  }
  return NULL;
}

// Notify the render thread that a frame is ready.
static void frame_ready(void *user) {
  native_ctx *c = (native_ctx *)user;
  atomic_store(&c->frame_dirty, 1);
}

static int controller_count(void *user) {
  (void)user;
  return 1;
}

static void geometry_changed(void *user, int width, int height, double aspect) {
  native_ctx *c = (native_ctx *)user;
  if (!c->vm || !c->bridge || !c->on_geometry) return;
  JNIEnv *env = get_thread_env(NULL);
  if (!env) return;
  (*env)->CallVoidMethod(env, c->bridge, c->on_geometry, width, height, aspect);
}


static void fatal_error(void *user, const char *message) {
  native_ctx *c = (native_ctx *)user;
  if (message) LOGE("fatal: %s", message);
  if (!c->vm || !c->bridge || !c->on_error) return;
  JNIEnv *env = NULL;
  int attached_here = 0;
  jint state = (*c->vm)->GetEnv(c->vm, (void **)&env, JNI_VERSION_1_6);
  if (state == JNI_EDETACHED) {
    if ((*c->vm)->AttachCurrentThread(c->vm, &env, NULL) != JNI_OK) return;
    attached_here = 1;
  } else if (state != JNI_OK) {
    return;
  }
  jstring jmessage = (*env)->NewStringUTF(env, message ? message : "");
  (*env)->CallVoidMethod(env, c->bridge, c->on_error, jmessage);
  (*env)->DeleteLocalRef(env, jmessage);
  if (attached_here) (*c->vm)->DetachCurrentThread(c->vm);
}

static void core_message(void *user, const char *text) {
  native_ctx *c = (native_ctx *)user;
  if (text) LOGI("%s", text);
  if (!c->vm || !c->bridge || !c->on_core_message || !text) return;
  JNIEnv *env = get_thread_env(NULL);
  if (!env) return;
  jstring message = (*env)->NewStringUTF(env, text);
  if (message) {
    (*env)->CallVoidMethod(env, c->bridge, c->on_core_message, message);
    (*env)->DeleteLocalRef(env, message);
  }
}

// Kotlin ends the session from the main thread, since this runs on the
// emulation thread as it exits and must not join itself.
static void core_shutdown(void *user) {
  native_ctx *c = (native_ctx *)user;
  if (!c->vm || !c->bridge || !c->on_core_shutdown) return;
  JNIEnv *env = get_thread_env(NULL);
  if (!env) return;
  (*env)->CallVoidMethod(env, c->bridge, c->on_core_shutdown);
}

static void teardown(JNIEnv *env) {
  if (g_ctx.has_render_thread) {
    atomic_store(&g_ctx.render_running, 0);
    pthread_join(g_ctx.render_thread, NULL);
    g_ctx.has_render_thread = 0;
  }
  if (g_ctx.host) {
    lh_stop(g_ctx.host);
    lh_destroy(g_ctx.host);
    g_ctx.host = NULL;
  }
  pthread_mutex_lock(&g_window_lock);
  egl_backend_shutdown();
  if (g_ctx.window) {
    ANativeWindow_release(g_ctx.window);
    g_ctx.window = NULL;
  }
  pthread_mutex_unlock(&g_window_lock);
  if (g_ctx.bridge) {
    (*env)->DeleteGlobalRef(env, g_ctx.bridge);
    g_ctx.bridge = NULL;
  }
  g_ctx.on_geometry = NULL;
  g_ctx.on_error = NULL;
  g_ctx.on_core_message = NULL;
  g_ctx.on_core_shutdown = NULL;
}

#define JNI(ret, name) \
  JNIEXPORT ret JNICALL Java_org_moonfin_androidtv_LibretroBridge_##name

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
  (void)reserved;
  g_ctx.vm = vm;
  return JNI_VERSION_1_6;
}

// Release option-array resources after a partial nativeLoad attempt.
static void release_options(JNIEnv *env, int count, const char **keys,
                            const char **vals, jstring *key_refs,
                            jstring *val_refs) {
  for (int i = 0; i < count; i++) {
    if (keys && keys[i]) (*env)->ReleaseStringUTFChars(env, key_refs[i], keys[i]);
    if (vals && vals[i]) (*env)->ReleaseStringUTFChars(env, val_refs[i], vals[i]);
    if (key_refs && key_refs[i]) (*env)->DeleteLocalRef(env, key_refs[i]);
    if (val_refs && val_refs[i]) (*env)->DeleteLocalRef(env, val_refs[i]);
  }
  free((void *)keys);
  free((void *)vals);
  free(key_refs);
  free(val_refs);
}

JNI(jdoubleArray, nativeLoad)(
    JNIEnv *env, jobject thiz, jstring core, jstring corePath, jstring romPath,
    jstring systemDir, jstring saveDir, jstring gameId, jobjectArray optKeys,
    jobjectArray optVals) {
  (void)core;
  teardown(env);

  // Both arrays must have the same length before indexing them together.
  jsize opt_count = optKeys ? (*env)->GetArrayLength(env, optKeys) : 0;
  jsize val_count = optVals ? (*env)->GetArrayLength(env, optVals) : 0;
  if (opt_count != val_count) {
    LOGE("nativeLoad: optKeys/optVals length mismatch (%d vs %d)",
        (int)opt_count, (int)val_count);
    return NULL;
  }

  lh_callbacks cb;
  memset(&cb, 0, sizeof(cb));
  cb.user = &g_ctx;
  cb.frame_ready = frame_ready;
  cb.controller_count = controller_count;
  cb.geometry_changed = geometry_changed;
  cb.message = core_message;
  cb.core_shutdown = core_shutdown;
  cb.fatal_error = fatal_error;

  g_ctx.host = lh_create(LH_FORMAT_RGBA8888, cb);
  if (!g_ctx.host) {
    LOGE("Could not allocate libretro host");
    return NULL;
  }
  // The core negotiates hardware rendering during retro_load_game.
  if (egl_backend_install(g_ctx.host) != 0) {
    LOGE("EGL backend failed to register; hardware cores will be refused");
  } else {
    pthread_mutex_lock(&g_window_lock);
    egl_backend_set_window(g_ctx.window);
    pthread_mutex_unlock(&g_window_lock);
  }
  g_ctx.bridge = (*env)->NewGlobalRef(env, thiz);
  if (!g_ctx.bridge) {
    // Callbacks require a valid global reference.
    LOGE("nativeLoad: NewGlobalRef(thiz) failed");
    (*env)->ExceptionClear(env);
    teardown(env);
    return NULL;
  }
  jclass cls = (*env)->GetObjectClass(env, thiz);
  g_ctx.on_geometry = (*env)->GetMethodID(env, cls, "onGeometry", "(IID)V");
  if ((*env)->ExceptionCheck(env)) {
    (*env)->ExceptionClear(env);
    LOGE("nativeLoad: GetMethodID(onGeometry) failed");
    (*env)->DeleteLocalRef(env, cls);
    teardown(env);
    return NULL;
  }
  g_ctx.on_error =
      (*env)->GetMethodID(env, cls, "onError", "(Ljava/lang/String;)V");
  if ((*env)->ExceptionCheck(env)) {
    (*env)->ExceptionClear(env);
    LOGE("nativeLoad: GetMethodID(onError) failed");
    (*env)->DeleteLocalRef(env, cls);
    teardown(env);
    return NULL;
  }
  g_ctx.on_core_message =
      (*env)->GetMethodID(env, cls, "onCoreMessage", "(Ljava/lang/String;)V");
  g_ctx.on_core_shutdown =
      (*env)->GetMethodID(env, cls, "onCoreShutdown", "()V");
  (*env)->DeleteLocalRef(env, cls);

  const char *c_core_path = (*env)->GetStringUTFChars(env, corePath, NULL);
  const char *c_rom = (*env)->GetStringUTFChars(env, romPath, NULL);
  const char *c_sys = (*env)->GetStringUTFChars(env, systemDir, NULL);
  const char *c_save = (*env)->GetStringUTFChars(env, saveDir, NULL);
  const char *c_id = (*env)->GetStringUTFChars(env, gameId, NULL);
  // Do not continue while a path conversion has a pending JNI exception.
  if ((*env)->ExceptionCheck(env)) {
    (*env)->ExceptionClear(env);
    LOGE("nativeLoad: GetStringUTFChars failed for one of the load paths");
    if (c_core_path) (*env)->ReleaseStringUTFChars(env, corePath, c_core_path);
    if (c_rom) (*env)->ReleaseStringUTFChars(env, romPath, c_rom);
    if (c_sys) (*env)->ReleaseStringUTFChars(env, systemDir, c_sys);
    if (c_save) (*env)->ReleaseStringUTFChars(env, saveDir, c_save);
    if (c_id) (*env)->ReleaseStringUTFChars(env, gameId, c_id);
    teardown(env);
    return NULL;
  }

  const char **keys = opt_count ? calloc(opt_count, sizeof(char *)) : NULL;
  const char **vals = opt_count ? calloc(opt_count, sizeof(char *)) : NULL;
  jstring *key_refs = opt_count ? calloc(opt_count, sizeof(jstring)) : NULL;
  jstring *val_refs = opt_count ? calloc(opt_count, sizeof(jstring)) : NULL;
  if (opt_count && (!keys || !vals || !key_refs || !val_refs)) {
    LOGE("nativeLoad: could not allocate option arrays");
    release_options(env, opt_count, keys, vals, key_refs, val_refs);
    (*env)->ReleaseStringUTFChars(env, corePath, c_core_path);
    (*env)->ReleaseStringUTFChars(env, romPath, c_rom);
    (*env)->ReleaseStringUTFChars(env, systemDir, c_sys);
    (*env)->ReleaseStringUTFChars(env, saveDir, c_save);
    (*env)->ReleaseStringUTFChars(env, gameId, c_id);
    teardown(env);
    return NULL;
  }
  // Check each JNI conversion before making the next JNI call.
  int opts_ok = 1;
  for (int i = 0; i < opt_count && opts_ok; i++) {
    key_refs[i] = (jstring)(*env)->GetObjectArrayElement(env, optKeys, i);
    if ((*env)->ExceptionCheck(env)) {
      (*env)->ExceptionClear(env);
      LOGE("nativeLoad: GetObjectArrayElement(optKeys, %d) failed", i);
      opts_ok = 0;
      break;
    }
    val_refs[i] = (jstring)(*env)->GetObjectArrayElement(env, optVals, i);
    if ((*env)->ExceptionCheck(env)) {
      (*env)->ExceptionClear(env);
      LOGE("nativeLoad: GetObjectArrayElement(optVals, %d) failed", i);
      opts_ok = 0;
      break;
    }
    if (!key_refs[i] || !val_refs[i]) {
      LOGE("nativeLoad: null option key/value at %d", i);
      opts_ok = 0;
      break;
    }
    keys[i] = (*env)->GetStringUTFChars(env, key_refs[i], NULL);
    if ((*env)->ExceptionCheck(env)) {
      (*env)->ExceptionClear(env);
      LOGE("nativeLoad: GetStringUTFChars(optKeys[%d]) failed", i);
      opts_ok = 0;
      break;
    }
    vals[i] = (*env)->GetStringUTFChars(env, val_refs[i], NULL);
    if ((*env)->ExceptionCheck(env)) {
      (*env)->ExceptionClear(env);
      LOGE("nativeLoad: GetStringUTFChars(optVals[%d]) failed", i);
      opts_ok = 0;
      break;
    }
  }

  if (!opts_ok) {
    release_options(env, opt_count, keys, vals, key_refs, val_refs);
    (*env)->ReleaseStringUTFChars(env, corePath, c_core_path);
    (*env)->ReleaseStringUTFChars(env, romPath, c_rom);
    (*env)->ReleaseStringUTFChars(env, systemDir, c_sys);
    (*env)->ReleaseStringUTFChars(env, saveDir, c_save);
    (*env)->ReleaseStringUTFChars(env, gameId, c_id);
    teardown(env);
    return NULL;
  }

  lh_av_info info;
  memset(&info, 0, sizeof(info));
  int rc = lh_load(g_ctx.host, c_core_path, c_rom, c_sys, c_save, c_id, keys,
                   vals, opt_count, &info);

  release_options(env, opt_count, keys, vals, key_refs, val_refs);
  (*env)->ReleaseStringUTFChars(env, corePath, c_core_path);
  (*env)->ReleaseStringUTFChars(env, romPath, c_rom);
  (*env)->ReleaseStringUTFChars(env, systemDir, c_sys);
  (*env)->ReleaseStringUTFChars(env, saveDir, c_save);
  (*env)->ReleaseStringUTFChars(env, gameId, c_id);

  if (rc != 0) {
    LOGE("lh_load failed: %d", rc);
    teardown(env);
    return NULL;
  }

  jdouble values[5] = {info.width, info.height, info.aspect, info.fps,
                       info.sample_rate};
  jdoubleArray result = (*env)->NewDoubleArray(env, 5);
  (*env)->SetDoubleArrayRegion(env, result, 0, 5, values);
  return result;
}

// Return the hardware render-target size, or NULL for software rendering.
JNI(jintArray, nativeHwRenderSize)(JNIEnv *env, jobject thiz) {
  (void)thiz;
  if (!g_ctx.host) return NULL;
  int w = 0, h = 0;
  if (!lh_hw_render_size(g_ctx.host, &w, &h) || w <= 0 || h <= 0) return NULL;
  jintArray out = (*env)->NewIntArray(env, 2);
  if (!out) return NULL;
  jint values[2] = {(jint)w, (jint)h};
  (*env)->SetIntArrayRegion(env, out, 0, 2, values);
  return out;
}

JNI(void, nativeSetSurface)(JNIEnv *env, jobject thiz, jobject surface) {
  (void)thiz;
  pthread_mutex_lock(&g_window_lock);
  if (g_ctx.window) {
    ANativeWindow_release(g_ctx.window);
    g_ctx.window = NULL;
  }
  g_ctx.window_width = 0;
  g_ctx.window_height = 0;
  if (surface) {
    g_ctx.window = ANativeWindow_fromSurface(env, surface);
  }
  egl_backend_set_window(g_ctx.window);
  pthread_mutex_unlock(&g_window_lock);
}

// Start the render and emulation threads.
JNI(jint, nativeStart)(JNIEnv *env, jobject thiz) {
  (void)env;
  (void)thiz;
  if (!g_ctx.host) return -1;
  if (g_ctx.has_render_thread) return 0;
  lh_set_audio_paced(g_ctx.host, 1);
  atomic_store(&g_ctx.frame_dirty, 0);
  atomic_store(&g_ctx.render_running, 1);
  int rc = pthread_create(&g_ctx.render_thread, NULL, render_loop, &g_ctx);
  if (rc != 0) {
    LOGE("nativeStart: render thread creation failed (%d)", rc);
    atomic_store(&g_ctx.render_running, 0);
    return -1;
  }
  g_ctx.has_render_thread = 1;
  if (lh_start(g_ctx.host) != 0) {
    LOGE("nativeStart: emulation thread creation failed");
    atomic_store(&g_ctx.render_running, 0);
    pthread_join(g_ctx.render_thread, NULL);
    g_ctx.has_render_thread = 0;
    return -1;
  }
  return 0;
}

JNI(void, nativePause)(JNIEnv *env, jobject thiz) {
  (void)env;
  (void)thiz;
  if (g_ctx.host) lh_pause(g_ctx.host);
}

JNI(void, nativeResume)(JNIEnv *env, jobject thiz) {
  (void)env;
  (void)thiz;
  if (g_ctx.host) lh_resume(g_ctx.host);
}

JNI(jboolean, nativeReset)(JNIEnv *env, jobject thiz) {
  (void)env;
  (void)thiz;
  if (g_ctx.host && lh_restart_async(g_ctx.host) == 0) return JNI_TRUE;
  LOGE("Could not schedule libretro restart");
  return JNI_FALSE;
}

JNI(void, nativeStop)(JNIEnv *env, jobject thiz) {
  (void)thiz;
  teardown(env);
}

JNI(void, nativeSetFastForward)(JNIEnv *env, jobject thiz, jint factor) {
  (void)env;
  (void)thiz;
  if (g_ctx.host) lh_set_fast_forward(g_ctx.host, factor);
}

JNI(void, nativeSetMask)(JNIEnv *env, jobject thiz, jint port, jint mask) {
  (void)env;
  (void)thiz;
  if (g_ctx.host) lh_set_input(g_ctx.host, (int)port, (uint16_t)mask);
}

JNI(void, nativeSetPadState)(JNIEnv *env, jobject thiz, jint port, jint mask,
                             jint lx, jint ly, jint rx, jint ry,
                             jint l2, jint r2) {
  (void)env;
  (void)thiz;
  if (!g_ctx.host) return;
  lh_set_pad_state(g_ctx.host, (int)port, (uint16_t)mask,
                   (int16_t)lx, (int16_t)ly, (int16_t)rx, (int16_t)ry,
                   (uint16_t)l2, (uint16_t)r2);
}

// Return ports whose sticks are currently passed through as analog input.
JNI(jint, nativeAnalogStickPorts)(JNIEnv *env, jobject thiz) {
  (void)env;
  (void)thiz;
  if (!g_ctx.host) return 0;
  return (jint)lh_analog_stick_ports(g_ctx.host);
}

JNI(jint, nativeReadAudio)(JNIEnv *env, jobject thiz, jshortArray buffer,
                           jint frames) {
  (void)thiz;
  if (!g_ctx.host || !buffer) return 0;
  // Audio is stereo, so the Java buffer holds two samples per frame.
  jsize buffer_len = (*env)->GetArrayLength(env, buffer);
  jint max_frames = (jint)(buffer_len / 2);
  if (frames > max_frames) frames = max_frames;
  if (frames <= 0) return 0;
  jshort *data = (*env)->GetShortArrayElements(env, buffer, NULL);
  if (!data) return 0;
  int read = lh_read_audio(g_ctx.host, (int16_t *)data, frames);
  (*env)->ReleaseShortArrayElements(env, buffer, data, 0);
  return read;
}

JNI(jbyteArray, nativeSaveState)(JNIEnv *env, jobject thiz) {
  (void)thiz;
  if (!g_ctx.host) return NULL;
  size_t size = lh_serialize_size(g_ctx.host);
  if (size == 0) return NULL;
  void *buf = malloc(size);
  if (!buf) {
    LOGE("nativeSaveState: could not allocate %zu bytes", size);
    return NULL;
  }
  int ok = lh_serialize(g_ctx.host, buf, size) == 0;
  jbyteArray result = NULL;
  if (ok) {
    result = (*env)->NewByteArray(env, (jsize)size);
    if (result) {
      (*env)->SetByteArrayRegion(env, result, 0, (jsize)size, (const jbyte *)buf);
    } else {
      LOGE("nativeSaveState: NewByteArray(%zu) failed", size);
    }
  }
  free(buf);
  return result;
}

JNI(jboolean, nativeLoadState)(JNIEnv *env, jobject thiz, jbyteArray data) {
  (void)thiz;
  if (!g_ctx.host || !data) return JNI_FALSE;
  jsize size = (*env)->GetArrayLength(env, data);
  jbyte *bytes = (*env)->GetByteArrayElements(env, data, NULL);
  if (!bytes) {
    // GetByteArrayElements returns NULL (and throws OutOfMemoryError) on
    // failure; without this check a NULL/size pair would reach
    // lh_unserialize, and the pending exception would ride into the next
    // JNI call.
    LOGE("nativeLoadState: GetByteArrayElements failed");
    (*env)->ExceptionClear(env);
    return JNI_FALSE;
  }
  int ok = lh_unserialize(g_ctx.host, bytes, (size_t)size) == 0;
  (*env)->ReleaseByteArrayElements(env, data, bytes, JNI_ABORT);
  return ok ? JNI_TRUE : JNI_FALSE;
}

// Packs [host]'s options into the tab-joined Array<String> Kotlin decodes.
static jobjectArray options_array(JNIEnv *env, lh_host *host) {
  jclass string_cls = (*env)->FindClass(env, "java/lang/String");
  if (!host) return (*env)->NewObjectArray(env, 0, string_cls, NULL);

  // lh_option_count and lh_get_option are separate locked calls, so a restart
  // on the emulation thread can shrink the definition list in between. Skipping
  // a failed index would leave a null element in an array Kotlin types as
  // Array<String>, which NPEs on the platform thread the moment it is iterated.
  // Stop at the first failure instead and hand back only what was filled - a
  // short list of live options is correct, a list with a hole in it is not.
  int count = lh_option_count(host);
  jobjectArray result = (*env)->NewObjectArray(env, count, string_cls, NULL);
  if (!result) return NULL;
  int filled = 0;
  for (int i = 0; i < count; i++) {
    lh_option opt;
    if (lh_get_option(host, i, &opt) != 0) break;
    // Tab-joined: id, label, current, then each choice.
    size_t len = strlen(opt.id) + strlen(opt.label) + strlen(opt.current) + 3;
    for (int c = 0; c < opt.choice_count; c++) len += strlen(opt.choices[c]) + 1;
    char *joined = malloc(len + 1);
    if (!joined) break;
    int n = snprintf(joined, len + 1, "%s\t%s\t%s", opt.id, opt.label,
                     opt.current);
    // A negative or truncated result would make len + 1 - n underflow into a
    // huge size_t on the next snprintf, so abandon the entry instead.
    if (n < 0 || (size_t)n > len) {
      free(joined);
      break;
    }
    for (int c = 0; c < opt.choice_count; c++) {
      int w = snprintf(joined + n, len + 1 - (size_t)n, "\t%s", opt.choices[c]);
      if (w < 0 || (size_t)(n + w) > len) break;
      n += w;
    }
    jstring entry = (*env)->NewStringUTF(env, joined);
    free(joined);
    if (!entry) break;
    (*env)->SetObjectArrayElement(env, result, filled++, entry);
    (*env)->DeleteLocalRef(env, entry);
  }
  if (filled == count) return result;

  // Something cut the enumeration short. Re-pack into an array with no
  // trailing nulls rather than returning one Kotlin cannot safely iterate.
  jobjectArray trimmed = (*env)->NewObjectArray(env, filled, string_cls, NULL);
  if (!trimmed) return NULL;
  for (int i = 0; i < filled; i++) {
    jobject entry = (*env)->GetObjectArrayElement(env, result, i);
    (*env)->SetObjectArrayElement(env, trimmed, i, entry);
    (*env)->DeleteLocalRef(env, entry);
  }
  (*env)->DeleteLocalRef(env, result);
  return trimmed;
}

JNI(jobjectArray, nativeControllerTypes)(JNIEnv *env, jobject thiz) {
  (void)thiz;
  jclass string_cls = (*env)->FindClass(env, "java/lang/String");
  if (!string_cls) return NULL;
  if (!g_ctx.host) return (*env)->NewObjectArray(env, 0, string_cls, NULL);

  int counts[LH_MAX_PORTS] = {0};
  int total = 0;
  for (int port = 0; port < LH_MAX_PORTS; port++) {
    int count = lh_controller_type_count(g_ctx.host, port);
    if (count < 0 || count > INT_MAX - total) {
      LOGE("nativeControllerTypes: invalid capability count for port %d", port);
      return (*env)->NewObjectArray(env, 0, string_cls, NULL);
    }
    counts[port] = count;
    total += count;
  }

  jobjectArray result = (*env)->NewObjectArray(env, (jsize)total, string_cls, NULL);
  if (!result) return NULL;
  int filled = 0;
  for (int port = 0; port < LH_MAX_PORTS; port++) {
    for (int index = 0; index < counts[port]; index++) {
      lh_controller_type type;
      // A core may replace SET_CONTROLLER_INFO between the count and this
      // snapshot. Stop this port at the first missing entry rather than
      // returning a Kotlin Array<String> containing null holes.
      if (lh_get_controller_type(g_ctx.host, port, index, &type) != 0) break;
      char joined[LH_CONTROLLER_TYPE_LABEL_MAX + 64];
      int written = snprintf(joined, sizeof(joined), "%d\t%u\t%s", port,
                             type.id, type.label);
      if (written < 0 || (size_t)written >= sizeof(joined)) break;
      jstring entry = (*env)->NewStringUTF(env, joined);
      if (!entry) break;
      (*env)->SetObjectArrayElement(env, result, filled++, entry);
      (*env)->DeleteLocalRef(env, entry);
    }
  }
  if (filled == total) return result;

  jobjectArray trimmed = (*env)->NewObjectArray(env, (jsize)filled, string_cls, NULL);
  if (!trimmed) return NULL;
  for (int index = 0; index < filled; index++) {
    jobject entry = (*env)->GetObjectArrayElement(env, result, index);
    (*env)->SetObjectArrayElement(env, trimmed, index, entry);
    (*env)->DeleteLocalRef(env, entry);
  }
  (*env)->DeleteLocalRef(env, result);
  return trimmed;
}

JNI(jobjectArray, nativeInputDescriptors)(JNIEnv *env, jobject thiz) {
  (void)thiz;
  jclass string_cls = (*env)->FindClass(env, "java/lang/String");
  if (!string_cls) return NULL;
  if (!g_ctx.host) return (*env)->NewObjectArray(env, 0, string_cls, NULL);

  int total = lh_input_descriptor_count(g_ctx.host);
  if (total < 0) {
    LOGE("nativeInputDescriptors: invalid descriptor count");
    return (*env)->NewObjectArray(env, 0, string_cls, NULL);
  }

  jobjectArray result = (*env)->NewObjectArray(env, (jsize)total, string_cls, NULL);
  if (!result) return NULL;
  int filled = 0;
  for (int index = 0; index < total; index++) {
    lh_input_descriptor descriptor;
    // A core may replace SET_INPUT_DESCRIPTORS between the count and this
    // snapshot. Stop at the first missing entry rather than returning a
    // Kotlin Array<String> containing null holes.
    if (lh_get_input_descriptor(g_ctx.host, index, &descriptor) != 0) break;
    char joined[LH_INPUT_DESCRIPTOR_LABEL_MAX + 64];
    int written = snprintf(joined, sizeof(joined), "%u\t%u\t%u\t%u\t%s",
                           descriptor.port, descriptor.device,
                           descriptor.index, descriptor.id,
                           descriptor.description);
    if (written < 0 || (size_t)written >= sizeof(joined)) break;
    jstring entry = (*env)->NewStringUTF(env, joined);
    if (!entry) break;
    (*env)->SetObjectArrayElement(env, result, filled++, entry);
    (*env)->DeleteLocalRef(env, entry);
  }
  if (filled == total) return result;

  jobjectArray trimmed = (*env)->NewObjectArray(env, (jsize)filled, string_cls, NULL);
  if (!trimmed) return NULL;
  for (int index = 0; index < filled; index++) {
    jobject entry = (*env)->GetObjectArrayElement(env, result, index);
    (*env)->SetObjectArrayElement(env, trimmed, index, entry);
    (*env)->DeleteLocalRef(env, entry);
  }
  (*env)->DeleteLocalRef(env, result);
  return trimmed;
}

JNI(jint, nativeSetControllerType)(JNIEnv *env, jobject thiz, jint port,
                                   jlong device_type) {
  (void)env;
  (void)thiz;
  if (!g_ctx.host || device_type < 0 || (uint64_t)device_type > UINT_MAX) {
    return -1;
  }
  return (jint)lh_set_controller_type(g_ctx.host, (int)port,
                                      (unsigned)device_type);
}


JNI(jobjectArray, nativeOptions)(JNIEnv *env, jobject thiz) {
  (void)thiz;
  return options_array(env, g_ctx.host);
}

// Only to satisfy lh_create's non-optional callbacks; a probe runs no frames.
static void probe_frame_ready(void *user) { (void)user; }
static int probe_controller_count(void *user) {
  (void)user;
  return 0;
}

// Throwaway host so the probe cannot disturb g_ctx. See lh_probe_options.
JNI(jobjectArray, nativeProbeOptions)(JNIEnv *env, jobject thiz,
                                      jstring core_path, jstring system_dir) {
  (void)thiz;
  jclass string_cls = (*env)->FindClass(env, "java/lang/String");
  if (!core_path || !system_dir) {
    return (*env)->NewObjectArray(env, 0, string_cls, NULL);
  }
  const char *core = (*env)->GetStringUTFChars(env, core_path, NULL);
  if (!core) {
    (*env)->ExceptionClear(env);
    return (*env)->NewObjectArray(env, 0, string_cls, NULL);
  }
  const char *sys = (*env)->GetStringUTFChars(env, system_dir, NULL);
  if (!sys) {
    (*env)->ReleaseStringUTFChars(env, core_path, core);
    (*env)->ExceptionClear(env);
    return (*env)->NewObjectArray(env, 0, string_cls, NULL);
  }

  lh_callbacks cb = {0};
  cb.frame_ready = probe_frame_ready;
  cb.controller_count = probe_controller_count;
  lh_host *probe = lh_create(LH_FORMAT_RGBA8888, cb);
  jobjectArray result;
  if (probe && lh_probe_options(probe, core, sys) == 0) {
    result = options_array(env, probe);
  } else {
    LOGE("nativeProbeOptions: probe failed for '%s'", core);
    result = (*env)->NewObjectArray(env, 0, string_cls, NULL);
  }
  if (probe) lh_destroy(probe);
  (*env)->ReleaseStringUTFChars(env, system_dir, sys);
  (*env)->ReleaseStringUTFChars(env, core_path, core);
  return result;
}

JNI(void, nativeSetOption)(JNIEnv *env, jobject thiz, jstring id, jstring value) {
  (void)thiz;
  if (!g_ctx.host) return;
  const char *c_id = (*env)->GetStringUTFChars(env, id, NULL);
  if (!c_id) {
    // GetStringUTFChars throws OutOfMemoryError on failure; a NULL id would
    // flow into lh_set_option -> vars_set -> strcmp(key, NULL). Clear the
    // exception and bail before the next JNI call (GetStringUTFChars(value))
    // runs with it pending.
    LOGE("nativeSetOption: GetStringUTFChars(id) failed");
    (*env)->ExceptionClear(env);
    return;
  }
  const char *c_value = (*env)->GetStringUTFChars(env, value, NULL);
  if (!c_value) {
    LOGE("nativeSetOption: GetStringUTFChars(value) failed");
    (*env)->ExceptionClear(env);
    (*env)->ReleaseStringUTFChars(env, id, c_id);
    return;
  }
  lh_set_option(g_ctx.host, c_id, c_value);
  (*env)->ReleaseStringUTFChars(env, id, c_id);
  (*env)->ReleaseStringUTFChars(env, value, c_value);
}
