// Android EGL/GLES backend for libretro hardware rendering. EGL and GL calls
// stay on the emulation thread; window handoff only updates pending state.

#include "egl_backend.h"

#include <EGL/egl.h>
#include <GLES2/gl2.h>
#include <android/log.h>
#include <dlfcn.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdlib.h>
#include <string.h>

#define LOG_TAG "moonfin_egl"
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)

// GLES3 tokens used while linking only against GLESv2.
#ifndef GL_DEPTH24_STENCIL8
#define GL_DEPTH24_STENCIL8 0x88F0
#endif
// From EGL_KHR_create_context.
#ifndef EGL_OPENGL_ES3_BIT_KHR
#define EGL_OPENGL_ES3_BIT_KHR 0x0040
#endif
#ifndef GL_DEPTH_STENCIL_ATTACHMENT
#define GL_DEPTH_STENCIL_ATTACHMENT 0x821A
#endif

typedef void(GL_APIENTRY *PFN_glBindVertexArray)(GLuint);
typedef void(GL_APIENTRY *PFN_glGenVertexArrays)(GLsizei, GLuint *);
typedef void(GL_APIENTRY *PFN_glDeleteVertexArrays)(GLsizei, const GLuint *);

typedef struct {
  EGLDisplay display;
  EGLConfig config;
  EGLContext context;
  EGLSurface surface;
  // Fallback surface used while no window is available.
  EGLSurface pbuffer;

  // Window currently used for presentation and pending replacement.
  ANativeWindow *window;
  ANativeWindow *pending_window;
  int window_dirty;
  pthread_mutex_t window_lock;

  // Fixed-size render target. Cores may cache its handle for the session.
  GLuint fbo;
  GLuint color_tex;
  GLuint depth_rb;
  int fbo_width;
  int fbo_height;

  GLuint program;
  GLuint vbo;
  GLuint vao;
  GLint attr_pos;
  GLint attr_uv;
  GLint uniform_tex;
  PFN_glBindVertexArray bind_vao;
  PFN_glGenVertexArrays gen_vaos;
  PFN_glDeleteVertexArrays delete_vaos;

  int bottom_left_origin;
  int gles_major;
  int created;
  int logged_first_present;
  // Last geometry reported by the presentation diagnostic.
  int last_core_w, last_core_h, last_win_w, last_win_h;
} egl_state;

static egl_state g_egl;

// GLSL ES 1.00 shaders work on both GLES2 and GLES3.

static const char *k_vertex_src =
    "attribute vec2 aPos;\n"
    "attribute vec2 aUV;\n"
    "varying vec2 vUV;\n"
    "void main() {\n"
    "  vUV = aUV;\n"
    "  gl_Position = vec4(aPos, 0.0, 1.0);\n"
    "}\n";

static const char *k_fragment_src =
    "precision mediump float;\n"
    "varying vec2 vUV;\n"
    "uniform sampler2D uTex;\n"
    "void main() {\n"
    "  gl_FragColor = vec4(texture2D(uTex, vUV).rgb, 1.0);\n"
    "}\n";

static GLuint compile_shader(GLenum type, const char *src) {
  GLuint s = glCreateShader(type);
  if (!s) return 0;
  glShaderSource(s, 1, &src, NULL);
  glCompileShader(s);
  GLint ok = 0;
  glGetShaderiv(s, GL_COMPILE_STATUS, &ok);
  if (!ok) {
    char log[512];
    GLsizei len = 0;
    glGetShaderInfoLog(s, (GLsizei)sizeof(log), &len, log);
    LOGE("shader compile failed: %.*s", (int)len, log);
    glDeleteShader(s);
    return 0;
  }
  return s;
}

