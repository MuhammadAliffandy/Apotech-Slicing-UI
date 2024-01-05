import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final InputBorder? border;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String value) onChanged;

  const AppTextField({
    super.key,
    this.label,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.obscureText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.name,
      obscureText: obscureText ?? false,
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
          focusColor: AppColors.primary,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelText: label,
          hintText: hintText,
          hintStyle: hintStyle,
          border: border,
          contentPadding: contentPadding,
          labelStyle: AppTextStyle.regular(
            context,
            fontSize: 15,
            color: AppColors.baseLv5,
          )),
    );
  }
}
