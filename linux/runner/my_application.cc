#include "my_application.h"

#include <flutter_linux/flutter_linux.h>

#include "flutter/generated_plugin_registrant.h"
#include "native_game.h"

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

// Gives the window an icon of its own, taken from the bundle next to the
// binary.
//
// Without this the only icon a desktop can find is the one a desktop entry
// points at, which means nothing at all when the app runs from an AppImage or
// an unpacked archive that was never installed. The themed name is tried first
// so an installed copy keeps using the system icon.
static void my_application_set_window_icon(GtkWindow* window) {
  if (gtk_icon_theme_has_icon(gtk_icon_theme_get_default(), APPLICATION_ID)) {
    gtk_window_set_icon_name(window, APPLICATION_ID);
    return;
  }

  g_autofree gchar* executable = g_file_read_link("/proc/self/exe", nullptr);
  if (executable == nullptr) {
    return;
  }

  g_autofree gchar* bundle_dir = g_path_get_dirname(executable);
  g_autofree gchar* icon_path =
      g_build_filename(bundle_dir, "data", "flutter_assets", "assets", "icons",
                       "moonfin.png", nullptr);

  g_autoptr(GError) error = nullptr;
  g_autoptr(GdkPixbuf) icon = gdk_pixbuf_new_from_file(icon_path, &error);
  if (icon == nullptr) {
    g_warning("Could not load the window icon from %s: %s", icon_path,
              error->message);
    return;
  }

  gtk_window_set_icon(window, icon);
}

// The opening of the entry we write. Generating from this is what lets a later
// run tell its own entry apart from somebody else's, so both sides stay in
// step.
#define MOONFIN_ENTRY_HEADER \
  "[Desktop Entry]\n"        \
  "Type=Application\n"       \
  "Name=Moonfin\n"           \
  "Comment=Jellyfin & Emby media client\n"

// Asks the desktop to reread the directory. Best effort, desktops without the
// tool pick the change up on their own.
static void my_application_refresh_desktop_database(
    const gchar* applications_dir) {
  const gchar* argv[] = {"update-desktop-database", applications_dir, nullptr};
  g_spawn_async(nullptr, const_cast<gchar**>(argv), nullptr,
                G_SPAWN_SEARCH_PATH, nullptr, nullptr, nullptr, nullptr);
}

// A desktop environment or an AppImage manager drops one of these to say it
// handles integration itself and that bundles should keep out of it.
static gboolean my_application_desktop_integration_opted_out() {
  g_autofree gchar* user_marker = g_build_filename(
      g_get_user_data_dir(), "appimagekit", "no_desktopintegration", nullptr);
  return g_file_test(user_marker, G_FILE_TEST_EXISTS) ||
         g_file_test("/usr/share/appimagekit/no_desktopintegration",
                     G_FILE_TEST_EXISTS) ||
         g_file_test("/etc/appimagekit/no_desktopintegration",
                     G_FILE_TEST_EXISTS);
}

// True when an entry other than ours already launches this same image.
//
// A manager such as Gear Lever or AppImageLauncher writes one under a name of
// its own once it takes an image on, and an entry of ours beside it is what
// puts Moonfin in the menu twice.
static gboolean my_application_appimage_is_integrated(
    const gchar* applications_dir, const gchar* appimage) {
  GDir* dir = g_dir_open(applications_dir, 0, nullptr);
  if (dir == nullptr) {
    return FALSE;
  }

  gboolean integrated = FALSE;
  const gchar* name;
  while ((name = g_dir_read_name(dir)) != nullptr) {
    if (!g_str_has_suffix(name, ".desktop") ||
        g_strcmp0(name, APPLICATION_ID ".desktop") == 0) {
      continue;
    }

    g_autofree gchar* path = g_build_filename(applications_dir, name, nullptr);
    g_autofree gchar* contents = nullptr;
    if (!g_file_get_contents(path, &contents, nullptr, nullptr)) {
      continue;
    }

    // An entry of ours saved under some other name still names the image, so
    // without this it would read as somebody else's integration.
    if (g_str_has_prefix(contents, MOONFIN_ENTRY_HEADER)) {
      continue;
    }

    if (g_strstr_len(contents, -1, appimage) != nullptr) {
      integrated = TRUE;
      break;
    }
  }

  g_dir_close(dir);
  return integrated;
}

