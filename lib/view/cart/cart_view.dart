import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:apotech_apps/app/widget/app_product_card.dart';
import 'package:apotech_apps/view/checkout/chekout_view.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  static const String routeName = '/cart';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
          'Your Cart',
          style: AppTextStyle.bold(
            context,
            fontSize: 16,
            color: AppColors.purple,
          ),
        ),
      ),
      body: body(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: AppButton(
          text: 'Place Order Rp 30.000',
          elevation: 6,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              CheckoutView.routeName,
              ModalRoute.withName(CartView.routeName),
            );
          },
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headlineTitle(),
            const SizedBox(height: AppSizes.height),
            productOrder(),
            const SizedBox(height: AppSizes.height),
            couponCard(),
            const SizedBox(height: AppSizes.height),
            paymentDetail(),
          ],
        ),
      ),
    );
  }

  Widget headlineTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '2 Items In Your Cart',
          style: AppTextStyle.light(
            context,
            fontSize: AppSizes.height * 1.1,
            color: AppColors.baseLv4,
          ),
          textAlign: TextAlign.center,
        ),
        AppButton(
          text: 'Add To More',
          textColor: AppColors.primary,
          leftIcon: Icons.add_box_outlined,
          leftIconColor: AppColors.primary,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(0),
          onPressed: () {},
        )
      ],
    );
  }

  Widget productOrder() {
    return const Column(
      children: [
        ProductOrderCard(
          price: 'Rp 25.000',
        ),
        SizedBox(height: AppSizes.height),
        Divider(
          thickness: 2,
          color: AppColors.baseLv7,
        ),
        SizedBox(height: AppSizes.height),
        ProductOrderCard(
          image: AppAssets.imageMiniProduct2Path,
          price: 'Rp 15.000',
        ),
        SizedBox(height: AppSizes.height),
        Divider(
          thickness: 2,
          color: AppColors.baseLv7,
        ),
      ],
    );
  }

  Widget couponCard() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.baseLv6,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.padding / 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.discount_outlined,
                  color: AppColors.base,
                  size: 18,
                ),
                SizedBox(width: AppSizes.height),
                Text(
                  '1 Coupon Applied',
                  style: AppTextStyle.medium(context, fontSize: 14, color: AppColors.green),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.baseLv4,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: const EdgeInsets.all(AppSizes.height / 4),
                  child: Icon(
                    Icons.close,
                    color: AppColors.baseLv4,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget paymentDetail() {
    return headerWithWrapper(
      'Payment Summary',
      Column(
        children: [
          betweenText('Order Total', 'Rp 35.000', 14),
          const SizedBox(height: AppSizes.height * 1.5),
          betweenText('Item Discount', '- Rp 4.000', 14),
          const SizedBox(height: AppSizes.height * 1.5),
          betweenText('Coupon Discount', '- Rp 1.000', 14),
          const SizedBox(height: AppSizes.height * 1.5),
          betweenText('Shipping', 'FREE', 14),
          const SizedBox(height: AppSizes.height),
          const Divider(thickness: 2, color: AppColors.baseLv7),
          const SizedBox(height: AppSizes.height),
          betweenTextBold('Total', 'Rp 30.000', 16),
        ],
      ),
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

  Widget betweenText(
    String? title,
    String? subtitle,
    double? fontSize,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: AppTextStyle.regular(
            context,
            fontSize: fontSize ?? 14,
            color: Color(0x72090F47),
          ),
        ),
        Text(
          subtitle ?? '',
          style: AppTextStyle.regular(
            context,
            fontSize: fontSize ?? 14,
            color: AppColors.purple,
          ),
        ),
      ],
    );
  }

  Widget betweenTextBold(
    String? title,
    String? subtitle,
    double? fontSize,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: AppTextStyle.medium(
            context,
            fontSize: fontSize ?? 14,
            color: AppColors.purple,
          ),
        ),
        Text(
          subtitle ?? '',
          style: AppTextStyle.medium(
            context,
            fontSize: fontSize ?? 14,
            color: AppColors.purple,
          ),
        ),
      ],
    );
  }
}
