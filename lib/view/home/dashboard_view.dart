import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_bottom_navigation.dart';
import 'package:apotech_apps/app/widget/app_brands_child.dart';
import 'package:apotech_apps/app/widget/app_categories_child.dart';
import 'package:apotech_apps/app/widget/app_product_child.dart';
import 'package:apotech_apps/app/widget/app_text_field.dart';
import 'package:apotech_apps/view/category/category_view.dart';
import 'package:apotech_apps/view/login/login_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app/theme/app_colors.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  static const String routeName = '/dashboard';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  double initialPage = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.baseLv7,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const AppBottomNavigation(),
      appBar: appBar(),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
          return true;
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            body(),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        AppAssets.imageOnboard3Path,
                      )),
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  border: Border.all(
                    color: AppColors.white,
                    width: 3.0,
                  )),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    color: AppColors.white,
                    size: AppSizes.height * 2,
                  ),
                ),
                const SizedBox(
                  width: AppSizes.height,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.white,
                    size: AppSizes.height * 2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headline(),
          const SizedBox(height: AppSizes.height),
          topCategories(),
          const SizedBox(height: AppSizes.height),
          containerSlider(),
          const SizedBox(height: AppSizes.height),
          dealsDay(),
          const SizedBox(height: AppSizes.height),
          featureBrand(),
          const SizedBox(height: AppSizes.height * 4)
        ],
      ),
    );
  }

  Widget headline() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 185,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppSizes.padding * 3,
                    right: AppSizes.padding,
                    left: AppSizes.padding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Hi Lorem',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: AppSizes.height * 2,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: AppSizes.height,
                      ),
                      Text(
                        'Welcome To Apotech',
                        style: AppTextStyle.light(
                          context,
                          fontSize: AppSizes.height * 1.4,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 174,
                child: Container(
                  width: 450,
                  height: 450,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white.withOpacity(0.07000000029802322),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x11000000),
                        blurRadius: 14,
                        offset: Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  child: AppTextField(
                    hintText: 'Search Medicine & Healthcare products',
                    hintStyle: AppTextStyle.regular(
                      context,
                      color: AppColors.baseLv5,
                    ),
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.baseLv5,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
                    onChanged: (value) {},
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget containerSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              height: 140.0,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  initialPage = index.toDouble();
                });
              },
            ),
            items: [
              1,
              2,
              3
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AppAssets.imageBGSliderPath,
                              )),
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppSizes.padding * 1.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                'Save extra on every order',
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: AppTextStyle.bold(
                                  context,
                                  fontSize: 20,
                                  color: Color(0xFF1987FB),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSizes.height),
                            SizedBox(
                              width: 150,
                              child: Text(
                                'Etiam mollis metus non faucibus .',
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: AppTextStyle.regular(
                                  context,
                                  fontSize: 12,
                                  color: AppColors.baseLv5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.padding / 2),
            child: DotsIndicator(
              dotsCount: 3,
              position: initialPage,
              decorator: const DotsDecorator(
                size: Size(6, 6),
                activeSize: Size(6, 6),
                spacing: EdgeInsets.all(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topCategories() {
    return headerWithWrapper(
        'Top Categories',
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoriesChild(
                    context: context,
                    text: 'Dental',
                    icon: AppAssets.iconToothPath,
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0xFFFF9598),
                        Color(0xFFFF70A7)
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        CategoryView.routeName,
                        ModalRoute.withName(DashboardView.routeName),
                      );
                    },
                  ),
                  const SizedBox(width: AppSizes.height),
                  CategoriesChild(
                    context: context,
                    text: 'Wellness',
                    icon: AppAssets.iconLeafPath,
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0xFF19E5A5),
                        Color(0xFF15BD92)
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        CategoryView.routeName,
                        ModalRoute.withName(DashboardView.routeName),
                      );
                    },
                  ),
                  const SizedBox(width: AppSizes.height),
                  CategoriesChild(
                    context: context,
                    text: 'Homeo',
                    icon: AppAssets.iconMedicinePath,
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0xFFFFC06F),
                        Color(0xFFFF793A)
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        CategoryView.routeName,
                        ModalRoute.withName(DashboardView.routeName),
                      );
                    },
                  ),
                  const SizedBox(width: AppSizes.height),
                  CategoriesChild(
                    context: context,
                    text: 'Eye Care',
                    icon: AppAssets.iconMedicinePath,
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0xFF4DB7FF),
                        Color(0xFF3E7DFF)
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        CategoryView.routeName,
                        ModalRoute.withName(DashboardView.routeName),
                      );
                    },
                  ),
                  const SizedBox(width: AppSizes.height),
                  CategoriesChild(
                    context: context,
                    text: 'Skin & Hair',
                    icon: AppAssets.iconCirclePath,
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0xFF828282),
                        Color(0xFF080E47)
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        CategoryView.routeName,
                        ModalRoute.withName(DashboardView.routeName),
                      );
                    },
                  ),
                  const SizedBox(width: AppSizes.height),
                ],
              ),
            )
          ],
        ),
        '');
  }

  Widget dealsDay() {
    return headerWithWrapper(
        'Deals of the Day',
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductChild(
                    context: context,
                    title: 'Accu-check Active Test Strip',
                    price: 'Rp 112.000',
                    image: AppAssets.imageBottle1Path,
                    rate: '4.2',
                  ),
                  const SizedBox(width: AppSizes.height),
                  ProductChild(
                    context: context,
                    title: 'Omron HEM-8712 BP Monitor',
                    image: AppAssets.imageBottle2Path,
                    price: 'Rp 150.000',
                    rate: '4.5',
                  ),
                  const SizedBox(width: AppSizes.height),
                ],
              ),
            )
          ],
        ),
        'More');
  }

  Widget featureBrand() {
    return headerWithWrapper(
        'Featured Brands',
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandsChild(
                    context: context,
                    text: 'Himalaya Wellness',
                    image: AppAssets.imageHimalayaPath,
                  ),
                  const SizedBox(width: AppSizes.height),
                  BrandsChild(
                    context: context,
                    text: 'Accu-Chek',
                    image: AppAssets.imageAccuPath,
                  ),
                  const SizedBox(width: AppSizes.height),
                  BrandsChild(
                    context: context,
                    text: 'Vlcc',
                    image: AppAssets.imageVlccPath,
                  ),
                  const SizedBox(width: AppSizes.height),
                  BrandsChild(
                    context: context,
                    text: 'Protinex',
                    image: AppAssets.imageProtinexPath,
                  ),
                  const SizedBox(width: AppSizes.height),
                ],
              ),
            )
          ],
        ),
        '');
  }

  Widget headerWithWrapper(String text, Widget children, String? subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding, horizontal: AppSizes.padding * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppTextStyle.semiBold(context, fontSize: 16, color: AppColors.purple),
              ),
              Text(
                subtitle ?? '',
                style: AppTextStyle.medium(context, fontSize: 14, color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.height * 2,
          ),
          children,
        ],
      ),
    );
  }
}
