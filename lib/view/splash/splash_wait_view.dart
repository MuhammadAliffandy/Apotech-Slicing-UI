import 'package:apotech_apps/view/onboarding/onboarding_view.dart';
import 'package:apotech_apps/view/splash/splash_view.dart';
import 'package:flutter/material.dart';

class SplashWaitView extends StatefulWidget {
  const SplashWaitView({super.key});

  @override
  State<SplashWaitView> createState() => _SplashWaitViewState();
}

class _SplashWaitViewState extends State<SplashWaitView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashView();
          } else {
            return const OnboardingView();
          }
        },
      ),
    );
  }
}
