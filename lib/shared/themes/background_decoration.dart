import 'package:encaixe_app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundDecoration {
  static const main = BoxDecoration(
      gradient: LinearGradient(
    colors: [
      AppColors.bege,
      AppColors.pink,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ));
}
