// JNI bridge between the Kotlin LibretroBridge and the shared libretro host.
// The host owns the run loop. This wires its callbacks to an ANativeWindow for
// video, an atomic mask for input, and a Kotlin callback for geometry. Audio is
// pulled by a Kotlin AudioTrack through nativeReadAudio.

#include <android/log.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <jni.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "libretro_host.h"

#define LOG_TAG "moonfin_libretro"
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

typedef struct {
  lh_host *host;
  ANativeWindow *window;
  int window_width;
  int window_height;
  atomic_uint mask[4];
  JavaVM *vm;
  jobject bridge;
  jmethodID on_geometry;
  jmethodID on_core_message;
  jmethodID on_core_shutdown;
  pthread_t render_thread;
  int has_render_thread;
  atomic_int render_running;
  atomic_int frame_dirty;
} native_ctx;

// libretro allows one session per process, so the context is a single global.
static native_ctx g_ctx;

// Guards the window against swaps: Flutter recreates the Surface around
// backgrounding, so the render thread must never blit into a window that
// nativeSetSurface is releasing. Held across the whole blit, which makes
// nativeSetSurface(NULL) a barrier: once it returns, no blit touches the old
// window.
static pthread_mutex_t g_window_lock = PTHREAD_MUTEX_INITIALIZER;

// Copies the host's latest frame into the output surface. ANativeWindow_lock
// blocks while the compositor holds the buffers, so this runs on its own thread
// rather than the emulation thread, which stays paced by audio.
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

  // Renegotiating the buffer queue every frame stalls rendering, so only set
  // the geometry when the frame size changes.
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
  while (atomic_load(&c->render_running)) {
    if (atomic_exchange(&c->frame_dirty, 0)) {
      blit_frame(c);
    } else {
      usleep(2000);
    }
  }
  return NULL;
}

// Signals the render thread from the emulation thread without blocking it.
static void frame_ready(void *user) {
  native_ctx *c = (native_ctx *)user;
  atomic_store(&c->frame_dirty, 1);
}

static uint16_t poll_input(void *user, int port) {
  native_ctx *c = (native_ctx *)user;
  if (port < 0 || port >= 4) return 0;
  return (uint16_t)atomic_load(&c->mask[port]);
}

static int controller_count(void *user) {
  (void)user;
  return 1;
}

// Host callbacks arrive on the emulation thread once the game runs, and on the
// platform thread while the core is still loading. Only an attach we made is
// ours to undo, since detaching the platform thread would break every later JNI
// call on it.
static JNIEnv *jni_enter(native_ctx *c, int *attached) {
  JNIEnv *env = NULL;
  *attached = 0;
  if ((*c->vm)->GetEnv(c->vm, (void **)&env, JNI_VERSION_1_6) == JNI_OK) {
    return env;
  }
  if ((*c->vm)->AttachCurrentThread(c->vm, &env, NULL) != JNI_OK) return NULL;
  *attached = 1;
  return env;
}

static void jni_leave(native_ctx *c, int attached) {
  if (attached) (*c->vm)->DetachCurrentThread(c->vm);
}

static void geometry_changed(void *user, int width, int height, double aspect) {
  native_ctx *c = (native_ctx *)user;
  if (!c->vm || !c->bridge || !c->on_geometry) return;
  int attached;
  JNIEnv *env = jni_enter(c, &attached);
  if (!env) return;
  (*env)->CallVoidMethod(env, c->bridge, c->on_geometry, width, height, aspect);
  jni_leave(c, attached);
}

static void core_message(void *user, const char *text) {
  native_ctx *c = (native_ctx *)user;
  if (!c->vm || !c->bridge || !c->on_core_message || !text) return;
  int attached;
  JNIEnv *env = jni_enter(c, &attached);
  if (!env) return;
  jstring message = (*env)->NewStringUTF(env, text);
  if (message) {
    (*env)->CallVoidMethod(env, c->bridge, c->on_core_message, message);
    (*env)->DeleteLocalRef(env, message);
  }
  jni_leave(c, attached);
}

