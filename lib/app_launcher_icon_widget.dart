import 'dart:typed_data';

import 'app_launcher_icon_widget_platform_interface.dart';

class AppLauncherIconWidget {
  static Future<Uint8List?> getAppLauncherIcon() {
    return AppLauncherIconWidgetPlatform.instance.getAppLauncherIcon();
  }
}
