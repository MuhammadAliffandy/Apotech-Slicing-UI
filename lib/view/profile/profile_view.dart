import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_bottom_navigation.dart';

import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static const String routeName = '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'My Profile',
          style: AppTextStyle.bold(context, fontSize: 16, color: AppColors.purple),
        ),
      ),
      body: body(),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.height),
          profileName(),
          const SizedBox(height: AppSizes.height * 2),
          settingsList(),
        ],
      ),
    );
  }

  Widget settingsList() {
    return Column(
      children: [
        settingsCard('Private Account', AppAssets.iconNotePath),
        const Padding(
          padding: const EdgeInsets.only(left: AppSizes.padding * 2.5),
          child: const Divider(thickness: 2, color: AppColors.baseLv7),
        ),
        settingsCard('My Consults', AppAssets.iconStetoskopPath),
        const Padding(
          padding: const EdgeInsets.only(left: AppSizes.padding * 2.5),
          child: const Divider(thickness: 2, color: AppColors.baseLv7),
        ),
        settingsCard('My Order', AppAssets.iconPaperPath),
        const Padding(
          padding: const EdgeInsets.only(left: AppSizes.padding * 2.5),
          child: const Divider(thickness: 2, color: AppColors.baseLv7),
        ),
        settingsCard('Billing', AppAssets.iconClockPath),
        const Padding(
          padding: const EdgeInsets.only(left: AppSizes.padding * 2.5),
          child: const Divider(thickness: 2, color: AppColors.baseLv7),
        ),
        settingsCard('FAQ', AppAssets.iconQuestionPath),
        const Padding(
          padding: const EdgeInsets.only(left: AppSizes.padding * 2.5),
          child: const Divider(thickness: 2, color: AppColors.baseLv7),
        ),
        settingsCard('Settings', AppAssets.iconSettingPath),
      ],
    );
  }

  Widget profileName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: AppColors.white,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14091C3F),
                    blurRadius: 6,
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  )
                ],
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppAssets.imageUserPath,
                    ))),
          ),
          const SizedBox(width: AppSizes.height),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Lorem Ipsum',
                style: AppTextStyle.bold(context, fontSize: 20, color: AppColors.purple),
              ),
              const SizedBox(height: AppSizes.height / 2),
              Text(
                'Welcome to Apotech',
                style: AppTextStyle.regular(context, fontSize: 14, color: AppColors.purple.withOpacity(0.45)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget settingsCard(String title, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(icon),
              const SizedBox(width: AppSizes.height),
              Text(
                title,
                style: AppTextStyle.regular(
                  context,
                  fontSize: 16,
                  color: Color(0xBF091C3F),
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right,
                size: 18,
              ))
        ],
      ),
    );
  }
}
