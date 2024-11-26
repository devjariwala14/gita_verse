import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gita_verse/view/main_screen.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: false,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gita Verse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