// Takes away an entry an earlier run wrote, now that something else offers one
// for the same image. Only ever clears a file this app produced.
static void my_application_remove_desktop_entry(const gchar* applications_dir,
                                                const gchar* entry_path) {
  g_autofree gchar* existing = nullptr;
  if (!g_file_get_contents(entry_path, &existing, nullptr, nullptr)) {
    return;
  }

  if (!g_str_has_prefix(existing, MOONFIN_ENTRY_HEADER)) {
    return;
  }

  g_autoptr(GFile) entry = g_file_new_for_path(entry_path);
  if (g_file_delete(entry, nullptr, nullptr)) {
    my_application_refresh_desktop_database(applications_dir);
  }
}

// Puts the bundle icon where the icon theme looks for it.
//
// This happens even when the menu entry belongs to a manager, because the
// window and the taskbar resolve artwork by name and an AppImage installs
// nothing for that lookup to find.
static void my_application_install_icon() {
  g_autofree gchar* icons_dir =
      g_build_filename(g_get_user_data_dir(), "icons", "hicolor", "512x512",
                       "apps", nullptr);
  if (g_mkdir_with_parents(icons_dir, 0755) != 0) {
    return;
  }

  g_autofree gchar* executable = g_file_read_link("/proc/self/exe", nullptr);
  if (executable == nullptr) {
    return;
  }
  g_autofree gchar* bundle_dir = g_path_get_dirname(executable);
  g_autofree gchar* source_path =
      g_build_filename(bundle_dir, "data", "flutter_assets", "assets", "icons",
                       "moonfin.png", nullptr);
  g_autofree gchar* icon_path =
      g_build_filename(icons_dir, APPLICATION_ID ".png", nullptr);

  g_autoptr(GFile) source = g_file_new_for_path(source_path);
  g_autoptr(GFile) target = g_file_new_for_path(icon_path);

  // Leave the same artwork alone, so an ordinary launch does no work here.
  g_autoptr(GFileInfo) source_info =
      g_file_query_info(source, G_FILE_ATTRIBUTE_STANDARD_SIZE,
                        G_FILE_QUERY_INFO_NONE, nullptr, nullptr);
  g_autoptr(GFileInfo) target_info =
      g_file_query_info(target, G_FILE_ATTRIBUTE_STANDARD_SIZE,
                        G_FILE_QUERY_INFO_NONE, nullptr, nullptr);
  if (source_info != nullptr && target_info != nullptr &&
      g_file_info_get_size(source_info) == g_file_info_get_size(target_info)) {
    return;
  }

  g_autoptr(GError) copy_error = nullptr;
  g_file_copy(source, target, G_FILE_COPY_OVERWRITE, nullptr, nullptr, nullptr,
              &copy_error);
}

