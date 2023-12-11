# App Launcher Icon Widget

Flutter plugin providing a widget and data for displaying the app launcher icon in Android & iOS.

#### Installation Guide

Check [here](https://pub.dev/packages/app_launcher_icon_widget/install)

#### Usage

##### Using the widget

`import 'package:app_launcher_icon_widget/app_launcher_icon_widget.dart';

// ...

AppLauncherIcon(
width: 64, //optional
height: 64, //optional
)`

##### Using the method

`import 'package:app_launcher_icon_widget/app_launcher_icon_widget.dart';

// ...

Uint8List? appIcon = await AppLauncherIconWidget.getAppLauncherIcon();`
