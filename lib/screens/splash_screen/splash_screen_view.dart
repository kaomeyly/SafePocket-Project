import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'splash_screen_binding.dart';
part 'splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenViewController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          fit: StackFit.expand,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: controller.isGreenPhase.value
                  ? const Color(0xFF1A7A50)
                  : Colors.white,
            ),

            // Falling + growing circle — exact brand green
            Obx(() {
              if (!controller.showCircle.value) return const SizedBox();
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 550),
                curve: Curves.easeIn,
                top:
                    size.height / 2 -
                    controller.circleSize.value / 2 +
                    (controller.circleTopOffset.value * (size.height / 2) / 80),
                left: size.width / 2 - controller.circleSize.value / 2,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  width: controller.circleSize.value,
                  height: controller.circleSize.value,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A7A50), // exact match to screenshot
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }),

            // Green letters sliding in on white bg
            Obx(() {
              if (!controller.showGreenText.value) return const SizedBox();
              const letters = 'SafePocket';
              return Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(letters.length, (i) {
                    final visible = i < controller.visibleLetterCount.value;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      transform: Matrix4.translationValues(
                        0,
                        visible ? 0 : -30,
                        0,
                      ),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: visible ? 1.0 : 0.0,
                        child: Text(
                          letters[i],
                          style: const TextStyle(
                            color: Color(0xFF1A7A50),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),

            // White "SafePocket" — on circle, then stays as bg goes green, slides up with wave
            Obx(() {
              if (!controller.showCircleText.value) return const SizedBox();
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                // center text vertically: fraction * height - half text height (~20px)
                top: size.height * controller.textTopFraction.value - 0,
                left: 0,
                right: 0,
                child: const Center(
                  child: Text(
                    'SafePocket',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              );
            }),

            // Wave
            Obx(() {
              if (!controller.showWave.value) return const SizedBox();
              return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: _WaveClipper(),
                  child: Container(
                    height: size.height * 0.32,
                    color: Colors.white,
                  ),
                ),
              );
            }),

            // Continue button
            Obx(() {
              if (!controller.showButton.value) return const SizedBox();
              return Positioned(
                bottom: size.height * 0.08,
                left: size.width * 0.15,
                right: size.width * 0.15,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: 1.0,
                  child: ElevatedButton(
                    onPressed: controller.onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A7A50),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at the left, slightly below the top of the container
    path.lineTo(0, size.height * 0.2);

    // Create a quadratic bezier curve
    // Control point is in the middle-bottom to create the 'wave' dip
    path.quadraticBezierTo(
      size.width * 0.5, // Control X: Middle of screen
      size.height * 0.5, // Control Y: Below the curve for the dip
      size.width, // End X: Right side of screen
      size.height * 0.2, // End Y: Back to the starting height
    );

    // Complete the shape to fill the bottom area
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(_WaveClipper oldClipper) => false;
}