// Gives a Wayland compositor something to find when it looks up this window.
//
// A Wayland window carries no icon of its own, so the desktop resolves one by
// matching the window's app id against the installed desktop entries. An
// AppImage installs nothing, which leaves the taskbar with a placeholder no
// matter what the image contains. Writing an entry into the user's own data
// directory, pointing back at the running image, is the only thing that
// answers that lookup.
//
// This runs for AppImage only. Every other package installs its own entry, and
// a second copy here would shadow it and go stale. An AppImage under a manager
// already has an entry too, so that case steps aside the same way.
static void my_application_install_desktop_entry() {
  const gchar* appimage = g_getenv("APPIMAGE");
  if (appimage == nullptr || *appimage == '\0') {
    return;
  }

  my_application_install_icon();

  g_autofree gchar* applications_dir =
      g_build_filename(g_get_user_data_dir(), "applications", nullptr);
  g_autofree gchar* entry_path = g_build_filename(
      applications_dir, APPLICATION_ID ".desktop", nullptr);

  // The manager owns the menu entry, so stand down and clear the one an
  // earlier run put next to it rather than keep the duplicate alive.
  if (my_application_appimage_is_integrated(applications_dir, appimage)) {
    my_application_remove_desktop_entry(applications_dir, entry_path);
    return;
  }

  if (my_application_desktop_integration_opted_out()) {
    return;
  }

  g_autofree gchar* entry = g_strdup_printf(
      MOONFIN_ENTRY_HEADER
      "Exec=\"%s\" %%U\n"
      "Icon=%s\n"
      "Categories=AudioVideo;Video;\n"
      "Terminal=false\n"
      "StartupWMClass=%s\n"
      "MimeType=x-scheme-handler/moonfin;\n",
      appimage, APPLICATION_ID, APPLICATION_ID);

  // Rewrite only when something changed, so moving the image updates the entry
  // while an ordinary launch touches nothing.
  g_autofree gchar* existing = nullptr;
  if (g_file_get_contents(entry_path, &existing, nullptr, nullptr) &&
      g_strcmp0(existing, entry) == 0) {
    return;
  }

  if (g_mkdir_with_parents(applications_dir, 0755) != 0) {
    return;
  }

  g_autoptr(GError) error = nullptr;
  if (!g_file_set_contents(entry_path, entry, -1, &error)) {
    g_warning("Could not write the desktop entry to %s: %s", entry_path,
              error->message);
    return;
  }

  // Index the scheme handler so moonfin:// links resolve right away.
  my_application_refresh_desktop_database(applications_dir);
}

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);

  // A moonfin:// launch while the app is already open just raises the
  // existing window. app_links receives the forwarded command line
  // separately.
  GList* windows = gtk_application_get_windows(GTK_APPLICATION(application));
  if (windows) {
    gtk_window_present(GTK_WINDOW(windows->data));
    return;
  }

  GtkWindow* window =
      GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));

  gtk_window_set_title(window, "Moonfin");
  my_application_install_desktop_entry();
  my_application_set_window_icon(window);

  gtk_window_set_default_size(window, 1280, 720);
  gtk_widget_show(GTK_WIDGET(window));

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(project, self->dart_entrypoint_arguments);

  FlView* view = fl_view_new(project);
  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

  moonfin_game_register(fl_view_get_engine(view));

  gtk_widget_grab_focus(GTK_WIDGET(view));
}

// Implements GApplication::local_command_line.
static gboolean my_application_local_command_line(GApplication* application, gchar*** arguments, int* exit_status) {
  MyApplication* self = MY_APPLICATION(application);
  // Strip out the first argument as it is the binary name.
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_application_register(application, nullptr, &error)) {
     g_warning("Failed to register: %s", error->message);
     *exit_status = 1;
     return TRUE;
  }

  g_application_activate(application);
  *exit_status = 0;

  // FALSE lets GApplication forward the command line to the primary instance,
  // which is how a moonfin:// URI reaches app_links both on a cold start and
  // when another instance is already running.
  return FALSE;
}

static void my_application_startup(GApplication* application) {
  G_APPLICATION_CLASS(my_application_parent_class)->startup(application);
}

static void my_application_shutdown(GApplication* application) {
  G_APPLICATION_CLASS(my_application_parent_class)->shutdown(application);
}

// Implements GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->local_command_line = my_application_local_command_line;
  G_APPLICATION_CLASS(klass)->startup = my_application_startup;
  G_APPLICATION_CLASS(klass)->shutdown = my_application_shutdown;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

static void my_application_init(MyApplication* self) {}

MyApplication* my_application_new() {
  // Set the program name to the application ID, which helps various systems
  // like GTK and desktop environments map this running application to its
  // corresponding .desktop file. This ensures better integration by allowing
  // the application to be recognized beyond its binary name.
  g_set_prgname(APPLICATION_ID);

  // Single-instance with command-line forwarding, required for app_links to
  // receive moonfin:// URIs (a second launch hands its arguments to the
  // primary instance over D-Bus and exits).
  return MY_APPLICATION(g_object_new(my_application_get_type(),
                                     "application-id", APPLICATION_ID,
                                     "flags",
                                     G_APPLICATION_HANDLES_COMMAND_LINE |
                                         G_APPLICATION_HANDLES_OPEN,
                                     nullptr));
}