static int build_present_program(egl_state *s) {
  GLuint vs = compile_shader(GL_VERTEX_SHADER, k_vertex_src);
  GLuint fs = compile_shader(GL_FRAGMENT_SHADER, k_fragment_src);
  if (!vs || !fs) {
    if (vs) glDeleteShader(vs);
    if (fs) glDeleteShader(fs);
    return -1;
  }
  s->program = glCreateProgram();
  glAttachShader(s->program, vs);
  glAttachShader(s->program, fs);
  glLinkProgram(s->program);
  glDeleteShader(vs);
  glDeleteShader(fs);
  GLint ok = 0;
  glGetProgramiv(s->program, GL_LINK_STATUS, &ok);
  if (!ok) {
    char log[512];
    GLsizei len = 0;
    glGetProgramInfoLog(s->program, (GLsizei)sizeof(log), &len, log);
    LOGE("present program link failed: %.*s", (int)len, log);
    glDeleteProgram(s->program);
    s->program = 0;
    return -1;
  }
  s->attr_pos = glGetAttribLocation(s->program, "aPos");
  s->attr_uv = glGetAttribLocation(s->program, "aUV");
  s->uniform_tex = glGetUniformLocation(s->program, "uTex");
  glGenBuffers(1, &s->vbo);

  // Use a private VAO when the context supports VAOs.
  s->gen_vaos = (PFN_glGenVertexArrays)eglGetProcAddress("glGenVertexArrays");
  s->bind_vao = (PFN_glBindVertexArray)eglGetProcAddress("glBindVertexArray");
  s->delete_vaos =
      (PFN_glDeleteVertexArrays)eglGetProcAddress("glDeleteVertexArrays");
  if (s->gen_vaos && s->bind_vao) s->gen_vaos(1, &s->vao);
  return 0;
}

static EGLConfig choose_config(EGLDisplay dpy, int gles_major, int *out_ok) {
  const EGLint attrs[] = {EGL_SURFACE_TYPE,
                          EGL_WINDOW_BIT | EGL_PBUFFER_BIT,
                          EGL_RENDERABLE_TYPE,
                          gles_major >= 3 ? EGL_OPENGL_ES3_BIT_KHR
                                          : EGL_OPENGL_ES2_BIT,
                          EGL_RED_SIZE,
                          8,
                          EGL_GREEN_SIZE,
                          8,
                          EGL_BLUE_SIZE,
                          8,
                          EGL_ALPHA_SIZE,
                          8,
                          EGL_NONE};
  EGLConfig config;
  EGLint count = 0;
  *out_ok = eglChooseConfig(dpy, attrs, &config, 1, &count) && count > 0;
  return config;
}

// Probe the requested context instead of inferring support from device metadata.
static int egl_supports(void *user, const lh_hw_request *req) {
  (void)user;
  if (!req) return 0;
  int want_major;
  switch (req->api) {
    case LH_HW_API_GLES2:
      want_major = 2;
      break;
    case LH_HW_API_GLES:
      want_major = req->version_major >= 3 ? req->version_major : 3;
      break;
    default:
      return 0;  // Desktop GL and Vulkan are not available on this platform.
  }

  EGLDisplay dpy = eglGetDisplay(EGL_DEFAULT_DISPLAY);
  if (dpy == EGL_NO_DISPLAY) return 0;
  if (!eglInitialize(dpy, NULL, NULL)) return 0;

  int ok = 0;
  EGLConfig config = choose_config(dpy, want_major, &ok);
  if (!ok) {
    LOGI("no EGL config for GLES%d", want_major);
    return 0;
  }
  const EGLint ctx_attrs[] = {EGL_CONTEXT_CLIENT_VERSION, want_major, EGL_NONE};
  EGLContext probe = eglCreateContext(dpy, config, EGL_NO_CONTEXT, ctx_attrs);
  if (probe == EGL_NO_CONTEXT) {
    LOGI("GLES%d context creation refused by the driver", want_major);
    return 0;
  }
  eglDestroyContext(dpy, probe);
  return 1;
}

static void destroy_fbo(egl_state *s) {
  if (s->fbo) glDeleteFramebuffers(1, &s->fbo);
  if (s->color_tex) glDeleteTextures(1, &s->color_tex);
  if (s->depth_rb) glDeleteRenderbuffers(1, &s->depth_rb);
  s->fbo = s->color_tex = s->depth_rb = 0;
}

