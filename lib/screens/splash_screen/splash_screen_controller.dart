part of 'splash_screen_view.dart';

class SplashScreenViewController extends GetxController {
  final visibleLetterCount = 0.obs;
  final showGreenText = true.obs;
  final showCircle = false.obs;
  final circleSize = 0.0.obs;
  final circleTopOffset = (-80.0).obs;
  final showCircleText = false.obs;
  final isGreenPhase = false.obs;
  final showWave = false.obs;
  final showButton = false.obs;
  final textTopFraction = 0.5.obs;

  static const _letters = 'SafePocket';

  @override
  void onInit() {
    super.onInit();
    _runAnimation();
  }

  Future<void> _runAnimation() async {
    // Step 1: letters appear one by one
    for (int i = 1; i <= _letters.length; i++) {
      await Future.delayed(const Duration(milliseconds: 80));
      visibleLetterCount.value = i;
    }

    // Step 2: pause on full text
    await Future.delayed(const Duration(milliseconds: 500));

    // Step 3: small circle appears at top
    showCircle.value = true;
    circleSize.value = 80;
    circleTopOffset.value = -80;
    await Future.delayed(const Duration(milliseconds: 50));

    // Step 4: circle falls to center
    circleTopOffset.value = 0;
    await Future.delayed(const Duration(milliseconds: 600));

    // Step 5: circle grows to wrap text
    circleSize.value = 220;
    await Future.delayed(const Duration(milliseconds: 400));
    showCircleText.value = true;
    showGreenText.value = false;

    // Step 6: circle explodes to fill screen
    await Future.delayed(const Duration(milliseconds: 200));
    circleSize.value = 1500;
    await Future.delayed(const Duration(milliseconds: 700));

    // Step 7: solid green bg, circle hidden, text stays at center
    isGreenPhase.value = true;
    showCircle.value = false;

    await Future.delayed(const Duration(milliseconds: 200));

    // Step 8: wave appears + text slides up to sit above wave
    showWave.value = true;
    textTopFraction.value = 0.40;
    await Future.delayed(const Duration(milliseconds: 400));

    // Step 9: button fades in
    showButton.value = true;
  }

  void onContinue() {
    Get.offAllNamed('/home');
  }
}
