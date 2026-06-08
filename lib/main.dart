import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safepocket_project/routes/app_routes.dart';

import 'routes/app_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      getPages: AppPages.getPages,
    );
  }
}
