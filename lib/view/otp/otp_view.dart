import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:apotech_apps/app/widget/app_text_field_otp.dart';
import 'package:apotech_apps/view/regis/regis_success_view.dart';
import 'package:flutter/material.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  static const String routeName = '/otp';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.base,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the verify code',
              style: AppTextStyle.bold(
                context,
                fontSize: AppSizes.height * 2,
              ),
            ),
            const SizedBox(height: AppSizes.height),
            Text(
              'We just send you a verification code via phone +62 921 39 488 953',
              style: AppTextStyle.regular(
                context,
                color: AppColors.baseLv5,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: AppSizes.height),
            Row(
              children: [
                Expanded(
                  child: AppTextFieldOTP(
                    label: '0',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: AppSizes.height),
                Expanded(
                  child: AppTextFieldOTP(
                    label: '0',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: AppSizes.height),
                Expanded(
                  child: AppTextFieldOTP(
                    label: '0',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: AppSizes.height),
                Expanded(
                  child: AppTextFieldOTP(
                    label: '0',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: AppSizes.height),
                Expanded(
                  child: AppTextFieldOTP(
                    label: '0',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: AppSizes.height),
                Expanded(
                  child: AppTextFieldOTP(
                    label: '0',
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: AppSizes.height),
              ],
            ),
            const SizedBox(height: AppSizes.height * 4),
            AppButton(
              text: 'SUBMIT CODE',
              elevation: 8,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RegisSuccessView.routeName,
                  ModalRoute.withName(OTPView.routeName),
                );
              },
            ),
            const SizedBox(height: AppSizes.height / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'The verify code will expire in 00:59',
                    style: AppTextStyle.regular(
                      context,
                      color: AppColors.baseLv5,
                      fontSize: AppSizes.height * 1.4,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                    style: AppTextStyle.regular(
                      context,
                      color: AppColors.primary,
                      fontSize: AppSizes.height * 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
