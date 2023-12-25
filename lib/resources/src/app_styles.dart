import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:magic_plan/resources/resources.dart';



abstract class AppTextStyles {


  static TextStyle bodyBold = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 17.toFigma,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subheadline = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 15.toFigma,
    fontWeight: FontWeight.w500,

  );
}
