import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safepocket_project/app/routes/app_routes.dart';
import 'package:safepocket_project/app/shared/themes/app_colors.dart';
import 'package:safepocket_project/widgets/buttons/custom_btn.dart';
import 'package:safepocket_project/widgets/txtfield/custom_txtfield.dart';

part 'sign_in_screen_binding.dart';
part 'sign_in_screen_controller.dart';

class SignInScreenView extends GetView<SignInScreenViewController> {
  const SignInScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              SizedBox(height: 80),
              _buildLogin(),
              SizedBox(height: 25),
              _buildtxtfield(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Column(
      children: [
        Image.asset("assets/images/logotest.png"),
        Text(
          "SafePocket",
          style: TextStyle(
            fontSize: 23,
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Track. Control. Grow.\nYour money, your way.",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.txtcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildtxtfield() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "Create your account",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 3),
        Text(
          "Start your journey to smarter spending.",
          style: TextStyle(
            fontSize: 15,
            color: AppColors.txtcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 35),
        CustomTxtfield(
          hintText: "Full Name",
          prefixIcons: Icon(Icons.person, size: 28, color: AppColors.txtcolor),
          txtController: TextEditingController(),
        ),
        SizedBox(height: 20),
        CustomTxtfield(
          hintText: "Email Address",
          prefixIcons: Icon(
            Icons.email_outlined,
            size: 28,
            color: AppColors.txtcolor,
          ),
          txtController: TextEditingController(),
        ),
        SizedBox(height: 20),
        CustomTxtfield(
          hintText: "Password",
          prefixIcons: Icon(
            Icons.lock_outline_rounded,
            size: 28,
            color: AppColors.txtcolor,
          ),
          suffixIcons: Icon(
            Icons.visibility_off,
            size: 28,
            color: AppColors.txtcolor,
          ),
          txtController: TextEditingController(),
        ),
        SizedBox(height: 20),
        CustomTxtfield(
          hintText: "Confirm Password",
          prefixIcons: Icon(
            Icons.lock_outline_rounded,
            size: 28,
            color: AppColors.txtcolor,
          ),
          suffixIcons: Icon(
            Icons.visibility_off,
            size: 28,
            color: AppColors.txtcolor,
          ),
          txtController: TextEditingController(),
        ),
        SizedBox(height: 10),
        Obx(
          () => Row(
            children: [
              Checkbox(
                value: controller.isAgreed.value,
                onChanged: controller.toggleAgreed,
                activeColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.txtcolor,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: "I agree to the "),
                      TextSpan(
                        text: "Term of Service",
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Private Policy",
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        CustomBtn(
          text: "Sign IN",
          onPressed: () => Get.offAndToNamed(AppRoutes.signIn),
        ),
      ],
    );
  }
}