// Kotlin ends the session from the main thread, since this runs on the
// emulation thread as it exits and must not join itself.
static void core_shutdown(void *user) {
  native_ctx *c = (native_ctx *)user;
  if (!c->vm || !c->bridge || !c->on_core_shutdown) return;
  int attached;
  JNIEnv *env = jni_enter(c, &attached);
  if (!env) return;
  (*env)->CallVoidMethod(env, c->bridge, c->on_core_shutdown);
  jni_leave(c, attached);
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

JNI(jdoubleArray, nativeLoad)(
    JNIEnv *env, jobject thiz, jstring core, jstring corePath, jstring romPath,
    jstring systemDir, jstring saveDir, jstring gameId, jobjectArray optKeys,
    jobjectArray optVals) {
  (void)core;
  teardown(env);

  lh_callbacks cb;
  memset(&cb, 0, sizeof(cb));
  cb.user = &g_ctx;
  cb.frame_ready = frame_ready;
  cb.poll_input = poll_input;
  cb.controller_count = controller_count;
  cb.geometry_changed = geometry_changed;
  cb.message = core_message;
  cb.core_shutdown = core_shutdown;

  g_ctx.host = lh_create(LH_FORMAT_RGBA8888, cb);
  for (int i = 0; i < 4; i++) atomic_store(&g_ctx.mask[i], 0);
  g_ctx.bridge = (*env)->NewGlobalRef(env, thiz);
  jclass cls = (*env)->GetObjectClass(env, thiz);
  g_ctx.on_geometry = (*env)->GetMethodID(env, cls, "onGeometry", "(IID)V");
  g_ctx.on_core_message =
      (*env)->GetMethodID(env, cls, "onCoreMessage", "(Ljava/lang/String;)V");
  g_ctx.on_core_shutdown =
      (*env)->GetMethodID(env, cls, "onCoreShutdown", "()V");

  const char *c_core_path = (*env)->GetStringUTFChars(env, corePath, NULL);
  const char *c_rom = (*env)->GetStringUTFChars(env, romPath, NULL);
  const char *c_sys = (*env)->GetStringUTFChars(env, systemDir, NULL);
  const char *c_save = (*env)->GetStringUTFChars(env, saveDir, NULL);
  const char *c_id = (*env)->GetStringUTFChars(env, gameId, NULL);

  int opt_count = optKeys ? (*env)->GetArrayLength(env, optKeys) : 0;
  const char **keys = opt_count ? calloc(opt_count, sizeof(char *)) : NULL;
  const char **vals = opt_count ? calloc(opt_count, sizeof(char *)) : NULL;
  jstring *key_refs = opt_count ? calloc(opt_count, sizeof(jstring)) : NULL;
  jstring *val_refs = opt_count ? calloc(opt_count, sizeof(jstring)) : NULL;
  for (int i = 0; i < opt_count; i++) {
    key_refs[i] = (jstring)(*env)->GetObjectArrayElement(env, optKeys, i);
    val_refs[i] = (jstring)(*env)->GetObjectArrayElement(env, optVals, i);
    keys[i] = (*env)->GetStringUTFChars(env, key_refs[i], NULL);
    vals[i] = (*env)->GetStringUTFChars(env, val_refs[i], NULL);
  }

  lh_av_info info;
  memset(&info, 0, sizeof(info));
  int rc = lh_load(g_ctx.host, c_core_path, c_rom, c_sys, c_save, c_id, keys,
                   vals, opt_count, &info);

  for (int i = 0; i < opt_count; i++) {
    (*env)->ReleaseStringUTFChars(env, key_refs[i], keys[i]);
    (*env)->ReleaseStringUTFChars(env, val_refs[i], vals[i]);
  }
  free(keys);
  free(vals);
  free(key_refs);
  free(val_refs);
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
  pthread_mutex_unlock(&g_window_lock);
}

JNI(void, nativeStart)(JNIEnv *env, jobject thiz) {
  (void)env;
  (void)thiz;
  if (!g_ctx.host) return;
  lh_set_audio_paced(g_ctx.host, 1);
  atomic_store(&g_ctx.frame_dirty, 0);
  atomic_store(&g_ctx.render_running, 1);
  if (pthread_create(&g_ctx.render_thread, NULL, render_loop, &g_ctx) == 0) {
    g_ctx.has_render_thread = 1;
  }
  lh_start(g_ctx.host);
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

JNI(void, nativeReset)(JNIEnv *env, jobject thiz) {
  (void)env;
  (void)thiz;
  if (g_ctx.host) lh_reset(g_ctx.host);
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
  if (port >= 0 && port < 4) atomic_store(&g_ctx.mask[port], (unsigned)mask);
}

JNI(jint, nativeReadAudio)(JNIEnv *env, jobject thiz, jshortArray buffer,
                           jint frames) {
  (void)thiz;
  if (!g_ctx.host) return 0;
  jshort *data = (*env)->GetShortArrayElements(env, buffer, NULL);
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
  int ok = lh_serialize(g_ctx.host, buf, size) == 0;
  jbyteArray result = NULL;
  if (ok) {
    result = (*env)->NewByteArray(env, (jsize)size);
    (*env)->SetByteArrayRegion(env, result, 0, (jsize)size, (const jbyte *)buf);
  }
  free(buf);
  return result;
}

JNI(jboolean, nativeLoadState)(JNIEnv *env, jobject thiz, jbyteArray data) {
  (void)thiz;
  if (!g_ctx.host) return JNI_FALSE;
  jsize size = (*env)->GetArrayLength(env, data);
  jbyte *bytes = (*env)->GetByteArrayElements(env, data, NULL);
  int ok = lh_unserialize(g_ctx.host, bytes, (size_t)size) == 0;
  (*env)->ReleaseByteArrayElements(env, data, bytes, JNI_ABORT);
  return ok ? JNI_TRUE : JNI_FALSE;
}

JNI(jobjectArray, nativeOptions)(JNIEnv *env, jobject thiz) {
  (void)thiz;
  jclass string_cls = (*env)->FindClass(env, "java/lang/String");
  if (!g_ctx.host) return (*env)->NewObjectArray(env, 0, string_cls, NULL);

  int count = lh_option_count(g_ctx.host);
  jobjectArray result = (*env)->NewObjectArray(env, count, string_cls, NULL);
  for (int i = 0; i < count; i++) {
    lh_option opt;
    if (lh_get_option(g_ctx.host, i, &opt) != 0) continue;
    // Tab-joined: id, label, current, then each choice.
    size_t len = strlen(opt.id) + strlen(opt.label) + strlen(opt.current) + 3;
    for (int c = 0; c < opt.choice_count; c++) len += strlen(opt.choices[c]) + 1;
    char *joined = malloc(len + 1);
    int n = snprintf(joined, len + 1, "%s\t%s\t%s", opt.id, opt.label,
                     opt.current);
    for (int c = 0; c < opt.choice_count; c++) {
      n += snprintf(joined + n, len + 1 - n, "\t%s", opt.choices[c]);
    }
    jstring entry = (*env)->NewStringUTF(env, joined);
    (*env)->SetObjectArrayElement(env, result, i, entry);
    (*env)->DeleteLocalRef(env, entry);
    free(joined);
  }
  return result;
}

JNI(void, nativeSetOption)(JNIEnv *env, jobject thiz, jstring id, jstring value) {
  (void)thiz;
  if (!g_ctx.host) return;
  const char *c_id = (*env)->GetStringUTFChars(env, id, NULL);
  const char *c_value = (*env)->GetStringUTFChars(env, value, NULL);
  lh_set_option(g_ctx.host, c_id, c_value);
  (*env)->ReleaseStringUTFChars(env, id, c_id);
  (*env)->ReleaseStringUTFChars(env, value, c_value);
}
