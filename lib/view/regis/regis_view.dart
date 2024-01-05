import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:apotech_apps/app/widget/app_text_field.dart';
import 'package:apotech_apps/view/login/login_view.dart';
import 'package:apotech_apps/view/otp/otp_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String routeName = '/regis';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginView.routeName,
              ModalRoute.withName(RegisterView.routeName),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.base,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 1.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Your Account',
              style: AppTextStyle.bold(
                context,
                fontSize: AppSizes.height * 2,
                color: AppColors.purple,
              ),
            ),
            const SizedBox(height: AppSizes.height * 2),
            AppTextField(
              label: 'Your Name',
              onChanged: (value) {},
            ),
            const SizedBox(height: AppSizes.height),
            AppTextField(
              label: 'Mobile Number',
              keyboardType: TextInputType.phone,
              onChanged: (value) {},
            ),
            const SizedBox(height: AppSizes.height),
            AppTextField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
            ),
            const SizedBox(height: AppSizes.height),
            AppTextField(
              label: 'Password',
              obscureText: true,
              suffixIcon: const Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.baseLv5,
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: AppSizes.height * 4),
            AppButton(
              text: 'CREATE ACCOUNT',
              elevation: 8,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  OTPView.routeName,
                  ModalRoute.withName(RegisterView.routeName),
                );
              },
            ),
            const SizedBox(height: AppSizes.height / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginView.routeName,
                      ModalRoute.withName(RegisterView.routeName),
                    );
                  },
                  child: Text(
                    'Already have account? Login',
                    style: AppTextStyle.regular(
                      context,
                      color: AppColors.baseLv5,
                      fontSize: AppSizes.height * 1.4,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
