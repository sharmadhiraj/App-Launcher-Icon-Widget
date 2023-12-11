import 'package:flutter_test/flutter_test.dart';
import 'package:app_launcher_icon_widget/app_launcher_icon_widget.dart';
import 'package:app_launcher_icon_widget/app_launcher_icon_widget_platform_interface.dart';
import 'package:app_launcher_icon_widget/app_launcher_icon_widget_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppLauncherIconWidgetPlatform
    with MockPlatformInterfaceMixin
    implements AppLauncherIconWidgetPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppLauncherIconWidgetPlatform initialPlatform = AppLauncherIconWidgetPlatform.instance;

  test('$MethodChannelAppLauncherIconWidget is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppLauncherIconWidget>());
  });

  test('getPlatformVersion', () async {
    AppLauncherIconWidget appLauncherIconWidgetPlugin = AppLauncherIconWidget();
    MockAppLauncherIconWidgetPlatform fakePlatform = MockAppLauncherIconWidgetPlatform();
    AppLauncherIconWidgetPlatform.instance = fakePlatform;

    expect(await appLauncherIconWidgetPlugin.getPlatformVersion(), '42');
  });
}
