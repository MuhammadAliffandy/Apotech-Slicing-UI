import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const Onboarding({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            height: AppSizes.padding * 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding * 3,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: AppTextStyle.bold(
                    context,
                    fontSize: AppSizes.height * 2,
                    color: AppColors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.height,
                ),
                Text(
                  subtitle,
                  style: AppTextStyle.light(
                    context,
                    fontSize: AppSizes.height * 1.4,
                    color: AppColors.baseLv4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
