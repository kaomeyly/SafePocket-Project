import 'package:get/get.dart';
import 'package:safepocket_project/screens/login_screen/login_screen_view.dart';

import 'app_routes.dart';

class AppPages {
  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreenView(),
      binding: LoginScreenViewBinding(),
    ),
  ];
}
