import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:apotech_apps/view/login/login_view.dart';
import 'package:apotech_apps/view/regis/regis_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.imageHomePath),
          const SizedBox(height: AppSizes.height * 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 2.5),
            child: Column(children: [
              Text(
                'Welcome to Apotech',
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
                'Do you want some help with your health to get better life?',
                style: AppTextStyle.light(
                  context,
                  fontSize: AppSizes.height * 1.4,
                  color: AppColors.baseLv4,
                ),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          const SizedBox(height: AppSizes.height * 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 1.5),
            child: Column(
              children: [
                AppButton(
                  text: 'SIGN UP WITH EMAIL',
                  elevation: 8,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RegisterView.routeName,
                      ModalRoute.withName(HomeView.routeName),
                    );
                  },
                ),
                const SizedBox(height: AppSizes.height),
                const AppButton(
                  leftIcon: Icons.facebook,
                  leftIconColor: AppColors.primary,
                  text: 'CONTINUE WITH FACEBOOK',
                  backgroundColor: Colors.white,
                  textColor: AppColors.base,
                  textSize: 12,
                  borderColor: AppColors.baseLv5,
                ),
                const SizedBox(height: AppSizes.height),
                const AppButton(
                  leftImage: AppAssets.imageGoogleIconPath,
                  text: 'CONTINUE WITH GMAIL',
                  backgroundColor: Colors.white,
                  textColor: AppColors.base,
                  textSize: 12,
                  borderColor: AppColors.baseLv5,
                ),
                const SizedBox(height: AppSizes.height),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginView.routeName,
                      ModalRoute.withName(HomeView.routeName),
                    );
                  },
                  child: Text(
                    'LOGIN',
                    style: AppTextStyle.medium(
                      context,
                      color: AppColors.baseLv5,
                      fontSize: AppSizes.height * 1.4,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
