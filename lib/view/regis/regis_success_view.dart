import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:apotech_apps/view/login/login_view.dart';
import 'package:flutter/material.dart';

class RegisSuccessView extends StatelessWidget {
  const RegisSuccessView({super.key});

  static const String routeName = '/regis-success';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.purple,
        ),
      ),
      backgroundColor: AppColors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
          vertical: AppSizes.padding * 2,
        ),
        child: AppButton(
          elevation: 6,
          text: 'CONTINUE',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginView.routeName,
              ModalRoute.withName(RegisSuccessView.routeName),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.imageSuccessPath),
          const SizedBox(height: AppSizes.height * 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 2.5),
            child: Column(children: [
              Text(
                'Phone Number Verified',
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
                'Congradulations, your phone number has been verified. You can start using the app',
                style: AppTextStyle.light(
                  context,
                  fontSize: AppSizes.height * 1.4,
                  color: AppColors.baseLv4,
                ),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
