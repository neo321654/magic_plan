import 'package:flutter/material.dart';
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
  static TextStyle t3Bold = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 20.toFigma,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.8,
  );
  static TextStyle calloutBlue = TextStyle(
    color: AppColors.accentsPrimary,
    fontSize: 16.toFigma,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.8,
  );
  static TextStyle callout = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 16.toFigma,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.8,
  );
}
