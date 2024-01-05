import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_onboarding.dart';
import 'package:apotech_apps/view/home/home_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static const String routeName = '/onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  double initialPage = 0;
  final PageController _pageController = PageController();
  final List pages = const [
    Onboarding(
      image: AppAssets.imageOnboard1Path,
      title: 'View and buy Medicine online',
      subtitle: 'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
    ),
    Onboarding(
      image: AppAssets.imageOnboard2Path,
      title: 'Online medical & Healthcare',
      subtitle: 'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
    ),
    Onboarding(
      image: AppAssets.imageOnboard3Path,
      title: 'Get Delivery on time',
      subtitle: 'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: pages[index],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding,
              vertical: AppSizes.padding * 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeView.routeName,
                      ModalRoute.withName(OnboardingView.routeName),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: AppTextStyle.semiBold(context, color: AppColors.baseLv5),
                  ),
                ),
                DotsIndicator(
                  dotsCount: pages.length,
                  position: initialPage,
                  decorator: const DotsDecorator(
                    size: Size(6, 6),
                    activeSize: Size(6, 6),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (initialPage < 2) {
                          initialPage = initialPage + 1;
                        }

                        if (_pageController.page! < 2) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }

                        if (_pageController.page! == 2) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeView.routeName,
                            ModalRoute.withName(OnboardingView.routeName),
                          );
                        }
                      });
                    },
                    child: Text(
                      'Next',
                      style: AppTextStyle.semiBold(context, color: AppColors.primary),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