static int create_fbo(egl_state *s, const lh_hw_request *req) {
  GLint max_tex = 0, max_rb = 0;
  glGetIntegerv(GL_MAX_TEXTURE_SIZE, &max_tex);
  glGetIntegerv(GL_MAX_RENDERBUFFER_SIZE, &max_rb);
  int w = req->max_width;
  int h = req->max_height;
  if (max_tex > 0 && w > max_tex) w = max_tex;
  if (max_tex > 0 && h > max_tex) h = max_tex;
  if (req->depth && max_rb > 0) {
    if (w > max_rb) w = max_rb;
    if (h > max_rb) h = max_rb;
  }
  s->fbo_width = w;
  s->fbo_height = h;

  glGenTextures(1, &s->color_tex);
  glBindTexture(GL_TEXTURE_2D, s->color_tex);
  glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE,
               NULL);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

  glGenFramebuffers(1, &s->fbo);
  glBindFramebuffer(GL_FRAMEBUFFER, s->fbo);
  glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D,
                         s->color_tex, 0);

  // The host has already discarded a stencil-only request.
  if (req->depth) {
    glGenRenderbuffers(1, &s->depth_rb);
    glBindRenderbuffer(GL_RENDERBUFFER, s->depth_rb);
    if (req->stencil) {
      glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8, w, h);
      glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_STENCIL_ATTACHMENT,
                                GL_RENDERBUFFER, s->depth_rb);
    } else {
      glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, w, h);
      glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT,
                                GL_RENDERBUFFER, s->depth_rb);
    }
    glBindRenderbuffer(GL_RENDERBUFFER, 0);
  }

  GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
  glBindFramebuffer(GL_FRAMEBUFFER, 0);
  if (status != GL_FRAMEBUFFER_COMPLETE) {
    LOGE("render target incomplete (0x%x) at %dx%d", status, w, h);
    destroy_fbo(s);
    return -1;
  }
  LOGI("render target %dx%d, depth %d stencil %d", w, h, req->depth,
       req->stencil);
  return 0;
}

