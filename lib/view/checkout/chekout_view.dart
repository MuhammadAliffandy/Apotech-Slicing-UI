import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:apotech_apps/app/widget/app_buton.dart';
import 'package:apotech_apps/view/checkout/checkout_success_view.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  static const String routeName = '/checkout';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
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
          'Checkout',
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
          text: 'Pay Now Rp 30.000',
          elevation: 6,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              CheckoutSuccessView.routeName,
              ModalRoute.withName(CheckoutView.routeName),
            );
          },
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding * 1.5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.height),
            headlineTitle(),
            const SizedBox(height: AppSizes.height),
            addressList(),
            paymentList(),
            const SizedBox(height: AppSizes.height),
          ],
        ),
      ),
    );
  }

  Widget addressList() {
    return headerWithWrapper(
      'Delivery Address',
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          addressCard('Home'),
          const SizedBox(height: AppSizes.height),
          addressCard('Office'),
          const SizedBox(height: AppSizes.height),
          SizedBox(
            width: 150,
            child: AppButton(
              leftIcon: Icons.add,
              text: 'Add Address',
              textColor: AppColors.primary,
              leftIconColor: AppColors.primary,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.all(0),
            ),
          )
        ],
      ),
    );
  }

  Widget paymentList() {
    return headerWithWrapper(
      'Payment Method',
      Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.baseLv6,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding / 1.5),
          child: Column(
            children: [
              paymentCard('Credit Card', AppAssets.imageMastercardIconPath),
              const SizedBox(height: AppSizes.height),
              paymentCard('Paypal', AppAssets.imagePaypalIconPath),
              const SizedBox(height: AppSizes.height),
              paymentCard('Google Pay', AppAssets.imageGoogleIconPath),
              const SizedBox(height: AppSizes.height),
              paymentCard('Apple Pay', AppAssets.imageAppleIconPath),
              const SizedBox(height: AppSizes.height),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentCard(String title, String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.baseLv6,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                  padding: const EdgeInsets.all(AppSizes.padding / 1.5),
                  child: Image.asset(
                    image,
                  )),
            ),
            const SizedBox(width: AppSizes.height),
            Text(
              title,
              style: AppTextStyle.medium(context, fontSize: 16, color: AppColors.purple),
            ),
          ],
        ),
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
          shape: CircleBorder(),
          checkColor: AppColors.primary,
          activeColor: AppColors.primary,
          hoverColor: AppColors.primary.withOpacity(0.04),
          focusColor: AppColors.primary.withOpacity(0.12),
          splashRadius: 10,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }

  bool isChecked = false;

  Widget addressCard(String? title) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  shape: CircleBorder(),
                  checkColor: AppColors.primary,
                  activeColor: AppColors.primary,
                  hoverColor: AppColors.primary.withOpacity(0.04),
                  focusColor: AppColors.primary.withOpacity(0.12),
                  splashRadius: 10,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(width: AppSizes.height / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'Home',
                      style: AppTextStyle.medium(context, fontSize: 14, color: AppColors.purple),
                    ),
                    SizedBox(height: AppSizes.height / 1.5),
                    Text(
                      '(205) 555-024',
                      style: AppTextStyle.medium(context, fontSize: 14, color: Color(0x72090F47)),
                    ),
                    SizedBox(height: AppSizes.height / 1.5),
                    Text(
                      '1786 Wheeler Bridge',
                      style: AppTextStyle.medium(context, fontSize: 14, color: Color(0x72090F47)),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: const EdgeInsets.all(AppSizes.height / 4),
                child: Icon(
                  Icons.edit,
                  color: AppColors.baseLv4,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headlineTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'TOTAL',
              style: AppTextStyle.light(
                context,
                fontSize: AppSizes.height * 1.1,
                color: AppColors.baseLv4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.height / 1.5),
            Text(
              'Rp 30.000',
              style: AppTextStyle.medium(
                context,
                fontSize: 16,
                color: AppColors.purple,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget headerWithWrapper(String text, Widget children) {
    return Column(
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
    );
  }
}
