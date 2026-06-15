import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safepocket_project/app/shared/themes/app_colors.dart';
import 'package:safepocket_project/widgets/buttons/custom_btn.dart';
import 'package:safepocket_project/widgets/txtfield/custom_txtfield.dart';

part 'login_screen_binding.dart';
part 'login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenViewController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            _buildLogin(),
            SizedBox(height: 40),
            _buildtxtfield(),
          ],
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
          "Welcome back!",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 3),
        Text(
          "Log in to continue managing your finances.",
          style: TextStyle(
            fontSize: 15,
            color: AppColors.txtcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 35),
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
            Icons.lock_outlined,
            size: 28,
            color: AppColors.txtcolor,
          ),
          suffixIcons: Icon(
            Icons.remove_red_eye_rounded,
            size: 28,
            color: AppColors.txtcolor,
          ),
          isPass: true,
          isHide: true,
          txtController: TextEditingController(),
        ),
        SizedBox(height: 8),
        Align(
          alignment: .centerRight,
          child: Text(
            "Forget password?",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 40),
        CustomBtn(text: "Login"),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: .center,
          children: [
            Text(
              "Don’t have an account?  ",
              style: TextStyle(
                fontSize: 15,
                color: AppColors.txtcolor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Sign up",
              style: TextStyle(
                fontSize: 15,
                color: AppColors.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
