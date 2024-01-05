import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  static const String routeName = '/product-detail';

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double initialPage = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.base,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.purple,
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
                  color: AppColors.purple,
                  size: AppSizes.height * 2,
                ),
              ),
              const SizedBox(
                width: AppSizes.height,
              ),
            ],
          )
        ],
      ),
      body: body(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: AppButton(
          text: 'GO TO CART',
          elevation: 6,
          onPressed: () {},
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: ListView(
        children: [
          headline(),
          const SizedBox(height: AppSizes.height),
          containerSlider(),
          const SizedBox(height: AppSizes.height),
          priceWithCart(),
          packageList(),
          const SizedBox(height: AppSizes.height),
          descriptionText(),
          const SizedBox(height: AppSizes.height),
          reviewCard(),
          const SizedBox(height: AppSizes.height * 2),
          commentCard(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.height),
            child: const Divider(
              thickness: 2,
              color: AppColors.baseLv7,
            ),
          ),
          commentCard(),
          const SizedBox(height: AppSizes.height * 4),
        ],
      ),
    );
  }

  Widget headline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sugar Free Gold Low Calories',
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
          'Etiam mollis metus non purus ',
          style: AppTextStyle.light(
            context,
            fontSize: AppSizes.height * 1.4,
            color: AppColors.baseLv4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget containerSlider() {
    return Stack(
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
            AppAssets.imageCategory1Path,
            AppAssets.imageCategory3Path,
            AppAssets.imageCategory2Path,
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: Center(
                      child: Image.asset(i),
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
    );
  }

  Widget priceWithCart() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rp 56.000',
                  style: AppTextStyle.bold(
                    context,
                    fontSize: AppSizes.height * 1.5,
                    color: AppColors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSizes.height / 2,
                ),
                Text(
                  'Etiam mollis',
                  style: AppTextStyle.light(
                    context,
                    fontSize: AppSizes.height,
                    color: AppColors.baseLv4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            AppButton(
              text: 'Add To Cart',
              textColor: AppColors.primary,
              leftIcon: Icons.add_box_outlined,
              leftIconColor: AppColors.primary,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.all(0),
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: AppSizes.height),
        const Divider(
          thickness: 2,
          color: AppColors.baseLv7,
        )
      ],
    );
  }

  List<bool> initiatePackage = [
    false,
    false,
    false
  ];

  Widget packageList() {
    return headerWithWrapper(
        'Package Size',
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PackageBox(
                title: 'Rp 252.000',
                subtitle: '500 pellets',
                backgroundColor: initiatePackage[0] ? Color(0xFFFFA41B).withOpacity(0.10) : AppColors.baseLv6,
                borderColor: initiatePackage[0] ? Color(0xFFFFA41B) : Colors.transparent,
                textColor: initiatePackage[0] ? Color(0xFFFFA41B) : AppColors.purple,
                onTap: () {
                  setState(() {
                    for (int i = 0; i < initiatePackage.length; i++) {
                      if (i == 0) {
                        initiatePackage[i] = true;
                      } else {
                        initiatePackage[i] = false;
                      }
                    }
                  });
                },
              ),
              const SizedBox(width: AppSizes.height),
              PackageBox(
                title: 'Rp 100.000',
                subtitle: '100 pellets',
                backgroundColor: initiatePackage[1] ? Color(0xFFFFA41B).withOpacity(0.10) : AppColors.baseLv6,
                borderColor: initiatePackage[1] ? Color(0xFFFFA41B) : Colors.transparent,
                textColor: initiatePackage[1] ? Color(0xFFFFA41B) : AppColors.purple,
                onTap: () {
                  setState(() {
                    for (int i = 0; i < initiatePackage.length; i++) {
                      if (i == 1) {
                        initiatePackage[i] = true;
                      } else {
                        initiatePackage[i] = false;
                      }
                    }
                  });
                },
              ),
              const SizedBox(width: AppSizes.height),
              PackageBox(
                title: 'Rp 160.000',
                subtitle: '300 pellets',
                backgroundColor: initiatePackage[2] ? Color(0xFFFFA41B).withOpacity(0.10) : AppColors.baseLv6,
                borderColor: initiatePackage[2] ? Color(0xFFFFA41B) : Colors.transparent,
                textColor: initiatePackage[2] ? Color(0xFFFFA41B) : AppColors.purple,
                onTap: () {
                  setState(() {
                    for (int i = 0; i < initiatePackage.length; i++) {
                      if (i == 2) {
                        initiatePackage[i] = true;
                      } else {
                        initiatePackage[i] = false;
                      }
                    }
                  });
                },
              ),
            ],
          ),
        ));
  }

  Widget descriptionText() {
    return headerWithWrapper(
      'Product Details',
      Text(
        'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
        style: AppTextStyle.light(
          context,
          fontSize: AppSizes.height * 1.2,
          color: AppColors.baseLv4,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget reviewCard() {
    return headerWithWrapper(
      'Rating and Reviews',
      Container(
        child: Row(
          children: [
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '4.4',
                        style: AppTextStyle.bold(
                          context,
                          fontSize: AppSizes.height * 4,
                          color: AppColors.purple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        width: AppSizes.height,
                      ),
                      Icon(
                        Icons.star,
                        size: AppSizes.height * 4,
                        color: AppColors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSizes.height,
                  ),
                  Text(
                    '923 Ratings and 257 Reviews',
                    style: AppTextStyle.light(
                      context,
                      fontSize: AppSizes.height * 1.2,
                      color: AppColors.baseLv4,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 2,
              height: 100,
              color: AppColors.baseLv6,
            ),
            const SizedBox(width: AppSizes.padding / 1.5),
            Expanded(
              child: Column(
                children: [
                  indicatorProgress('5', 100, '67%'),
                  SizedBox(height: AppSizes.height / 1.5),
                  indicatorProgress('4', 100, '67%'),
                  SizedBox(height: AppSizes.height / 1.5),
                  indicatorProgress('3', 100, '67%'),
                  SizedBox(height: AppSizes.height / 1.5),
                  indicatorProgress('2', 100, '67%'),
                  SizedBox(height: AppSizes.height / 1.5),
                  indicatorProgress('1', 100, '67%'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget commentCard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lorem Hoffman',
              style: AppTextStyle.medium(
                context,
                fontSize: AppSizes.height * 1.2,
                color: AppColors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '05- oct 2023',
              style: AppTextStyle.medium(
                context,
                fontSize: AppSizes.height * 1.2,
                color: AppColors.baseLv5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.height),
        Row(
          children: [
            Icon(
              Icons.star,
              size: AppSizes.height * 1.5,
              color: AppColors.yellow,
            ),
            SizedBox(width: AppSizes.height / 2),
            Text('4.2',
                style: AppTextStyle.medium(
                  context,
                  fontSize: 14,
                  color: AppColors.baseLv5,
                )),
          ],
        ),
        const SizedBox(height: AppSizes.height),
        Text(
          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
          style: AppTextStyle.light(
            context,
            fontSize: AppSizes.height * 1.2,
            color: AppColors.baseLv4,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Widget headerWithWrapper(String text, Widget children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyle.semiBold(
              context,
              fontSize: 16,
              color: AppColors.purple,
            ),
          ),
          const SizedBox(
            height: AppSizes.height * 1.5,
          ),
          children,
        ],
      ),
    );
  }

  Widget indicatorProgress(String? text, double? countIndicator, String? count) {
    return Row(
      children: [
        Text(text ?? '4',
            style: AppTextStyle.medium(
              context,
              fontSize: 14,
              color: AppColors.baseLv5,
            )),
        Icon(
          Icons.star,
          size: AppSizes.height * 1.5,
          color: AppColors.yellow,
        ),
        const SizedBox(width: AppSizes.height / 1.5),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 6,
                decoration: const BoxDecoration(
                    color: AppColors.baseLv6,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
              ),
              Container(
                height: 4,
                width: countIndicator ?? 100,
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSizes.height / 1.5),
        Text(count ?? '67%',
            style: AppTextStyle.medium(
              context,
              fontSize: 14,
              color: AppColors.baseLv5,
            )),
      ],
    );
  }
}

class PackageBox extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final void Function()? onTap;

  const PackageBox({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.subtitle,
    this.title,
    this.textColor,
    this.onTap,
  });

  @override
  State<PackageBox> createState() => _PackageBoxState();
}

class _PackageBoxState extends State<PackageBox> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.baseLv6,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: widget.borderColor ?? Colors.transparent,
          )),
      child: InkWell(
        onTap: widget.onTap ?? () {},
        splashColor: AppColors.base.withOpacity(0.10),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            children: [
              Text(
                widget.title ?? '',
                style: AppTextStyle.bold(
                  context,
                  fontSize: AppSizes.height,
                  color: widget.textColor ?? AppColors.purple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.height,
              ),
              Text(
                widget.subtitle ?? '',
                style: AppTextStyle.regular(
                  context,
                  fontSize: AppSizes.height,
                  color: widget.textColor ?? AppColors.baseLv2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
