import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_launcher_icon_widget_platform_interface.dart';

class MethodChannelAppLauncherIconWidget extends AppLauncherIconWidgetPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel("app_launcher_icon_widget");

  @override
  Future<Uint8List?> getAppLauncherIcon() async {
    return await methodChannel.invokeMethod<Uint8List?>("getAppLauncherIcon");
  }
}