// Rebuild the window surface, using the pbuffer when no window is available.
static int rebuild_surface(egl_state *s) {
  if (s->surface != EGL_NO_SURFACE) {
    eglMakeCurrent(s->display, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
    eglDestroySurface(s->display, s->surface);
    s->surface = EGL_NO_SURFACE;
  }
  if (s->window) {
    s->surface = eglCreateWindowSurface(s->display, s->config, s->window, NULL);
    if (s->surface == EGL_NO_SURFACE) {
      LOGE("eglCreateWindowSurface failed: 0x%x", eglGetError());
    }
  }
  return s->surface != EGL_NO_SURFACE ? 0 : -1;
}

// Apply a pending window on the emulation thread.
static void apply_pending_window(egl_state *s) {
  pthread_mutex_lock(&s->window_lock);
  if (!s->window_dirty) {
    pthread_mutex_unlock(&s->window_lock);
    return;
  }
  ANativeWindow *next = s->pending_window;
  s->window_dirty = 0;
  s->window = next;
  pthread_mutex_unlock(&s->window_lock);
  rebuild_surface(s);
}

static EGLSurface active_surface(egl_state *s) {
  return s->surface != EGL_NO_SURFACE ? s->surface : s->pbuffer;
}

static int egl_make_current(void *user) {
  egl_state *s = (egl_state *)user;
  if (s->context == EGL_NO_CONTEXT) return -1;
  EGLSurface surf = active_surface(s);
  if (!eglMakeCurrent(s->display, surf, surf, s->context)) {
    LOGE("eglMakeCurrent failed: 0x%x", eglGetError());
    return -1;
  }
  return 0;
}

static void egl_release_current(void *user) {
  egl_state *s = (egl_state *)user;
  if (s->display != EGL_NO_DISPLAY) {
    eglMakeCurrent(s->display, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
  }
}

static void egl_context_destroy(void *user);

static int egl_context_create(void *user, const lh_hw_request *req) {
  egl_state *s = (egl_state *)user;
  if (s->created) return 0;

  s->gles_major = req->api == LH_HW_API_GLES2
                      ? 2
                      : (req->version_major >= 3 ? req->version_major : 3);
  s->bottom_left_origin = req->bottom_left_origin;
  s->logged_first_present = 0;

  s->display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
  if (s->display == EGL_NO_DISPLAY || !eglInitialize(s->display, NULL, NULL)) {
    LOGE("no EGL display");
    return -1;
  }
  int ok = 0;
  s->config = choose_config(s->display, s->gles_major, &ok);
  if (!ok) {
    LOGE("no EGL config for GLES%d", s->gles_major);
    egl_context_destroy(s);
    return -1;
  }
  const EGLint ctx_attrs[] = {EGL_CONTEXT_CLIENT_VERSION, s->gles_major,
                              EGL_NONE};
  s->context =
      eglCreateContext(s->display, s->config, EGL_NO_CONTEXT, ctx_attrs);
  if (s->context == EGL_NO_CONTEXT) {
    LOGE("eglCreateContext(GLES%d) failed: 0x%x", s->gles_major, eglGetError());
    egl_context_destroy(s);
    return -1;
  }

  const EGLint pb_attrs[] = {EGL_WIDTH, 1, EGL_HEIGHT, 1, EGL_NONE};
  s->pbuffer = eglCreatePbufferSurface(s->display, s->config, pb_attrs);

  pthread_mutex_lock(&s->window_lock);
  if (s->window_dirty) {
    s->window = s->pending_window;
    s->window_dirty = 0;
  }
  pthread_mutex_unlock(&s->window_lock);
  rebuild_surface(s);

  if (egl_make_current(s) != 0) {
    egl_context_destroy(s);
    return -1;
  }

  // Audio pacing owns the emulation clock; avoid adding a vsync clock here.
  // Device presentation still needs visual verification.
  eglSwapInterval(s->display, 0);

  if (create_fbo(s, req) != 0) {
    egl_context_destroy(s);
    return -1;
  }
  if (build_present_program(s) != 0) {
    egl_context_destroy(s);
    return -1;
  }

  const char *ver = (const char *)glGetString(GL_VERSION);
  const char *rend = (const char *)glGetString(GL_RENDERER);
  LOGI("context up: %s / %s", ver ? ver : "?", rend ? rend : "?");
  s->created = 1;
  return 0;
}

// Releases whatever was built, so a half-finished create can share it.
static void egl_context_destroy(void *user) {
  egl_state *s = (egl_state *)user;
  if (s->display != EGL_NO_DISPLAY && s->context != EGL_NO_CONTEXT) {
    eglMakeCurrent(s->display, active_surface(s), active_surface(s),
                   s->context);
    destroy_fbo(s);
    if (s->program) glDeleteProgram(s->program);
    if (s->vbo) glDeleteBuffers(1, &s->vbo);
    if (s->vao && s->delete_vaos) s->delete_vaos(1, &s->vao);
    s->program = s->vbo = s->vao = 0;
    eglMakeCurrent(s->display, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
    if (s->surface != EGL_NO_SURFACE) eglDestroySurface(s->display, s->surface);
    if (s->pbuffer != EGL_NO_SURFACE) eglDestroySurface(s->display, s->pbuffer);
    eglDestroyContext(s->display, s->context);
    // Do not terminate the shared default display; release only owned objects.
  }
  s->surface = EGL_NO_SURFACE;
  s->pbuffer = EGL_NO_SURFACE;
  s->context = EGL_NO_CONTEXT;
  s->display = EGL_NO_DISPLAY;
  s->created = 0;
}

static lh_hw_target egl_current_target(void *user) {
  egl_state *s = (egl_state *)user;
  lh_hw_target t;
  t.kind = LH_HW_TARGET_GL_FBO;
  t.u.gl_fbo_name = s->fbo;
  return t;
}

// Resolve both extension and core GL entry points for the libretro core.
static void *gles_dlsym(const char *sym) {
  static void *handles[3];
  static int opened;
  if (!opened) {
    opened = 1;
    // Prefer GLES3 symbols when available.
    handles[0] = dlopen("libGLESv3.so", RTLD_LAZY | RTLD_LOCAL);
    handles[1] = dlopen("libGLESv2.so", RTLD_LAZY | RTLD_LOCAL);
    handles[2] = dlopen("libEGL.so", RTLD_LAZY | RTLD_LOCAL);
  }
  for (int i = 0; i < 3; i++) {
    if (!handles[i]) continue;
    void *p = dlsym(handles[i], sym);
    if (p) return p;
  }
  return NULL;
}

static void *egl_get_proc_address(void *user, const char *sym) {
  (void)user;
  if (!sym) return NULL;
  void *p = (void *)eglGetProcAddress(sym);
  if (!p) p = gles_dlsym(sym);
  if (!p) {
    LOGE("could not resolve GL entry point '%s'", sym);
  }
  return p;
}

// Build UVs for the used render-target sub-rectangle and rotation.
static void build_uvs(const egl_state *s, int width, int height, int rotation,
                      float out[8]) {
  float su = s->fbo_width > 0 ? (float)width / (float)s->fbo_width : 1.0f;
  float sv = s->fbo_height > 0 ? (float)height / (float)s->fbo_height : 1.0f;

  float u[4] = {0.0f, 1.0f, 0.0f, 1.0f};
  float v[4] = {0.0f, 0.0f, 1.0f, 1.0f};

  if (!s->bottom_left_origin) {
    for (int i = 0; i < 4; i++) v[i] = 1.0f - v[i];
  }

  for (int i = 0; i < 4; i++) {
    float cu = u[i] - 0.5f;
    float cv = v[i] - 0.5f;
    float ru = cu, rv = cv;
    switch (rotation & 3) {
      case 1:
        ru = cv;
        rv = -cu;
        break;
      case 2:
        ru = -cu;
        rv = -cv;
        break;
      case 3:
        ru = -cv;
        rv = cu;
        break;
      default:
        break;
    }
    out[i * 2 + 0] = (ru + 0.5f) * su;
    out[i * 2 + 1] = (rv + 0.5f) * sv;
  }
}

static int egl_present(void *user, int width, int height, int rotation) {
  egl_state *s = (egl_state *)user;
  if (!s->created) return -1;

  apply_pending_window(s);

  if (s->surface == EGL_NO_SURFACE) {
    return 0;
  }
  if (eglMakeCurrent(s->display, s->surface, s->surface, s->context) !=
      EGL_TRUE) {
    LOGE("present: eglMakeCurrent failed 0x%x", eglGetError());
    return -1;
  }

  EGLint win_w = 0, win_h = 0;
  eglQuerySurface(s->display, s->surface, EGL_WIDTH, &win_w);
  eglQuerySurface(s->display, s->surface, EGL_HEIGHT, &win_h);
  if (win_w <= 0 || win_h <= 0) return 0;

  // Reset state that the core may have left enabled.
  glBindFramebuffer(GL_FRAMEBUFFER, 0);
  glDisable(GL_SCISSOR_TEST);
  glDisable(GL_STENCIL_TEST);
  glDisable(GL_DEPTH_TEST);
  glDisable(GL_BLEND);
  glDisable(GL_CULL_FACE);
  glDisable(GL_DITHER);
  glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
  glDepthMask(GL_FALSE);
  glViewport(0, 0, win_w, win_h);
  glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
  glClear(GL_COLOR_BUFFER_BIT);

  if (s->bind_vao && s->vao) s->bind_vao(s->vao);

  static const float pos[8] = {
      -1.0f, -1.0f,  // bottom-left
      1.0f,  -1.0f,  // bottom-right
      -1.0f, 1.0f,   // top-left
      1.0f,  1.0f,   // top-right
  };
  float uvs[8];
  build_uvs(s, width, height, rotation, uvs);
  float verts[16];
  for (int i = 0; i < 4; i++) {
    verts[i * 4 + 0] = pos[i * 2 + 0];
    verts[i * 4 + 1] = pos[i * 2 + 1];
    verts[i * 4 + 2] = uvs[i * 2 + 0];
    verts[i * 4 + 3] = uvs[i * 2 + 1];
  }

  glUseProgram(s->program);
  glBindBuffer(GL_ARRAY_BUFFER, s->vbo);
  glBufferData(GL_ARRAY_BUFFER, sizeof(verts), verts, GL_STREAM_DRAW);
  glEnableVertexAttribArray((GLuint)s->attr_pos);
  glVertexAttribPointer((GLuint)s->attr_pos, 2, GL_FLOAT, GL_FALSE,
                        4 * sizeof(float), (const void *)0);
  glEnableVertexAttribArray((GLuint)s->attr_uv);
  glVertexAttribPointer((GLuint)s->attr_uv, 2, GL_FLOAT, GL_FALSE,
                        4 * sizeof(float), (const void *)(2 * sizeof(float)));
  glActiveTexture(GL_TEXTURE0);
  glBindTexture(GL_TEXTURE_2D, s->color_tex);
  glUniform1i(s->uniform_tex, 0);
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

  glDisableVertexAttribArray((GLuint)s->attr_pos);
  glDisableVertexAttribArray((GLuint)s->attr_uv);
  glBindBuffer(GL_ARRAY_BUFFER, 0);
  if (s->bind_vao && s->vao) s->bind_vao(0);

  if (!eglSwapBuffers(s->display, s->surface)) {
    EGLint err = eglGetError();
    LOGE("eglSwapBuffers failed: 0x%x", err);
    if (err == EGL_BAD_SURFACE || err == EGL_BAD_NATIVE_WINDOW) {
      // The consumer went away underneath us. Drop the surface; the next
      // window handed over rebuilds it.
      eglMakeCurrent(s->display, s->pbuffer, s->pbuffer, s->context);
      eglDestroySurface(s->display, s->surface);
      s->surface = EGL_NO_SURFACE;
    }
    glBindFramebuffer(GL_FRAMEBUFFER, s->fbo);
    return -1;
  }

  if (!s->logged_first_present || width != s->last_core_w ||
      height != s->last_core_h || (int)win_w != s->last_win_w ||
      (int)win_h != s->last_win_h) {
    const char *why = s->logged_first_present ? "geometry changed" : "first";
    s->logged_first_present = 1;
    s->last_core_w = width;
    s->last_core_h = height;
    s->last_win_w = (int)win_w;
    s->last_win_h = (int)win_h;
    LOGI("present (%s): core %dx%d into target %dx%d, window %dx%d%s, "
         "rotation %d, bottom_left_origin %d",
         why, width, height, s->fbo_width, s->fbo_height, (int)win_w,
         (int)win_h,
         (width > (int)win_w || height > (int)win_h) ? "  [DOWNSCALING]" : "",
         rotation, s->bottom_left_origin);
  }

  glBindFramebuffer(GL_FRAMEBUFFER, s->fbo);
  return 0;
}

int egl_backend_install(lh_host *host) {
  memset(&g_egl, 0, sizeof(g_egl));
  pthread_mutex_init(&g_egl.window_lock, NULL);
  g_egl.display = EGL_NO_DISPLAY;
  g_egl.context = EGL_NO_CONTEXT;
  g_egl.surface = EGL_NO_SURFACE;
  g_egl.pbuffer = EGL_NO_SURFACE;

  lh_hw_backend backend;
  memset(&backend, 0, sizeof(backend));
  backend.struct_version = LH_HW_BACKEND_VERSION;
  backend.supports = egl_supports;
  backend.context_create = egl_context_create;
  backend.context_destroy = egl_context_destroy;
  backend.make_current = egl_make_current;
  backend.release_current = egl_release_current;
  backend.current_target = egl_current_target;
  backend.get_proc_address = egl_get_proc_address;
  backend.present = egl_present;
  return lh_set_hw_backend(host, &backend, &g_egl);
}

void egl_backend_set_window(ANativeWindow *window) {
  pthread_mutex_lock(&g_egl.window_lock);
  g_egl.pending_window = window;
  g_egl.window_dirty = 1;
  pthread_mutex_unlock(&g_egl.window_lock);
}

void egl_backend_shutdown(void) {
  pthread_mutex_lock(&g_egl.window_lock);
  g_egl.pending_window = NULL;
  g_egl.window_dirty = 1;
  pthread_mutex_unlock(&g_egl.window_lock);
}
