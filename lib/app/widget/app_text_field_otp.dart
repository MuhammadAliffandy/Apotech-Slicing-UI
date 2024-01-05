import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextFieldOTP extends StatelessWidget {
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const AppTextFieldOTP({
    super.key,
    this.label,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.number,
      maxLength: 1,
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
          focusColor: AppColors.primary,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: label ?? 'placeholder',
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
          hintStyle: AppTextStyle.regular(
            context,
            fontSize: 20,
            color: AppColors.baseLv5,
          )),
    );
  }
}
