import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ecommerce_app/view_model/deals_view_model.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/size_config.dart';
import 'package:flutter_ecommerce_app/views/shared/utils/app_theam.dart';
import 'package:flutter_ecommerce_app/views/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig.init;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DealsViewModels(),
        ),
      ],
      child: MaterialApp(
        title: 'E-commerce App',
        theme: appTheme,
        home: const SplashScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
