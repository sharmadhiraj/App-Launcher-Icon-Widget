import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_launcher_icon_widget_platform_interface.dart';

/// An implementation of [AppLauncherIconWidgetPlatform] that uses method channels.
class MethodChannelAppLauncherIconWidget extends AppLauncherIconWidgetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_launcher_icon_widget');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
