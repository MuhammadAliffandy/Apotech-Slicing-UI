import 'package:apotech_apps/view/cart/cart_view.dart';
import 'package:apotech_apps/view/category/category_view.dart';
import 'package:apotech_apps/view/checkout/checkout_success_view.dart';
import 'package:apotech_apps/view/checkout/chekout_view.dart';
import 'package:apotech_apps/view/home/dashboard_view.dart';
import 'package:apotech_apps/view/home/home_view.dart';
import 'package:apotech_apps/view/login/login_view.dart';
import 'package:apotech_apps/view/onboarding/onboarding_view.dart';
import 'package:apotech_apps/view/otp/otp_view.dart';
import 'package:apotech_apps/view/product_details/product_details.dart';
import 'package:apotech_apps/view/profile/profile_view.dart';
import 'package:apotech_apps/view/regis/regis_success_view.dart';
import 'package:apotech_apps/view/regis/regis_view.dart';
import 'package:flutter/material.dart';

import '../../view/splash/splash_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashView.routeName: (context) => const SplashView(),
    OnboardingView.routeName: (context) => const OnboardingView(),
    HomeView.routeName: (context) => const HomeView(),
    LoginView.routeName: (context) => const LoginView(),
    RegisterView.routeName: (context) => const RegisterView(),
    OTPView.routeName: (context) => const OTPView(),
    RegisSuccessView.routeName: (context) => const RegisSuccessView(),
    CheckoutSuccessView.routeName: (context) => const CheckoutSuccessView(),
    DashboardView.routeName: (context) => const DashboardView(),
    CategoryView.routeName: (context) => const CategoryView(),
    ProductDetailsView.routeName: (context) => const ProductDetailsView(),
    CartView.routeName: (context) => const CartView(),
    CheckoutView.routeName: (context) => const CheckoutView(),
    ProfileView.routeName: (context) => const ProfileView(),
  };
}
