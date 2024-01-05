import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:apotech_apps/app/widget/app_text_field.dart';
import 'package:apotech_apps/view/home/dashboard_view.dart';
import 'package:apotech_apps/view/regis/regis_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = '/login';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 1.5),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: AppTextStyle.bold(
                    context,
                    fontSize: AppSizes.height * 2,
                    color: AppColors.purple,
                  ),
                ),
                const SizedBox(height: AppSizes.height * 2),
                AppTextField(
                  label: 'Username',
                  prefixIcon: const Icon(
                    Icons.person_2_outlined,
                    color: AppColors.purple,
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: AppSizes.height),
                AppTextField(
                  label: 'Password',
                  obscureText: true,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.purple,
                  ),
                  suffixIcon: SizedBox(
                    width: 50,
                    height: 50,
                    child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot?',
                            style: AppTextStyle.regular(
                              context,
                              fontSize: 10,
                              color: AppColors.baseLv5,
                            ),
                          ),
                        )),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: AppSizes.height * 4),
                AppButton(
                  text: 'SIGN IN',
                  elevation: 8,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      DashboardView.routeName,
                      ModalRoute.withName(LoginView.routeName),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RegisterView.routeName,
                    ModalRoute.withName(LoginView.routeName),
                  );
                },
                child: Text(
                  'Dont have an account? Sign Up',
                  style: AppTextStyle.regular(
                    context,
                    color: AppColors.baseLv5,
                    fontSize: AppSizes.height * 1.4,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
