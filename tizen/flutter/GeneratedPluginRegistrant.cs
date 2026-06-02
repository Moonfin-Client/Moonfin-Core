//
// Generated file. Do not edit.
//

using System;
using System.Runtime.InteropServices;
using Tizen.Flutter.Embedding;

internal class GeneratedPluginRegistrant
{
    [DllImport("flutter_plugins.so")]
    public static extern void WakelockPlusTizenPluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrar registrar);

    [DllImport("flutter_plugins.so")]
    public static extern void VideoPlayerTizenPluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrar registrar);

    [DllImport("flutter_plugins.so")]
    public static extern void SqflitePluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrar registrar);

    [DllImport("flutter_plugins.so")]
    public static extern void PermissionHandlerTizenPluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrar registrar);

    [DllImport("flutter_plugins.so")]
    public static extern void PackageInfoPlusTizenPluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrar registrar);

    [DllImport("flutter_plugins.so")]
    public static extern void FlutterSecureStorageTizenPluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrar registrar);

    [DllImport("flutter_plugins.so")]
    public static extern void DeviceInfoPlusTizenPluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrar registrar);

    [DllImport("flutter_plugins.so")]
    public static extern void ConnectivityPlusTizenPluginRegisterWithRegistrar(
        FlutterDesktopPluginRegistrar registrar);

    public static void RegisterPlugins(IPluginRegistry registry)
    {
        WakelockPlusTizenPluginRegisterWithRegistrar(
            registry.GetRegistrarForPlugin("WakelockPlusTizenPlugin"));
        VideoPlayerTizenPluginRegisterWithRegistrar(
            registry.GetRegistrarForPlugin("VideoPlayerTizenPlugin"));
        SqflitePluginRegisterWithRegistrar(
            registry.GetRegistrarForPlugin("SqflitePlugin"));
        PermissionHandlerTizenPluginRegisterWithRegistrar(
            registry.GetRegistrarForPlugin("PermissionHandlerTizenPlugin"));
        PackageInfoPlusTizenPluginRegisterWithRegistrar(
            registry.GetRegistrarForPlugin("PackageInfoPlusTizenPlugin"));
        FlutterSecureStorageTizenPluginRegisterWithRegistrar(
            registry.GetRegistrarForPlugin("FlutterSecureStorageTizenPlugin"));
        DeviceInfoPlusTizenPluginRegisterWithRegistrar(
            registry.GetRegistrarForPlugin("DeviceInfoPlusTizenPlugin"));
        ConnectivityPlusTizenPluginRegisterWithRegistrar(
            registry.GetRegistrarForPlugin("ConnectivityPlusTizenPlugin"));
    }
}
