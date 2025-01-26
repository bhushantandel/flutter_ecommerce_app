import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/views/shared/utils/custom_text_style.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.color_white,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.color_primary_blue),
  listTileTheme: ListTileThemeData(
      iconColor: AppColors.color_grey,
      titleTextStyle: TextStyle(
          color: AppColors.color_primary_black,
          fontSize: 14,
          fontWeight: FontWeight.w600)),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        color: AppColors.color_white,
        fontSize: 18,
        fontWeight: FontWeight.w600),
    backgroundColor: AppColors.color_primary_blue,
    foregroundColor: AppColors.color_white,
  ),
  iconTheme: IconThemeData(
    color: AppColors.color_grey,
    size: 24,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: CustomTextstyle.style_selected_tab,
    unselectedLabelStyle: CustomTextstyle.style_unselected_tab,
    labelColor: AppColors.color_white,
    unselectedLabelColor: AppColors.color_white,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColors.color_primary_red, width: 3),
    ),
  ),
  useMaterial3: true,
);
