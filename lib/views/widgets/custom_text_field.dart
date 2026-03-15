import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelText: labelText,
        labelStyle: AppTextStyles.inputLabel,
        prefixIcon: Image.asset(
          prefixIcon,
          height: AppSizes.fieldIconSize,
          width: AppSizes.fieldIconSize,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
