import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class BrandsChild extends StatelessWidget {
  final String? text;
  final String? image;

  const BrandsChild({
    super.key,
    this.text,
    this.image,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0A090F47),
                blurRadius: 16,
                offset: Offset(0, 9),
                spreadRadius: 0,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            image ?? AppAssets.imageLogoPath,
            scale: 1,
          ),
        ),
        const SizedBox(height: AppSizes.height * 1.5),
        SizedBox(
          width: 100,
          child: Text(
            text ?? '',
            style: AppTextStyle.regular(
              context,
              fontSize: 13,
              color: AppColors.purple,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            softWrap: true,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
