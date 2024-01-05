import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? leftIconColor;
  final double? textSize;
  final IconData? leftIcon;
  final String? leftImage;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  const AppButton({
    super.key,
    this.text,
    this.backgroundColor,
    this.borderColor,
    this.leftIcon,
    this.elevation,
    this.textColor,
    this.textSize,
    this.onPressed,
    this.leftIconColor,
    this.padding,
    this.leftImage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius * 3),
            ),
          ),
          side: MaterialStateProperty.all(BorderSide(
            color: borderColor ?? Colors.transparent,
          )),
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? AppColors.primary),
          padding: MaterialStateProperty.all(padding ??
              const EdgeInsets.symmetric(
                horizontal: AppSizes.padding * 4,
                vertical: AppSizes.padding,
              )),
          elevation: MaterialStateProperty.all(elevation ?? 0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leftIcon == null
              ? const SizedBox.shrink()
              : Icon(
                  leftIcon ?? Icons.abc,
                  size: 20,
                  color: leftIconColor ?? AppColors.base,
                ),
          leftIcon == null
              ? const SizedBox.shrink()
              : const SizedBox(
                  width: AppSizes.height * 1.5,
                ),
          leftImage == null
              ? const SizedBox.shrink()
              : Image.asset(
                  leftImage ?? AppAssets.imageGoogleIconPath,
                  scale: 1.4,
                ),
          leftImage == null
              ? const SizedBox.shrink()
              : const SizedBox(
                  width: AppSizes.height * 1.5,
                ),
          Text(
            text ?? 'button',
            style: AppTextStyle.semiBold(
              context,
              color: textColor ?? AppColors.white,
              fontSize: textSize ?? 14,
            ),
          ),
        ],
      ),
    );
  }
}
