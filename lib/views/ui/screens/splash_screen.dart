import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/views/shared/utils/shared_prefrence_utils.dart';
import 'package:flutter_ecommerce_app/views/ui/screens/deals_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer t;

  @override
  void initState() {
    super.initState();

    SharedPreferenceUtils.initSharedPref();

    t = Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const DealsScreen(),
              settings: const RouteSettings(name: 'deal_screen')));
    });
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_screen_logo.jpeg',
              height: 80,
              width: 80,
            ),
            Text(
              'PARITY',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.color_primary_black),
            ),
            Text(
              'CUBE',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.color_primary_yellow),
            )
          ],
        ),
      ),
    );
  }
}
