part of 'sign_in_screen_view.dart';

class SignInScreenViewController extends GetxController {
  RxBool isAgreed = false.obs;

  void toggleAgreed(bool? val) {
    isAgreed.value = val ?? false;
  }
}
