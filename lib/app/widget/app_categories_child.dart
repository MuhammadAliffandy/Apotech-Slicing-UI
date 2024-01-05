import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CategoriesChild extends StatelessWidget {
  final String? text;
  final String? icon;
  final Gradient? gradient;
  final void Function()? onTap;

  const CategoriesChild({
    super.key,
    this.text,
    this.icon,
    this.gradient,
    this.onTap,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 23,
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(40),
        splashColor: AppColors.base.withOpacity(0.20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: gradient,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      icon ?? '',
                      scale: 1,
                    )),
              ),
              const SizedBox(
                height: AppSizes.height,
              ),
              Text(
                text ?? '',
                style: AppTextStyle.regular(
                  context,
                  fontSize: 11,
                  color: AppColors.purple,
                ),
              ),
              const SizedBox(
                height: AppSizes.height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
