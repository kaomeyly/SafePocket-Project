import 'package:flutter/material.dart';

class CustomTxtfield extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcons;
  final Widget? prefixIcons;
  final bool isPass;
  final bool isHide;
  final TextEditingController? txtController;
  const CustomTxtfield({
    super.key,
    required this.hintText,
    required this.txtController,
    this.suffixIcons,
    this.prefixIcons,
    this.isPass = false,
    this.isHide = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txtController,
      obscureText: isPass && isHide,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcons,
        prefixIcon: prefixIcons,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 3, color: Color(0xFFB3B3B3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(width: 2, color: Color(0xFFB3B3B3)),
        ),
      ),
    );
  }
}
