import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductChild extends StatelessWidget {
  final String? image;
  final String? title;
  final String? price;
  final String? rate;

  const ProductChild({
    super.key,
    this.image,
    this.price,
    this.rate,
    this.title,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 13,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        splashColor: AppColors.base.withOpacity(0.20),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink(
              decoration: const BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.padding * 1.5,
                  vertical: AppSizes.padding,
                ),
                child: Image.asset(
                  image ?? AppAssets.imageOnboard1Path,
                  width: 178,
                  height: 154,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.height),
                Padding(
                  padding: const EdgeInsets.only(left: AppSizes.padding),
                  child: SizedBox(
                    width: 120,
                    child: Text(
                      title ?? '',
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: AppTextStyle.medium(
                        context,
                        fontSize: 13,
                        color: AppColors.purple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.height),
                SizedBox(
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: AppSizes.padding),
                        child: Text(
                          price ?? '',
                          style: AppTextStyle.bold(
                            context,
                            fontSize: 14,
                            color: AppColors.purple,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(AppSizes.padding / 4),
                        decoration: const BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.white,
                              size: 16,
                            ),
                            Text(
                              rate ?? '',
                              style: AppTextStyle.bold(
                                context,
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.height * 1.5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
