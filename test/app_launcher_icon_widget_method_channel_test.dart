import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_launcher_icon_widget/app_launcher_icon_widget_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAppLauncherIconWidget platform = MethodChannelAppLauncherIconWidget();
  const MethodChannel channel = MethodChannel('app_launcher_icon_widget');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
