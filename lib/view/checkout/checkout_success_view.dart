import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:apotech_apps/view/home/dashboard_view.dart';
import 'package:flutter/material.dart';

class CheckoutSuccessView extends StatelessWidget {
  const CheckoutSuccessView({super.key});

  static const String routeName = '/checkout-success';

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
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
          vertical: AppSizes.padding * 2,
        ),
        child: AppButton(
          text: 'Continue Order',
          elevation: 6,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              DashboardView.routeName,
              ModalRoute.withName(CheckoutSuccessView.routeName),
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
                'Thank You',
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
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'This is a ',
                  style: AppTextStyle.light(
                    context,
                    fontSize: AppSizes.height * 1.4,
                    color: AppColors.baseLv4,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Your Order will be delivered with invoice',
                    ),
                    TextSpan(
                      text: ' #INV20231212.',
                      style: AppTextStyle.medium(
                        context,
                        fontSize: AppSizes.height * 1.4,
                        color: Color(0xFF090F47),
                      ),
                    ),
                    const TextSpan(
                      text: 'You can track the delivery in the order section.',
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
