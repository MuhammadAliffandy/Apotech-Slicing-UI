import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/view/splash/splash_wait_view.dart';
import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import 'screens/../list_menu_view.dart';

// TODO REMOVE
// DEV PUSPOSE ONLY
class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Apotech',
                        style: AppTextStyle.bold(context, fontSize: 22),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'Apotech Prototype',
                        style: AppTextStyle.medium(context, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SplashWaitView(),
                      ),
                    ),
                    child: Text(
                      "Main app",
                      style: AppTextStyle.bold(context, color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListMenuView(),
                        ),
                      ),
                      child: Text(
                        "List Page",
                        style: AppTextStyle.bold(context, color: AppColors.white),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
