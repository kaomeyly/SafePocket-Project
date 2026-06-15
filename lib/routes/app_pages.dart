import 'package:get/get.dart';
import 'package:safepocket_project/screens/login_screen/login_screen_view.dart';
import 'package:safepocket_project/screens/splash_screen/splash_screen_view.dart';

import 'app_routes.dart';

class AppPages {
  static List<GetPage<dynamic>> getPages = [
    //splash screen
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreenView(),
      binding: SplashScreenViewBinding(),
    ),
    //Login screen
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreenView(),
      binding: LoginScreenViewBinding(),
    ),
  ];
}
