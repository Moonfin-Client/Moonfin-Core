// Android EGL/GLES implementation of the platform-neutral host backend.

#ifndef MOONFIN_EGL_BACKEND_H
#define MOONFIN_EGL_BACKEND_H

#include <android/native_window.h>

#include "libretro_host.h"

// Register the backend before lh_load. Returns 0 on success.
int egl_backend_install(lh_host *host);

// Queue a window for use by the emulation thread; NULL removes it.
void egl_backend_set_window(ANativeWindow *window);

// Release pending window state.
void egl_backend_shutdown(void);

#endif  // MOONFIN_EGL_BACKEND_H
