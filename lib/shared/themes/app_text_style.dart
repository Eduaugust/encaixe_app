import 'package:encaixe_app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final titleHeader = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w700);
  static final nameHeader = GoogleFonts.poppins(
      fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500);
  static final titleFooter = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w500);
  static final input =
      GoogleFonts.poppins(fontSize: 14, color: AppColors.black);
  static final inputCheckbox =
      GoogleFonts.poppins(fontSize: 12, color: AppColors.black);
  static final inputHeader = GoogleFonts.poppins(
      fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w600);
}
