import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductOrderCard extends StatelessWidget {
  final String? image;
  final String? price;
  const ProductOrderCard({
    super.key,
    this.image,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
                color: AppColors.baseLv2,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image ?? AppAssets.imageMiniProduct1Path,
                    ))),
          ),
          const SizedBox(width: AppSizes.height),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sugar Free Gold',
                          style: AppTextStyle.medium(
                            context,
                            fontSize: 16,
                            color: AppColors.purple,
                          ),
                        ),
                        const SizedBox(height: AppSizes.height / 2),
                        Text(
                          'bottle of 500 pellets',
                          style: AppTextStyle.regular(
                            context,
                            fontSize: 14,
                            color: AppColors.baseLv5,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.baseLv4,
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: const EdgeInsets.all(AppSizes.height / 4),
                          child: Icon(
                            Icons.close,
                            color: AppColors.baseLv4,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      this.price ?? 'RP 25.000',
                      style: AppTextStyle.medium(
                        context,
                        fontSize: 18,
                        color: AppColors.purple,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0XFFF2F4FF),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFDFE3FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(AppSizes.height / 4),
                              child: Icon(
                                Icons.remove,
                                color: AppColors.primary,
                                size: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
                            child: Text(
                              '1',
                              style: AppTextStyle.medium(context, fontSize: 16),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFA0ABFF),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(AppSizes.height / 4),
                              child: Icon(
                                Icons.add,
                                color: AppColors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
