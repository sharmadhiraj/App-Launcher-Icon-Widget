import 'package:app_launcher_icon_widget/app_launcher_icon_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyExampleApp());
}

class MyExampleApp extends StatelessWidget {
  const MyExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App Launcher Icon"),
        ),
        body: Center(
          child: AppLauncherIcon(),
        ),
      ),
    );
  }
}
