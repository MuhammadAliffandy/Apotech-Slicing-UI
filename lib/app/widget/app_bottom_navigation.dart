import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({
    super.key,
  });

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  double initialButton = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        padding: const EdgeInsets.all(AppSizes.padding / 1.5),
        decoration: const BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(
            color: Color(0x0A090F47),
            blurRadius: 14,
            offset: Offset(0, -7),
            spreadRadius: 0,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                splashColor: AppColors.base.withOpacity(0.10),
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    initialButton = 1;
                  });
                },
                icon: Icon(
                  Icons.home_outlined,
                  size: 22,
                  color: initialButton == 1 ? AppColors.primary : Color(0xFF090F4773).withOpacity(0.45),
                )),
            IconButton(
                splashColor: AppColors.base.withOpacity(0.10),
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    initialButton = 2;
                  });
                },
                icon: Icon(
                  Icons.notifications_none,
                  size: 22,
                  color: initialButton == 2 ? AppColors.primary : Color(0xFF090F4773).withOpacity(0.45),
                )),
            GestureDetector(
              onTap: () {
                setState(() {
                  initialButton = 5;
                });
              },
              child: Ink(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  child: const Icon(
                    Icons.add_box_outlined,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            IconButton(
                splashColor: AppColors.base.withOpacity(0.10),
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    initialButton = 3;
                  });
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 22,
                  color: initialButton == 3 ? AppColors.primary : Color(0xFF090F4773).withOpacity(0.45),
                )),
            IconButton(
                splashColor: AppColors.base.withOpacity(0.10),
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    initialButton = 4;
                  });
                },
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 22,
                  color: initialButton == 4 ? AppColors.primary : Color(0xFF090F4773).withOpacity(0.45),
                )),
          ],
        ),
      ),
    );
  }
}
