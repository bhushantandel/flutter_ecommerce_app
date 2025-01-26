// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/shared/constants/app_colors.dart';

class CustomTextstyle {
  static TextStyle style_title_bold_white = TextStyle(
      fontSize: 20,
      color: AppColors.color_off_white,
      fontWeight: FontWeight.w700);

  static TextStyle textStyle_12_600_white = TextStyle(
      fontSize: 12, color: AppColors.color_white, fontWeight: FontWeight.w600);

  static TextStyle style_selected_tab =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);

  static TextStyle style_unselected_tab =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}
