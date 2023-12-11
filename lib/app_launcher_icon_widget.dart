
import 'app_launcher_icon_widget_platform_interface.dart';

class AppLauncherIconWidget {
  Future<String?> getPlatformVersion() {
    return AppLauncherIconWidgetPlatform.instance.getPlatformVersion();
  }
}
