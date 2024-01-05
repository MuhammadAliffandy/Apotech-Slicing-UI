import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppAssets.backgroundAuroraPath),
                      )),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    AppAssets.imageLogoPath,
                    scale: 1,
                  ),
                  Text(
                    'Apotech',
                    style: AppTextStyle.medium(
                      context,
                      fontSize: AppSizes.height * 2,
                      color: AppColors.baseLv3,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
