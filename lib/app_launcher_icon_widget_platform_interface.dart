import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_launcher_icon_widget_method_channel.dart';

abstract class AppLauncherIconWidgetPlatform extends PlatformInterface {
  /// Constructs a AppLauncherIconWidgetPlatform.
  AppLauncherIconWidgetPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppLauncherIconWidgetPlatform _instance = MethodChannelAppLauncherIconWidget();

  /// The default instance of [AppLauncherIconWidgetPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppLauncherIconWidget].
  static AppLauncherIconWidgetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppLauncherIconWidgetPlatform] when
  /// they register themselves.
  static set instance(AppLauncherIconWidgetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
