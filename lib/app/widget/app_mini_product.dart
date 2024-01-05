import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MiniProductChild extends StatelessWidget {
  final String? text;
  final String? image;

  const MiniProductChild({
    super.key,
    this.image,
    this.text,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 140,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image ?? AppAssets.imageBottle1Path,
                    )),
                color: AppColors.base,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.padding * 1.5),
            child: Text(
              text ?? '',
              style: AppTextStyle.medium(
                context,
                fontSize: 14,
                color: AppColors.purple,
              ),
              softWrap: true,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
