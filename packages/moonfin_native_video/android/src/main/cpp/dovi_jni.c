// JNI shim between DoviRpu.kt and libdovi. libdovi is dlopened so this
// library always loads, and a build that ships without libdovi.so degrades to
// the caller's strip path instead of failing to link.
#include <dlfcn.h>
#include <jni.h>
#include <stddef.h>
#include <stdint.h>

typedef struct DoviData {
    const uint8_t *data;
    size_t len;
} DoviData;

typedef void DoviRpuOpaque;

// Mirrored by DoviRpu.kt so a report can say why conversion is unavailable.
#define DOVI_STATUS_READY 0
#define DOVI_STATUS_UNRESOLVED 1
#define DOVI_STATUS_NOT_FOUND 2
#define DOVI_STATUS_MISSING_SYMBOLS 3

typedef DoviRpuOpaque *(*dovi_parse_unspec62_nalu_fn)(const uint8_t *, size_t);
typedef int (*dovi_convert_rpu_with_mode_fn)(DoviRpuOpaque *, uint8_t);
typedef const DoviData *(*dovi_write_unspec62_nalu_fn)(DoviRpuOpaque *);
typedef void (*dovi_data_free_fn)(const DoviData *);
typedef void (*dovi_rpu_free_fn)(DoviRpuOpaque *);

static dovi_parse_unspec62_nalu_fn p_parse;
static dovi_convert_rpu_with_mode_fn p_convert;
static dovi_write_unspec62_nalu_fn p_write;
static dovi_data_free_fn p_data_free;
static dovi_rpu_free_fn p_rpu_free;
static int resolved;
static int status = DOVI_STATUS_UNRESOLVED;

// Profile 8.1 compatible output where luma and chroma mapping become no-ops,
// which is what a profile 7 stream needs once its enhancement layer is gone.
// libdovi numbers these modes independently of its own enum, so 2 is the
// value to pass here and the neighbouring numbers mean other conversions.
#define DOVI_CONVERT_MODE_P81 2

static void resolve_libdovi(void) {
    if (resolved) {
        return;
    }
    resolved = 1;
    void *handle = dlopen("libdovi.so", RTLD_NOW | RTLD_LOCAL);
    if (handle == NULL) {
        status = DOVI_STATUS_NOT_FOUND;
        return;
    }
    p_parse = (dovi_parse_unspec62_nalu_fn)dlsym(handle, "dovi_parse_unspec62_nalu");
    p_convert = (dovi_convert_rpu_with_mode_fn)dlsym(handle, "dovi_convert_rpu_with_mode");
    p_write = (dovi_write_unspec62_nalu_fn)dlsym(handle, "dovi_write_unspec62_nalu");
    p_data_free = (dovi_data_free_fn)dlsym(handle, "dovi_data_free");
    p_rpu_free = (dovi_rpu_free_fn)dlsym(handle, "dovi_rpu_free");
    if (p_parse == NULL || p_convert == NULL || p_write == NULL ||
        p_data_free == NULL || p_rpu_free == NULL) {
        p_parse = NULL;
        p_convert = NULL;
        p_write = NULL;
        p_data_free = NULL;
        p_rpu_free = NULL;
        status = DOVI_STATUS_MISSING_SYMBOLS;
        return;
    }
    status = DOVI_STATUS_READY;
}

JNIEXPORT jint JNICALL
Java_org_moonfin_nativevideo_DoviRpu_nativeStatus(JNIEnv *env, jobject thiz) {
    (void)env;
    (void)thiz;
    resolve_libdovi();
    return (jint)status;
}

JNIEXPORT jbyteArray JNICALL
Java_org_moonfin_nativevideo_DoviRpu_nativeConvert(
    JNIEnv *env,
    jobject thiz,
    jbyteArray data,
    jint offset,
    jint length) {
    (void)thiz;
    resolve_libdovi();
    if (p_parse == NULL || length <= 0) {
        return NULL;
    }

    jbyte *bytes = (*env)->GetByteArrayElements(env, data, NULL);
    if (bytes == NULL) {
        return NULL;
    }

    jbyteArray result = NULL;
    DoviRpuOpaque *rpu = p_parse((const uint8_t *)bytes + offset, (size_t)length);
    (*env)->ReleaseByteArrayElements(env, data, bytes, JNI_ABORT);
    if (rpu == NULL) {
        return NULL;
    }

    if (p_convert(rpu, DOVI_CONVERT_MODE_P81) == 0) {
        const DoviData *written = p_write(rpu);
        if (written != NULL) {
            result = (*env)->NewByteArray(env, (jsize)written->len);
            if (result != NULL) {
                (*env)->SetByteArrayRegion(
                    env, result, 0, (jsize)written->len, (const jbyte *)written->data);
            }
            p_data_free(written);
        }
    }
    p_rpu_free(rpu);
    return result;
}
