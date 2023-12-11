import Flutter
import UIKit

public class AppLauncherIconWidgetPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "app_launcher_icon_widget", binaryMessenger: registrar.messenger())
        let instance = AppLauncherIconWidgetPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getAppLauncherIcon" {
            result(getAppLauncherIcon())
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func getAppLauncherIcon() -> FlutterStandardTypedData? {
        if let icon = getIconImage() {
            return FlutterStandardTypedData(bytes: icon)
        } else {
            return nil
        }
    }

    private func getIconImage() -> Data? {
        if let icon = UIImage(named: "AppIcon") {
            return icon.pngData()
        } else {
            return nil
        }
    }
}
