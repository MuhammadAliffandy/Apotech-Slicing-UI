import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_mini_product.dart';
import 'package:apotech_apps/app/widget/app_product_category_child.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  static const String routeName = '/category';

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.purple,
        ),
        title: Text(
          'Diabetes Care',
          style: AppTextStyle.bold(
            context,
            fontSize: 16,
            color: AppColors.purple,
          ),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 1.5),
      child: ListView(
        children: [
          banner(),
          const SizedBox(height: AppSizes.height),
          miniProductList(),
          const SizedBox(height: AppSizes.height),
          categoryProductList(),
          const SizedBox(height: AppSizes.height * 4),
        ],
      ),
    );
  }

  Widget banner() {
    return Container(
        height: 150,
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
  }

  Widget miniProductList() {
    return headerWithWrapper(
        'Diabetic Diet',
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MiniProductChild(
                context: context,
                text: 'Sugar Substitute',
                image: AppAssets.imageMiniProduct1Path,
              ),
              const SizedBox(width: AppSizes.height * 1.5),
              MiniProductChild(
                context: context,
                text: 'Juices & Vinegars',
                image: AppAssets.imageMiniProduct2Path,
              ),
              const SizedBox(width: AppSizes.height * 1.5),
              MiniProductChild(
                context: context,
                text: 'Vitamins Medicines',
                image: AppAssets.imageMiniProduct3Path,
              ),
            ],
          ),
        ));
  }

  List items = [
    const ProductCategoryChild(
      title: 'Accu-check Active Test Strip',
      rate: '4.5',
      price: 'Rp 150.000',
      image: AppAssets.imageCategory1Path,
      isLabel: true,
      labelColor: AppColors.red,
      labelText: '  SALE  ',
    ),
    const ProductCategoryChild(
      title: 'Omron HEM-8712 BP Monitor',
      rate: '4.5',
      price: 'Rp 150.000',
      image: AppAssets.imageCategory2Path,
      isLabel: true,
      labelColor: AppColors.yellow,
      labelText: '15% OFF',
    ),
    const ProductCategoryChild(
      title: 'Omron HEM-8712 BP Monitor',
      rate: '4.5',
      price: 'Rp 150.000',
      image: AppAssets.imageCategory3Path,
    ),
    const ProductCategoryChild(
      title: 'Accu-check Active Test Strip',
      rate: '4.5',
      price: 'Rp 150.000',
      image: AppAssets.imageCategory4Path,
    ),
  ];

  Widget categoryProductList() {
    return headerWithWrapper(
        'All Products',
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSizes.height * 2,
            crossAxisSpacing: AppSizes.height,
            childAspectRatio: 0.60,
          ),
          padding: EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              child: Center(
                child: items[index],
              ),
            );
          },
        ));
  }

  Widget headerWithWrapper(String text, Widget children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding, horizontal: AppSizes.padding),
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
            height: AppSizes.height * 2,
          ),
          children,
        ],
      ),
    );
  }
}
