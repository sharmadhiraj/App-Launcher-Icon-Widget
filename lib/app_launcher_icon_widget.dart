import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'app_launcher_icon_widget_platform_interface.dart';

class AppLauncherIconWidget {
  static Future<Uint8List?> getAppLauncherIcon() {
    return AppLauncherIconWidgetPlatform.instance.getAppLauncherIcon();
  }
}

class AppLauncherIcon extends StatelessWidget {
  AppLauncherIcon({this.width = 64, this.height = 64});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: AppLauncherIconWidget.getAppLauncherIcon(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          return Image.memory(
            snapshot.data!,
            width: width,
            height: height,
          );
        } else {
          return Container(
            width: width,
            height: height,
          );
        }
      },
    );
  }
}
